Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815EEC71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AEE10E7C6;
	Thu, 12 Jun 2025 10:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYoiCUAX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B33710E7C6
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 10:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749725422; x=1781261422;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=PvWs4qiMYgjKtV2x4YKMqUj6B0WQaItDvv7VN46DyrY=;
 b=YYoiCUAXEcSCil+lv6D2CEmZD8PIxcPSi6ocMrezPOkOMtxeMp+4Zqd2
 8qi8dgHJr2h6AcmioF4tD+n/UCQ9DdvQhvEVz/5y8AEZNZmbm2ZEezDJA
 dNzcZe+/B2x6Du98c6LtFuyW9JguqnCboSsQjg9wCRAH4cHO/Ziaf52oa
 U1/dT/9bhinUVNkfm+HMrDMfNO4mCjWuVGZSukO324h6sqJl8+3lotfHx
 v2MYz4mOXOV+6/US2WBp1teLjbcswNkF2qlxCWlymSHP3LQN6pEja3cV5
 rbOoRjzrhJBIdjByHMOqszYRGVWH1e9MaQReyin9ztQ4HYzwOxGuTmeXF w==;
X-CSE-ConnectionGUID: oyxuuNW1TKWFE3+0F6f7Xg==
X-CSE-MsgGUID: zrlK4kRmRl6T1LZ0+s0vVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51995622"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208,217";a="51995622"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:50:21 -0700
X-CSE-ConnectionGUID: uTt3NxLKSsGFjdpuLAK0MA==
X-CSE-MsgGUID: yRSydDiqRQOzglZKhzvHbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
 d="scan'208,217";a="147388796"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:50:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:50:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 03:50:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:50:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSCft9vCdzCl4ZDsLejtFTSClvQj7uuR5YThlO+UBxt56HiFcUF8OssBfAwQ3WM+qVreNVNV91RrvlzPxWktazv53WIJRGb3P7HhJediC2p0/SUXikdeW8G4C0gue95d/BDvl8RHZH/O3+p1BXxiyB0PCZVRe14n4ZndqgA8gBjefsGpouqHMxEK2aRV+KakjxyuyR19QfbjDvD9dly3tg6SSofOHobxxZcjItOF+Q2ftJmptXZ5KxYeO5rf9jubSWz9S2ddiJrPpG2sA9qhyNoZvxnN1VLmndGRo5blcP7AgyMj2y3BIyXfNU5lGp+DCma2McNi9aw6EfHv4IiBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E4GtV+yDIjtEaAYRtD71wedN3BYIWpGQ/iBDRx5EtE=;
 b=vVN8xQNm+oMssdmMjBafj+GHNwAVbrLLnsz6GKX6BOVPjGxjzTsC+Zfr2KsOGc0fe/mDiVqr28X4vzGYx+1G70qWi0CmscG4ZpwaOKuFolZOCmg6jF+rJQmBwgsrGzTYYGnFxWhax83osVqVkssIFQQCQ5xPY1j5Jx7HJ2NS3YE3MRd3FSfdhQi6Vy4jeXi5xanz0dqxOk/0QR1XppTp7csFu4kT050c6iEUcy1Sh2448wVAvAUy8DVVCL/1h8Xtn3lFO63oKjDf09wJlEgZwiUHvHhA0wymoxIK/+BwOJhAKFQzskNGQBKBUHXx+vg0GjFv8zE8De7hfjYQOVQVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DM4PR11MB6477.namprd11.prod.outlook.com (2603:10b6:8:88::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.22; Thu, 12 Jun 2025 10:50:04 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Thu, 12 Jun 2025
 10:50:04 +0000
Content-Type: multipart/alternative;
 boundary="------------0FtJWtppxvn71Gz30veYmdLX"
Message-ID: <01c5574f-ea81-4da6-9a60-fee58e17f268@intel.com>
Date: Thu, 12 Jun 2025 16:19:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Fix xe_hwmon_power_max_write
Content-Language: en-GB
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>
References: <20250609061345.3084177-1-karthik.poosa@intel.com>
 <c7231452-78d3-4410-a309-f04d23d7b0f2@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <c7231452-78d3-4410-a309-f04d23d7b0f2@intel.com>
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|DM4PR11MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cf9de8-6b76-4bcb-27be-08dda99ee38c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZU1LU2kyRHBaQUcrekwyWDJCb1M5WXZDODBYYlpNRmtBUEtFWEJHQVlVU3N0?=
 =?utf-8?B?QmdQVVdlQm0xTll3cDFianBpS2xDREVCUVJlRFhOMGxXODhONDZYWVFxcjBM?=
 =?utf-8?B?WlU5Z3ZwSWVSQnA1dGJmMkNFTE1ZTEFoTnI1ZUp5Z1J0Q1lmVG9rcTJsdGNT?=
 =?utf-8?B?Um1zZFpnbVNEMlBDckVsc0VuQWlYcGpReWk3Wi9icE5JbDkzeVJkZmpmTFM0?=
 =?utf-8?B?U1o2cVBhUXM1WWhVeVZoNmo4TkZhS1lKYm40OG10OXNKR3NNbEpGQ1p0b2Zi?=
 =?utf-8?B?RWgxLzMrQjVZdVVuamhsbzM4M1JiYitrYzBqUGFjd1Y0eHFsdGpKc3AyTElh?=
 =?utf-8?B?OXpsaEZDM29ob01Da0FEVmw2SThrV1N2ZzU2Tk92aGtTWTEvTVk4YVkyYVdt?=
 =?utf-8?B?M3J6YVJJRUJoVWxEc0JSMlVSTTBiNWNkWmlRRTg1OWpzYnRERDhBa0NpS0Y2?=
 =?utf-8?B?Z25aZkQ0bXBDMHJrYnU1QVpsM0xFWXR4QnFRRTZDVzBacEZhVWY0L0xlbFVV?=
 =?utf-8?B?T3BVbnE5THY3dmlDR1diQmtBTE9jeERhZyt4LzN0NUQ3M0ROTm96RWZjV1Br?=
 =?utf-8?B?L2M2Ky9YRXhEOFNLSy9teTVNNGh3MmttR0lpRXB3WVRnRitqNXU1V215WXNP?=
 =?utf-8?B?ZGNHWlRyNTdlT3hEdDVPdzJheFNxNk5tVnJxbmgrZk1TRzVZMXNYSjFaeU9m?=
 =?utf-8?B?NjhvaU0zMEpmRmM0b2FEbmpCWW03WE9MVTFrUUpxSXpEWTNRRmJQVWllMjBK?=
 =?utf-8?B?dlI0eUpGS1pBUktBTklXQTMrSVRIOHlYVXNRd2dQQW1yTnRJUlpLaTFYY09V?=
 =?utf-8?B?NXBGMUVGREFid2ZwbUdLSmlaZkw2ZWtWZVcreXdpM1dvSDA5anhHUVVsczV4?=
 =?utf-8?B?K2VXeGgrM1QwTzZEV0JVU0MvMmRTYVJ5UkFrNGg1NXU3TW1kSXZLS1Ntd1Nw?=
 =?utf-8?B?TmJETHNqNzM4QnJNeUJXVXBReGJEbHorUUE1N0tjMmxlRytOcExhSGNKMjdq?=
 =?utf-8?B?d0RvWGJnNUdhYXBBdkFEaHFRR2cwaHJReUVINExmaGJzZElzNHRrSkJQVldJ?=
 =?utf-8?B?K3FjTGJDajRJQnY1cFVjeThvRE1sT3RlSGo5S01NcFRoOU1BYkpDdDNLY3F2?=
 =?utf-8?B?QzJkWVViWDVxODV6TEJxc1Rab3d3aXpIS21hcDh5OEVkbGRoaTdlK3R0Y3I0?=
 =?utf-8?B?a0xyZnE0UDZoOU5ocjN4RXhzZEJHSXhENnEvTlRwMlNWd09OTlVBNFVkYnVt?=
 =?utf-8?B?Q3hrd3g0enJRZWYzQUp6VTZadVBuL1J3TXlCd2NZQmFRRUt3cmVTVUZCeDVD?=
 =?utf-8?B?M3VaRXJEZUtLYVpCRDBBZVdYZk9hTTFxM25pRTVSQVZhS3NucGNEOGtrNDQx?=
 =?utf-8?B?UUp4ak5QQkNaVVBIbk1sMldWWHEvYXhEeS9xRnpGcjNrLzR1cHp3MmVESTNV?=
 =?utf-8?B?MHBDczFVZnpEOGtEaGJOQlo1bGRLYlRWY3RRcnRCVkI2OEl0NU94aXZDK2ly?=
 =?utf-8?B?RFozbHBwTnlETnRHU0MrTTIvS0prbnZLdFpSc25mMG1XVUoraGdpMyt2UE8z?=
 =?utf-8?B?Q0l6Q09NbWtjZXlSV1VCd1h1VTdLY3NhNENwTmk4bFNmZDZQNWFSRy96OUov?=
 =?utf-8?B?U1F4bXpCYTFveXc5UmFacHdaV0VXVnQxbDcyN1owVUNxUWVUa3I0eml2OVpC?=
 =?utf-8?B?a1d5aTVZaEsvdTljaHhLdEE1bVlPK0g2cEdSRUtoWXhLSzJFRjRFTjhsMWlz?=
 =?utf-8?B?UFgybWlpUFkrY2V1MjdTaFZVV0VXRkJxam9nZjBTa0cxTzFvU1ZjcHM5U29w?=
 =?utf-8?B?b3A2WjEvLzZYcndOcjZjQXdJR2dHVUJOTmNsUFFuTmIxbEFBa0UxRUxIUjhW?=
 =?utf-8?B?ODBqVnprczlST0syY0VxazB3WDdZZXd1ZG10TVV3VEtKcGtVMTFoUzdBY0NK?=
 =?utf-8?Q?E+iYLzSzZ10=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVRuZGtsdzZuS3pQQ0ZFOHkxcjh0aDZGT2g5Tyt1RlpuR2piaG1yT0Z5Zzg4?=
 =?utf-8?B?emJrcEJPRjRWRHNrdy9mcVg4M2JZbDlueExqSHExV2FvSGlwOURMZ1pzRTBM?=
 =?utf-8?B?c0k0cXFCNTI4aU1qa0o2QTlLSFZvQUxOajVGNnFyUVBIdzcvN2FBUDZzMmNl?=
 =?utf-8?B?MHFweEpXRHMrUGFVZXFJeGFrUmRKS1IyaUgvV05JSDlWME9oNjN0SERVYnVp?=
 =?utf-8?B?ZjI1aVdHcjNzWFRsREczUmxqcm9QRUlzWG1lc2tpY2QzRmxvb2ttT09uejNs?=
 =?utf-8?B?bWU0NFlaMndJbWdGbmFydldtZzMwZUREWkpRcjBnUFBwMW1WRHVGZUFhL3dD?=
 =?utf-8?B?S1hyL1R0YnVXWFQrVDYvVlVhK1hGNTNmazJUZXRuQjUvRUFMa2hkV2NYN1JZ?=
 =?utf-8?B?VzRmbkFkTmJ6Y2hTc2NNQU9aaUplUVpPMHJJSGxncDdlTXBLYVdueE1YMzJ5?=
 =?utf-8?B?MUx6K2ttU3Nmdm01UWxMRHVxNjVDejlJV2dzdlg1MHdiZmZVTHVtejdkdDN6?=
 =?utf-8?B?OEt5NVFUWGtsMHJxV0VVU2ZYQVRFZXR5bFZQVG92WEZTd3hPb0o0Z1VSd0lj?=
 =?utf-8?B?emZYWlMybjl0YVBKWkw0Yi9jTXlVcXpHVWxGekVUSzYzbGZ1SGhIN2tmV3Q1?=
 =?utf-8?B?cUlPUVhycXpydWtzbXFmeGgvamY2aHJlRWF5TG1CL0I1TTJmL0hmbHVoRlRP?=
 =?utf-8?B?Q0EzQThvb2RJZ2UwZ1hXSTZWYitMb25HOS9tdzNzbDZwajF6MmtOVTlqM3FR?=
 =?utf-8?B?L2h5L1pFQ3pRQncrTHl1TUNXZXZ6cUxET2VuTENIbllveUpVSGs4UmFUTHRU?=
 =?utf-8?B?bjJGU2xOemo4Q0hHUWx1clQvQ2tqT1Y4UkZCM3pIMTIybmdNd3ZEVXBGbDJl?=
 =?utf-8?B?R3N1MlR3S0FWRWYzRUVZa3BObkxlbkF0Yk0wdGdiM0p5SHUxMUJPb2crQjJW?=
 =?utf-8?B?cVFrVDF4OW1QOWpUeDNvQXZzRXBjVjNKbVQzUGZ3Z3lxNG5RWGl0VjZwYVF3?=
 =?utf-8?B?T29saEx5RFFUbnc0VG9SZ2w5Z0hKVlIrOWFUbnBPeXpkcllNUmlmTmwrOEVY?=
 =?utf-8?B?OS8xQnAvcDdYeTZxUFBtUUFLR2ozeEdDZHd3aFpkY3JVVTJzaTQwanFFbERo?=
 =?utf-8?B?Z2ljQXY5b3J6b2NOcXA5Uk1xaGtBWlNEOTZ3TS9kOW1ieGpCSi9rRkIrS1hO?=
 =?utf-8?B?L29FejhRNjlSR2pOZ1VoMTl4VmRuNFhwOSs4VG90eThQYXkwa01ITFIwVWs1?=
 =?utf-8?B?MFRUZnFkS1hwam1lZFN0MmRNWFA0NEVZU1NCT3NKUEhiM2Q4c05tdGVNb2Vx?=
 =?utf-8?B?QkhvZnlrWVZsUkJQY2ozUFp6NUlmdTZPTWFTNERQd0VLeTdWVVlRUnhlVkg5?=
 =?utf-8?B?c0hrcjVJNXdJTElQa1BOUTgraXZoVU1BMHBHbVRiSWR5SmtBQUFQNmhNZHhx?=
 =?utf-8?B?N0FhaGlCNFRpV2JZSitOd0N2M1M4R1RieC9WNFNiSTM2VlBTZE5KS3VFcnRQ?=
 =?utf-8?B?elhVc0t4L0dxTm5TSERkV05QYzE5OGtaM3k3bW1jbUF2ZFIwcG8zV1A3V2lL?=
 =?utf-8?B?OXBrYkdWVG0wV3NUL2sxSmFJdy92QXVBVUg3Y0d1NDNjRjQyK3RKWmIwUWRS?=
 =?utf-8?B?NC85MDM4bG9PS1NHVFE4SlpydlljT2lyU24zK1lzVGVQYzgvQUJmTFF6RWs3?=
 =?utf-8?B?bzRqZUVoQk5rajZFTytSdDdaS3Nsa1pJbkhFQ1JLNlpkWUM0VFNiamZqZVRL?=
 =?utf-8?B?ZU54eGdJcy9YaTV3UVNESHRvbkd2Q3gvb2NlenFHdEppcjFpN0o1b2xyUER2?=
 =?utf-8?B?UDhNWENxcmVaZmkzSFpBeHpLSnZ3SFBNV2hDcUMvQzVacC91djBrYzVFQWgv?=
 =?utf-8?B?a3J1ajRINTh1ay9jVU9aN0NuK0JLTlZoK2o5bS9KNi9jZmJLeFhkcmFOQ2kx?=
 =?utf-8?B?ZnVrdGJ3ank3NU5aMkVXaTFLOTFpakZsUEEvdzNxMUpvcHV3aFFDUGh4RDZN?=
 =?utf-8?B?bU9TYmQvaERDZzVyL3B3VU0reWRHajMxQUFvL3pMc05TMkFEYkpyNElBS2JX?=
 =?utf-8?B?eWpLc3B4Z2E4d3RseWxDbU9reU1BdDhKOTdEcHlEVFVqYUV2MGo4Nk1zN2ZL?=
 =?utf-8?B?Tml1QWFCSjlKZ2xnWnRGblhxQytZZlNPUStCYUJUOGdueE9uaTFqUURQK3N1?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cf9de8-6b76-4bcb-27be-08dda99ee38c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 10:50:04.7403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /81uuFk3XKD+4awedjaq2xJEEAiPxrQDjDyP7tLo56lN+rLEqi+XJKY7jfPY0NZTlZKKxryZGEFEYeG60uaAfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6477
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

--------------0FtJWtppxvn71Gz30veYmdLX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 12-06-2025 15:36, Nilawar, Badal wrote:
>
> On 09-06-2025 11:43, Karthik Poosa wrote:
>> Prevent the power limit time interval from being overwritten with 0.
>> This issue was due to a missing read and modify of current power limit,
>> before setting a requested mailbox power limit, which is added in this
>> patch.
>>
>> v2:
>>   - Improve commit message. (Anshuman)
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Fixes: 7596d839f6228 ("drm/xe/hwmon: Add support to manage power 
>> limits though mailbox")
>> ---
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h | 1 +
>>   drivers/gpu/drm/xe/xe_hwmon.c            | 7 +++++--
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> index 5394a1373a6b..ef2bf984723f 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -40,6 +40,7 @@
>>   #define PCU_CR_PACKAGE_RAPL_LIMIT XE_REG(MCHBAR_MIRROR_BASE_SNB + 
>> 0x59a0)
>>   #define   PWR_LIM_VAL                REG_GENMASK(14, 0)
>>   #define   PWR_LIM_EN                REG_BIT(15)
>> +#define   PWR_LIM                REG_GENMASK(15, 0)
>>   #define   PWR_LIM_TIME                REG_GENMASK(23, 17)
>>   #define   PWR_LIM_TIME_X            REG_GENMASK(23, 22)
>>   #define   PWR_LIM_TIME_Y            REG_GENMASK(21, 17)
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 0d32e977537c..abb5c3693437 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -377,11 +377,14 @@ static int xe_hwmon_power_max_write(struct 
>> xe_hwmon *hwmon, u32 attr, int channe
>>         reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>>   -    if (hwmon->xe->info.has_mbx_power_limits)
>> +    if (hwmon->xe->info.has_mbx_power_limits) {
>> +        xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &max);
>> +        reg_val = (max & ~PWR_LIM) | reg_val;
>>           ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, 
>> channel, reg_val);
>
> Like xe_mmio_rmw32 I will suggest to write 
> xe_hwmon_pcode_rmw_power_limit() function to handle this.

The mailbox power limit requires read-modify-write (rmw) only 
in|xe_hwmon_power_max_write|and|xe_hwmon_power_max_interval_store|.

Since no further updates are expected elsewhere, do we need a helper 
function for these two instances ?

>
> Regards,
> Badal
>
>> -    else
>> +    } else {
>>           reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | 
>> PWR_LIM_VAL,
>>                       reg_val);
>> +    }
>>   unlock:
>>       mutex_unlock(&hwmon->hwmon_lock);
>>       return ret;
--------------0FtJWtppxvn71Gz30veYmdLX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12-06-2025 15:36, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:c7231452-78d3-4410-a309-f04d23d7b=
0f2@intel.com">
      <br>
      On 09-06-2025 11:43, Karthik Poosa wrote:
      <br>
      <blockquote type=3D"cite">Prevent the power limit time interval from
        being overwritten with 0.
        <br>
        This issue was due to a missing read and modify of current power
        limit,
        <br>
        before setting a requested mailbox power limit, which is added
        in this
        <br>
        patch.
        <br>
        <br>
        v2:
        <br>
        &nbsp; - Improve commit message. (Anshuman)
        <br>
        <br>
        Signed-off-by: Karthik Poosa <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
        <br>
        Fixes: 7596d839f6228 (&quot;drm/xe/hwmon: Add support to manage pow=
er
        limits though mailbox&quot;)
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/regs/xe_mchbar_regs.h | 1 +
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_hwmon.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 7 +++++--
        <br>
        &nbsp; 2 files changed, 6 insertions(+), 2 deletions(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
        b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
        <br>
        index 5394a1373a6b..ef2bf984723f 100644
        <br>
        --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
        <br>
        +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
        <br>
        @@ -40,6 +40,7 @@
        <br>
        &nbsp; #define PCU_CR_PACKAGE_RAPL_LIMIT&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
        XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
        <br>
        &nbsp; #define&nbsp;&nbsp; PWR_LIM_VAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_GENMASK(1=
4, 0)
        <br>
        &nbsp; #define&nbsp;&nbsp; PWR_LIM_EN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_BIT(15)
        <br>
        +#define&nbsp;&nbsp; PWR_LIM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_GENMASK(15, 0)
        <br>
        &nbsp; #define&nbsp;&nbsp; PWR_LIM_TIME&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_GENMASK(=
