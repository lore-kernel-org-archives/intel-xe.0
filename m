Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3925CCE7CE5
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 08:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F417310E08F;
	Tue,  1 Oct 2024 08:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pb9BSlCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621AE10E08F
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727770285; x=1759306285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dWOwpu/5QHXnD+nKQZ/yh3oYrB4R1PD+tvg4OG2wRV8=;
 b=Pb9BSlCiFOtfY8OUDBW3DSlVVNrb6WfhsfuE+CsL98sFrmIakrSDhM2d
 3W3UEYUSNvgxoeHy47zy3pcJ2+puzBRLBXHu65E3ACU1jxNFc3luDaTJ0
 j/Ct2bxreKIDx7WzKgFotDbynA2IGEiVdedco66nVEPJECZ5Y/QZnMP2v
 I3e0FiyXGQR9/LvVXcp7usc/ZiAffRJ0c2zLXJGKfKQDso3Aw8igUpd73
 IJrTojAVsgJ348tYTsD49a0nK6VwaxTbJc9GjO9/UlSf8jRcDBPH9DVX0
 eU02OzpD/ywbGraNjvg64iFRvnFpTlITmHJrn3smQLeF3x+y7bzF+XULt g==;
X-CSE-ConnectionGUID: MjFVODBoSCS3XcfhLoCkXg==
X-CSE-MsgGUID: 2D3gY0gNSdiLJOMzpYzkYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26392879"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="26392879"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 01:11:25 -0700
X-CSE-ConnectionGUID: vZ9dAhhtQZicobWK8A3EaA==
X-CSE-MsgGUID: 8iK7ZldCQty9Oc+TGSoBzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="77984515"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 01:11:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 01:11:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 01:11:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 01:11:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 01:11:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMIqgNDqoYAV6YW3FlLNjRmOlbheIehOxi5IkCNFMQ5qLNijCZ+ro14++w64DAUnVGVhJrByJmS/VCT5d5tFGaq/zL31DscoD8loEzmalQQoL77ifC9cbt4OctRIDivjGNR9lFvC5AEQMhcA4lcPFYHi4eqdqw3RVDUU32OiweOXNPhNgIOCQYP+tNrAZpOcsWhhRrZ3gfbIph2p8CXzYQ5QoQ9xPWAFZ775sNBb6ZN+Cgs7K3SLDVCyQ8H73AqLhUqJPYPY+P5cXJimXxBYSOukgAxBAtlRDVmcEqC7L9Bp2NKsYo0CeinerE4rf/XvOJB9Lt2rjhhH/Gy8XUy9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/n6UR2ID6BkHuq849SqFNUEjAnPJ0/4s5EWpcOXzSPQ=;
 b=f1dyefP9ZHoGkECDFWqLb91hB7JIgGL6CPocJPJPnXkcmVMZFL9JLolenRw6kNq8bCO3PHHmW6Jwez//PTqxi+P72GJC16YEPG/S9EUnxkAVh1KYO/idwxNsMDv15J0PRYW2OsRTXi5RjEGVqwinGWNi/UtfyrioSzpcD2gRBaaEwRmE/83nJB8Nm5TivFNAstwqEjecI9tRYKkqoAPZmHUaq4UjN4Xz6+txMwi/SyHKzXU85dEIc8yd7N5Lzm2CLSweIMGhGsfCG+nYk+FyvcauEtcww+pOtALQwq//yuuX/wn3VWdIYFSuwkA78sZjDyFlAQ9XXxtN11ZNzTKRFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 08:11:22 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 08:11:22 +0000
Message-ID: <2198b044-4b1c-4933-a229-d94095b87d5d@intel.com>
Date: Tue, 1 Oct 2024 13:41:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h
 resp times out
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <vinay.belgaumkar@intel.com>,
 <vivi.rodrigo@intel.com>
References: <20240927192428.1160211-1-badal.nilawar@intel.com>
 <ZvcjVH9Y3AVjGMsI@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZvcjVH9Y3AVjGMsI@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: a73414ec-5f74-4ca7-7c20-08dce1f0a295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzBZNFhMMkVTSkQ1aVE3bk1rakNGdlBVbWRqYWZad2JNU3V2U1lXSnFMUHNr?=
 =?utf-8?B?dDRQWGRtTHpvblp2cHVYeGY4SkJEcWRnVFIzWEJYR0ZvVG5pNjgzK1RzRjEx?=
 =?utf-8?B?TVBRSWJkc3hvL3k4czB2ekJqL0QzalJqa0lFS2t3UDFXUWhOSnB2dUhySXNl?=
 =?utf-8?B?d3dkNVpjVkxadjYxd080b0tEVXl0U3ZSQnMyWXJXSi9XL2RjZlRabE9tSml6?=
 =?utf-8?B?dStuZEVXNWtCUTZvQm8rVlRFYkNNYVBCSXRBYWJtRi9BSzUrZ0ZBUzI0dStC?=
 =?utf-8?B?R1FIK3JpSTJURlZGQVVkV0tBM1BnMnVYMHFLN09ETjErOWZPNTJBWDBzeWJv?=
 =?utf-8?B?MFFBUVdPa1krcWpVTHBNV1VEaWZEYmt6V2lmZHdxVmRlZUlWRm1qVTlvZmQ5?=
 =?utf-8?B?SXYzekFUTE8vdmdZb09GQyswMmh5YjROdmhGVnVYR1ZvcUp2QmI4M09MdGtt?=
 =?utf-8?B?dnhpVi8rSHNtUEZNMllpc0lmZ2xKcUxpeW9IZDh5dnBMeUpZd1pGSThKUVYw?=
 =?utf-8?B?MkdpK1JvTHg0Vi9MdDNJcjRodThReUEzUnRmZ3A3Q283QW5ra2RVcXhRWlIz?=
 =?utf-8?B?T09CNDQ1Z2xRQWJ0dHVKYjV0a2prRS9zK0t6UHR1L01sTkFSMU9mV2dmbTdN?=
 =?utf-8?B?ellRcmExeUp6Z1hITXRUeVhrZEJaRUZDWmRXOE1IODFQc2RJaFFhSWhOdlR0?=
 =?utf-8?B?WUNIaHp4SDJ3aElzSjM1cklLTk5xWVVscmQ3V1ZlQ0tJT3hiQTZTcjBuVnZr?=
 =?utf-8?B?UDRCVHhnVVduM2lNZ2VzSkZFWGg1TlZrQmJFZzVJTk80RlRmYkQ5c3l5TE5v?=
 =?utf-8?B?RjRxaEtsNHVzYVVRMzhLT2RBbWd5RnIxQWQrNGNWUzZnTEpJMG1nNXJRUUN6?=
 =?utf-8?B?WjlTbVJEcm9MNzhlSkJGUktsVVFuZlFEQU5YM1Q0Zi9YRFhtNEEzSEJ2eUIr?=
 =?utf-8?B?eGtRRkdtcWZvakRGK2V1K2pERXJwU0VQNm5MN3BNS1BQQ1hQS1EzZjh3MXEr?=
 =?utf-8?B?cFQ1WklWeEhvdHlRVHNYUi95UUFHSVV5WDk0dkk5M05YY1Z2Q3YwWGxzOXp1?=
 =?utf-8?B?dTZjbHdlcU9ubmF1MFRpM29WUzlvczRQTmRqRTA0WjBqZ0p4a2l1QU1QREdH?=
 =?utf-8?B?S0ZtYStYVVpqSm9VRG1EVDJtTno0aXJBdUdWTy9KbjdJMEVEc01sQTMyN3Bl?=
 =?utf-8?B?a0YzUHkydnUwRWtyaEgwcTUvK2ZIZHRVTVRuTXp6QTBsbFRSaUZyMkJ6Z3I4?=
 =?utf-8?B?N1ErRlJxNzg5Uml1dlZEYUNvRmtmWStXa1QrVk1ldVkwVXMxNG1kZnlYWXhh?=
 =?utf-8?B?ejhKYzV5ZHR2YkdWamVXMUFPd3QzMzhySXdsTmZGdVpRc1FyVmNBTlp1TzV1?=
 =?utf-8?B?dHdNWUJmVmlwTmdFcE9JaFlWT21JdmtPcjVBUCtESW9tYjFOcEdEMHM5QkRo?=
 =?utf-8?B?Vzd6S3BoNGRrQThjd0hvRUV3dGlXamZhcTRjbE5kUk1pSFdhMWtMU3FVcEFl?=
 =?utf-8?B?VFVEOWlqV095emQ1cDJlcTRDQld1K3N3STVCQzBCM2RmTmxzWlM5cDJscHQv?=
 =?utf-8?B?MXpvL2t0VS85TUE4L3V5ZWJ4MEVOS1duQWFtWjk3cjFFT2F2WjZ1VUluWWd2?=
 =?utf-8?B?SXRybEwxZVo3TG9ydTJzMXpTdlVBVWRGSS9MbDhhWDUvOUR0ZHVJQWttdFI5?=
 =?utf-8?B?T0pNV3Y5QzVSdjF4dVVUQnB5Wmc0ZElQNnRtM0FtMGRZNld2d2JJWUdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFJkcjZIN291aXlNUmxXNkEwTmNHcEV2MEhSQjJwZTBVRS8vV2pDYm9VU2Na?=
 =?utf-8?B?SXMyOUFnL1d3V1E1QVk1NUNsVGcrNi81SXhpNlp6dmYvUHMybmNJWG5kVXZW?=
 =?utf-8?B?anlGM05zYnFubEx5NEQ0SUVFUXo0MStlVWROMGJVWXcwUExMVnVyKzY1MEJm?=
 =?utf-8?B?bDJUTGZzdVUxSjlqMkx3NU9LTUNSVWJnVGtRQnVOeG54eHB4RW5iZjNEM1A2?=
 =?utf-8?B?bGw4ckJOQ0pub3J5NC9OZzR0bzk1UUdSUGNKQVlNVnJYTzZTU2xpaVU2SXgv?=
 =?utf-8?B?eGpWSSt2R3lOQS9qNEhwMDNJaDVZaXFDVzRvbzA5RExZMDZYaVkydGZNcW9h?=
 =?utf-8?B?RXI3cmpNQXBrd3RtNkx1VEt0eUQwQ0Z4V1ZSMytPOEMwMnk0OGpmNVlJRURX?=
 =?utf-8?B?VTIvNU1OMVI1SGEzeWZic0NwTTFvN3IxL2kzVVBkdmlNbk1tQmpzQ2Yvcyt4?=
 =?utf-8?B?S0lsK0xkTlpOellNTFlIUnFiMnZrZzRQY29lMnB0YVEvdER2TzZRUlRVaUJr?=
 =?utf-8?B?bUM1blBNUTh3TXFmUTdMMG1PTG42aDNEU21xazYyV3c4eVFWTnFLUDZYOWJL?=
 =?utf-8?B?d3puZDFtRm0zV1l4Mjd4NTd5dy9zOGFtV0FDNUNZSUhWNjdNN3c3TGdCdTU3?=
 =?utf-8?B?UHBLdW1zUVNXMndGWkZaSURSTE4rUW9Eak4yRzNRWjRrV0xZMHR1dklFQXJm?=
 =?utf-8?B?NitWMlZXbTNNYjBuZFp6ZUVpSGRtbUcrckpCM2pSYUpKa2xtZVBQQm92M0xC?=
 =?utf-8?B?aUxpRmQrcFVNODBURTNoU1BXQzQ4ckwwWUhFNUx6U3Y1d2luUVZ4ZjB0M05q?=
 =?utf-8?B?TnF4WTc1OWlmb1VzV25KNWJIQVA2RmI2U3Rscng4K2hhcFJ5SDczcE5OZmoz?=
 =?utf-8?B?cUxXMWlsNlp0N0RRUWRjK2xOQUR5R0lrSi9KcFZndjNaLzNMM3lyclZUOWgy?=
 =?utf-8?B?b01QZVRYbXQySzR0eFdOV2F6cXFNSG5GcEpLa3pZdmx1N0t4TWxqU25vR1RR?=
 =?utf-8?B?U2FmdVJubUg0NUVLcFFRN0psYngrTVExV252cVRyajZsTEpIcC9EajZYNlo1?=
 =?utf-8?B?SnEzb1c2NUxrbkRTWVFseWJ0RTcxQTVxSXQrTDF6UXFNdFpUR3lKdmUwYllk?=
 =?utf-8?B?NmFiYUZFM05udTVWT1d0a0lsV0pZNlJ2d01iYWNYNkxpdmszbFNFc0huRUpk?=
 =?utf-8?B?RFVPQitLVVJGdmVBVnAwcDR1Nnd6WEhrRTM1ekl2UVFnMUg1U1JOVGEzYWx5?=
 =?utf-8?B?aXZEVmt2WnlScjdSd2NFNk5NMmZndUxCd0JGb2x4SVlQNGxEYjhnZ0R6QnNB?=
 =?utf-8?B?blB6NXZ4Z09DU0lCT0J5a2doSTVsMHdMYzczaWFJUTlBV0JzYk9SdC82Q0t6?=
 =?utf-8?B?Rys3NFI5WU1KRy9TVE9yeTNVSDJORUVlbnUxd1FhNGFVc2lmdWNTKzdPcnJk?=
 =?utf-8?B?ZVBQeTJtbFoxSndwL1Z6b0k5V2VTYzhPbjZoTnVGSUVoYTErb1gvNGtzUkZh?=
 =?utf-8?B?ZFp6YTJRWE9scU8zSVVXbDk1SXZtZW43RW40YjVMSzNXSk5YR0lVVCtheHNR?=
 =?utf-8?B?SW54aFlUallzVkUyNWZiSldkNU9yelZKVzVIcXBST1ZpN1psdTJzckl0M0hJ?=
 =?utf-8?B?UEhKbHY3SDV1MXN2c0N3VC8rWFN0cDZoRHdCb2FMN3BUWC9vM054TEZ4S25P?=
 =?utf-8?B?MHRDbUp6ZUpGQlRFcU1NbW96ZytQY0o0c3IzaWNwcXRWeStTcVc4T2FoOW9L?=
 =?utf-8?B?dnY0N3oySG9iZzdaU3A1RFZhdXljRHhzZGd4VXVweGh6SDFML2N6WVY2aVhp?=
 =?utf-8?B?NnpXSkY3VncrSjI2SXBucTdvdlNuY0lJVTdFUzlwMng4V01yU1ljajc1VDJs?=
 =?utf-8?B?b1VGcGpqUDltbW0vekhBbm9uVHlLRC9GMTF2U09ORDFnYjZkUS8rZkN4Tjlo?=
 =?utf-8?B?LzdWUkFYcFVpbXA1QW1UdUU0U0t1VVdzRGt3bVdVNGp5Q0FjMEZnSlRFd29p?=
 =?utf-8?B?RlRScVpOVEdlVDk3ZFhXamcrWStmZ0Z3dTJQZW83TnVmZk8waW90VUgyT1lU?=
 =?utf-8?B?M093QXVEaytQeUtJNXZ2UldKd29wZ21SS2tTcVZjYzdTU0hTSmZmN2RJb2ZI?=
 =?utf-8?B?THA1aERkSzRxTXhTZEFpMHd1TXNVZ2xjbnJ6b3dmTWRQQTY1S29IaWZURTRP?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a73414ec-5f74-4ca7-7c20-08dce1f0a295
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 08:11:21.9203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/TCgnpjsUDmlyT+Pc7aTDZUsKDdaMh7iyqq+g+yCtVp+1Uesu24RBYz7g/hLKLbFhI6UUAz0fU+WXH9u2u78w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
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