23, 17)
        <br>
        &nbsp; #define&nbsp;&nbsp; PWR_LIM_TIME_X&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_GENMASK(23, 22)
        <br>
        &nbsp; #define&nbsp;&nbsp; PWR_LIM_TIME_Y&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_GENMASK(21, 17)
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
        b/drivers/gpu/drm/xe/xe_hwmon.c
        <br>
        index 0d32e977537c..abb5c3693437 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_hwmon.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_hwmon.c
        <br>
        @@ -377,11 +377,14 @@ static int xe_hwmon_power_max_write(struct
        xe_hwmon *hwmon, u32 attr, int channe
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg_val =3D PWR_LIM_EN | REG_=
FIELD_PREP(PWR_LIM_VAL,
        reg_val);
        <br>
        &nbsp; -&nbsp;&nbsp;&nbsp; if (hwmon-&gt;xe-&gt;info.has_mbx_power_=
limits)
        <br>
        +&nbsp;&nbsp;&nbsp; if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits)=
 {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hwmon_pcode_read_pow=
er_limit(hwmon, attr, channel,
        &amp;max);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg_val =3D (max &amp; =
~PWR_LIM) | reg_val;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D xe_h=
wmon_pcode_write_power_limit(hwmon, attr,
        channel, reg_val);
        <br>
      </blockquote>
      <br>
      Like xe_mmio_rmw32 I will suggest to write
      xe_hwmon_pcode_rmw_power_limit() function to handle this.&nbsp;<br>
    </blockquote>
    <p><span style=3D"color: rgb(66, 66, 66); font-family: &quot;Segoe Sans=
&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -ap=
ple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-se=
rif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: rgb(250, 250, 250); text-decoration-thickness: initial; text=
-decoration-style: initial; text-decoration-color: initial; display: inline=
 !important; float: none;">The
        mailbox power limit requires read-modify-write (rmw) only in<span>&=
nbsp;</span></span><code style=3D"color: rgb(66, 66, 66); font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(250=
, 250, 250); text-decoration-thickness: initial; text-decoration-style: ini=
tial; text-decoration-color: initial;">xe_hwmon_power_max_write</code><span=
 style=3D"color: rgb(66, 66, 66); font-family: &quot;Segoe Sans&quot;, &quo=