On 28-09-2024 02:57, Matthew Brost wrote:
> On Sat, Sep 28, 2024 at 12:54:28AM +0530, Badal Nilawar wrote:
>> It is observed that for GuC CT request G2H IRQ triggered and g2h_worker
>> queued, but it didn't get opportunity to execute and timeout occurred.
>> To address this the g2h_worker is being flushed.
>>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 4b95f75b1546..4a5d7f85d1a0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -903,6 +903,17 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   	}
>>   
>>   	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>> +
>> +	/*
>> +	 * It is observed that for above GuC CT request G2H IRQ triggered
> 
> Where is this observed. 1 second is a long to wait for a worker...

Please see this log.

[  176.602482] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: 
GT[0] GuC PC status query
[  176.603019] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H 
IRQ GT[0]
[  176.603449] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work 
running GT[0]
[  176.604379] xe 0000:00:02.0: [drm:xe_guc_pc_get_max_freq [xe]] GT0: 
GT[0] GuC PC status query
[  176.605464] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H 
IRQ GT[0]
[  176.605821] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work 
running GT[0]
[  176.716699] xe 0000:00:02.0: [drm] GT0: trying reset
[  176.716718] xe 0000:00:02.0: [drm] GT0: GuC PC status query    //GuC 
PC check request
[  176.717648] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H 
IRQ GT[0]  // IRQ
[  177.728637] xe 0000:00:02.0: [drm] *ERROR* GT0: Timed out wait for 
G2H, fence 1311, action 3003  //Timeout
[  177.737637] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC PC query task 
state failed: -ETIME
[  177.745644] xe 0000:00:02.0: [drm] GT0: reset queued
[  177.849081] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: 
GT[0] GuC PC status query
[  177.849659] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H 
IRQ GT[0]
[  178.632672] xe 0000:00:02.0: [drm] GT0: reset started
[  178.632639] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work 
running GT[0] // Worker ran
[  178.632897] xe 0000:00:02.0: [drm] GT0: G2H fence (1311) not found!

> 
>> +	 * and g2h_worker queued, but it didn't get opportunity to execute
>> +	 * and timeout occurred. To address the g2h_worker is being flushed.
>> +	 */
>> +	if (!ret) {
>> +		flush_work(&ct->g2h_worker);
>> +		ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
> 
> If this is needed I wouldn't wait 1 second, if the flush worked
> 'g2h_fence.done' should immediately be signaled. Maybe wait 1 MS?

In config HZ is set to 250, which is 4 ms I think.

CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250

Regards,
Badal

> 
> Matt
> 
>> +	}
>> +
>>   	if (!ret) {
>>   		xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
>>   			  g2h_fence.seqno, action[0]);
>> -- 
>> 2.34.1
>>