t;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -apple-system, =
BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-si=
ze: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-al=
ign: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-colo=
r: rgb(250, 250, 250); text-decoration-thickness: initial; text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;"><span>&nbsp;</span>and<span>&nbsp;</span></span><code style=
=3D"color: rgb(66, 66, 66); font-size: 16px; font-style: normal; font-varia=
nt-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-trans=
form: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; w=
hite-space: normal; background-color: rgb(250, 250, 250); text-decoration-t=
hickness: initial; text-decoration-style: initial; text-decoration-color: i=
nitial;">xe_hwmon_power_max_interval_store</code><span style=3D"color: rgb(=
66, 66, 66); font-family: &quot;Segoe Sans&quot;, &quot;Segoe UI&quot;, &qu=
ot;Segoe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style:=
 normal; font-variant-ligatures: normal; font-variant-caps: normal; font-we=
ight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-inde=
nt: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; white-space: normal; background-color: rgb(250, 250, 250)=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial; display: inline !important; float: none;">.</spa=
n></p>
    <p><span style=3D"color: rgb(66, 66, 66); font-family: &quot;Segoe Sans=
&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -ap=
ple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-se=
rif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: rgb(250, 250, 250); text-decoration-thickness: initial; text=
-decoration-style: initial; text-decoration-color: initial; display: inline=
 !important; float: none;">Since
        no further updates are expected elsewhere, do we need a helper
        function for these two instances ?</span></p>
    <blockquote type=3D"cite" cite=3D"mid:c7231452-78d3-4410-a309-f04d23d7b=
0f2@intel.com"><br>
      Regards,
      <br>
      Badal
      <br>
      <br>
      <blockquote type=3D"cite">-&nbsp;&nbsp;&nbsp; else
        <br>
        +&nbsp;&nbsp;&nbsp; } else {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg_val =3D =
xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN |
        PWR_LIM_VAL,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg_val);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; unlock:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;hwmon-&gt;hwmon_lo=
ck);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0FtJWtppxvn71Gz30veYmdLX--
