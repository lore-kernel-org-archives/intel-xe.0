Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DA9CD37AB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 19:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8922E10E1D2;
	Wed, 12 Nov 2025 19:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MvQtfvvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8B010E1D2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 19:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762976342; x=1794512342;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zgcYRhiWxZkvq5VyFtTa1pqDKMWef/5D9ojnjWDwKbM=;
 b=MvQtfvvxN8BF3TfAF59c7PhUApDf1dPHsmK43/29fxuzlllm/9+Jd3jw
 4wStvds3RJrWRCV61Y/2HHnREKc6RC3TSabzc5oyUv6IGPeXnmW6xy6Rs
 x76/7Z1wo9BmaN4CXTAJ1VGDHw9E9M0lDzROR6sV2qzcc+OakRBqrEaok
 lMYwRprl0bfYMChj7mwW+4bTLAyfaf4PGU7qCb2ddK8kXk6RFwu7KKVLa
 e/4IqLRn9yKiX7xMX4lvvflzaWExZCZfnQzeBwe67metzXHWPkPSdjOou
 ney1YNJ8tNzphYldy8jiI9DqwstYwx5GgXNu+LrJNhlPR4VIve5lJckpO g==;
X-CSE-ConnectionGUID: KUj7lWMtR3Sp9i0Ba7cv1Q==
X-CSE-MsgGUID: xk/aK2vhRC+Tk3b0Ob6l4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75661515"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="75661515"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 11:39:02 -0800
X-CSE-ConnectionGUID: EMTYLq52QLOwZVGailBZlg==
X-CSE-MsgGUID: pNtO2qDwRN6T4X+UcCd4pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189085055"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 11:39:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 11:39:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 11:39:02 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 11:39:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaZ+Zaw4v6EA2Ot30ORKeigqNLBK+/b8kckJc6bMXAIADvl9gFMahIs/vggli01urZ0adYFfOupLO+rlKWAIeAfnllit37ZW+9zWhsZOV/Y7mjFcFMxZhvE6fSgsZXK0ZxzYZgrQAMiR256erNm3JAoV2wqmul5K/rCjCcTI42TiUh0GW2TgEVeJt/amPfXSiTprurAbjH0xfyoLw3WIgutFYJmKejqLtu9XTQAJA53zy8oE/gCPj8odgLHglK20lAd2MArKw5zumfyRXwnZp5ckkzOt1LDLYRjFGgy+d7P09MmFUVcnERLIO8BRa/qCJJFKMY0s80ifhgG3sxsxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgcYRhiWxZkvq5VyFtTa1pqDKMWef/5D9ojnjWDwKbM=;
 b=D+tusdCvt3AweDiIDvV9Dp48U2zTxzNL3FeqOf7JrQRihLsr4HBpIv3fkxtO6cWNd3h3fH9gH9nsy+yABu7y9iUSMaOLBGXJFRkTNAw9mRdegUrwA6Xxwg9pfSzrjWM0Y9Ut6rt39XbIe0FQVOXHEBYsxceWr1G7rOzSms3Db1TpEoie8UlY3m1dbtLWIe+0OHwa/UlKqm7+RlOdmg1uJEVHplYaDzWUb4oYvPO7Ozahw3KJGTgTstZXgRLggJoc39I3u1PzkPvn1+KszcpRuUKi0KVrcPuNMiTFj+CdYTQ6SO1j8Z7pBnRjrDa7FSmQi3SpD4S3Z1U2+tMA6mbhnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) by
 SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 19:38:59 +0000
Received: from DS0PR11MB7831.namprd11.prod.outlook.com
 ([fe80::82e2:ee0e:dbbc:e95c]) by DS0PR11MB7831.namprd11.prod.outlook.com
 ([fe80::82e2:ee0e:dbbc:e95c%4]) with mapi id 15.20.9298.015; Wed, 12 Nov 2025
 19:38:58 +0000
Message-ID: <bc841eae-c231-4a53-a758-214969e87380@intel.com>
Date: Wed, 12 Nov 2025 11:38:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Recommend GuC v70.53.0 for MTL, DG2, BMG,
 LNL, PTL
To: <intel-xe@lists.freedesktop.org>
References: <20251112183100.1472193-2-julia.filipchuk@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20251112183100.1472193-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:303:8f::23) To DS0PR11MB7831.namprd11.prod.outlook.com
 (2603:10b6:8:de::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7831:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a828793-f943-4a9d-b237-08de22231fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXZqZnhzYUEweW1pTC9UWExyV1RjZ3FPV3BOWFhQdU51T3dScThxeXBhVnlE?=
 =?utf-8?B?NTRDRmF4OGxKTkM1UWlNYUxYV3pwOG5QK3pTSVBLQkdYYzdJS3JGNVo5K3BH?=
 =?utf-8?B?MTBoMkZ1V3hWcFE5QXVLQldqOXpvOHlaYnN4SjlDVzRRajNGRkRxUlV5L3Ir?=
 =?utf-8?B?cTdQb3hvdzBPUDhEYW9PL1YwOGEwZ2Z6dG5kMjM0SVdiY3FHa3FjbWhuajBt?=
 =?utf-8?B?OGpxdkk5VVBIazc3Z2pERXRSWmhQbjZRRDU5Q2RMSkFHbnN3STdSZlRXMHBx?=
 =?utf-8?B?RjlFemY4bjVuTGUzSUpZa0dBa2lZMkQrK1l1TlNiSlhKblJRemdDM3NIS21W?=
 =?utf-8?B?VU13M09zS3h4NVJmTlpMblV6NGV3bjBYRFBrNmlTMWVVcFk0TTVqQjArbkVp?=
 =?utf-8?B?bW01Y09kZFhYblhNbnhFQStCTnQwVThOQzA5VjVBNG1SWnpjeGZhR3UyMFp1?=
 =?utf-8?B?OTUxelBmYnF5M3BiVnR1SmVuMUZlUWJTU1d0RXZ0Nm4vMGJiWVhxY2ZWSndN?=
 =?utf-8?B?Zm5tRkdEbGM1bVRyMytMdmRpWFJFNFJEU0J0cEhTRjJJcG1KS3VxWW84QkR4?=
 =?utf-8?B?T01sNFFuNmdsVU5wOGF0eVNocC9BWC8wL09LNGxXQTBOUktiMW0vbUFtUlRw?=
 =?utf-8?B?aUtkcEJDb0ZQRExDdmczSUZ2SldYbTYxeG1HR1VTWnRlUVNtck5zK3RLWmUw?=
 =?utf-8?B?amI5Tk1aRk5oNDBEZUZFZDdJTHNldlVrVXdudXFGdlNRNmlWWWtqaEc2b2Zi?=
 =?utf-8?B?dlhvMWZoaTJOWERSRkFFYUEwazc3QWNMMzczeGxHV3htbjZLWEVzY2Q1TWZP?=
 =?utf-8?B?M0J2SGRPWUVQSlF2eFRBNnNhOHVGRk9jQnZ0b0tNNjZIV1R5Z1hGdGtnNEZw?=
 =?utf-8?B?cU14UGN4cUtnTlo0SGozeG95N3FvMVVZVHBEQmtFVnExdi9oMUlHWUpHK1Uz?=
 =?utf-8?B?bUM0WGJBbkJ3UG5XT3ZpRHdOb1RYVmNrZUZ2ZXMvSW8vL2xlSEVUOHBVMVNP?=
 =?utf-8?B?RlQvRjBnMWpobHVuNmlUVUtONnpOQUVmbDVScFNocjRNUVRxVXYvbXF3OEM3?=
 =?utf-8?B?dXlNYmZ4WGJkU1g5WE12QXpBMWhEczVKb0RQdnp2OHhpdCthc1NUWkE2VXp1?=
 =?utf-8?B?TXR0NlF3MnNMNG5pK3pTLzhqTUtJYXVwS2NtV1FObEU4UUFwNlppdk0zcE9I?=
 =?utf-8?B?djFwMEgwWDMzcnlhV0dSNndBSFBqZGtLOGlSN21wTEY4ejFocnprbnZ6ZjdH?=
 =?utf-8?B?TVZXL3lObXV6VVN5SnhEazNRbjVRcVp6SDgzS3RBak85MjlUMlNPSUFaMTk1?=
 =?utf-8?B?NnJKVldWb29lenUwYnhoL0hDa2t3WlRKMVFzN21jbjFwT2xsYml4NlNsVGJX?=
 =?utf-8?B?QWR2UWhIeXlHazNpVS9ZdEc5aGV5KzVFenY4cmw0a25UanB5M3BRMXVPaFdT?=
 =?utf-8?B?Mjc1YnpxRFlMVjFvOUVkcGNzOTRPUUYvMmpkWnlQaWRIVnNtY1lac2Z0bUMv?=
 =?utf-8?B?VEdRUVBpVEtkSWtpNUVDRm1adDhzYXFZaEdPMUwzdGpLZzhVa2NRUW9VNzlC?=
 =?utf-8?B?S25malFOYm1HYWJIclZnMlBlbzdkK2l4dkxCM3grVVh6dUxTODZLY3ZUSUFl?=
 =?utf-8?B?V0gzSFJTMWZ0eGVBaVJNcUJXcDdaM2NmTjNmYWxHWkZJQXZhVVNNd3pqd0Vl?=
 =?utf-8?B?N3dKRjVOYUJmVUN3ZTYwV3VxbG1KUTFjM2loMUN3R0FyeUFPNk9KSnRkSzhQ?=
 =?utf-8?B?RWo4OWx1SEVPbFJJUVFCRCtaQmZ6RFZlRC9LMllmV2tBN0RNM1RwekZPS0xT?=
 =?utf-8?B?b0ttZVZlQTVEbThGWkFvcHJLRExZMVVHZDVMSTR0STlqWmtsR2pESGVQQS9W?=
 =?utf-8?B?NEJZSWp6Mkx2OTVBYTNGazhIVjYzUW1sQmZJTlZTY1VudGl3Q29NOC9STFFT?=
 =?utf-8?Q?z8AMNRGkYm/WCFqBO/qh7ZWKS82JAYNQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7831.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVhWN0dUK3RKeGlEY2JPMm5GNk4yM1lySnBYWFVMdGV4RzBKdGZnZkVzR3JQ?=
 =?utf-8?B?a1cwdmRoSklaWHRvd2UwcHdaRjJ1eG9PYjRiK2lGOW4zSWNmR25QVUNKeEcv?=
 =?utf-8?B?QmpmRUFRTVA1OXk2RFhxUENhSmZ1dktXek15aDNTOWNKSWJOcElIK2NocFhq?=
 =?utf-8?B?MHpleE0wUFRaa2dudG1tVDl2N2ZjTU8ybStucE05Z29xNC9WMzJtRUIzME44?=
 =?utf-8?B?SlJBMVFYSVhRR21uWGVUUURFbWZvaUtZWjlkUGpKTUdoZ2dxZGF1WWxCM1dO?=
 =?utf-8?B?bEpRaE51dnNBSXZzWUY2ZGJaY1EwMGw1TUloRmFVaC9JYkw3amdvdGRmT3pv?=
 =?utf-8?B?MmZLckF5UXd4MXZvMFYyVGJZZkJiRUhBc21pNHI1ZzJDc2Ryd3lFNXpnNzhI?=
 =?utf-8?B?T1JHbDJVY2FiWk1ZUVVaczJuakpCUm1CL0JpajRsUXNWL2pPclQ1Q0lNZGcz?=
 =?utf-8?B?TGNyTHZKQm5SU01CTThmb0wyaHloQ0RqZUdLeFlYQzBHOEFmOHBSakZkb0l6?=
 =?utf-8?B?UzJTOXBSV0ROSzQ1MUJSL2ZEUUZ5VlpSNjd2cVRqaWNseWw3S01RdWhRNzdx?=
 =?utf-8?B?Z3l4Sjk5eWduMkZuN2dzSSsvcnRSNWVRVXkvVHZRUXF6WmZ6aTdwa3VtaktO?=
 =?utf-8?B?SXdSYUJhVjZDVXZpTktPNE1zMjd6SXlaS3ZkNHJ6UWxGcHB5VGtUWExNVWIv?=
 =?utf-8?B?UnF2RXMvN1pjL1VHcTIrZGg5Qk9GSGVwZnVyRUlmYmg1SU9EdTg4T3pQWlVL?=
 =?utf-8?B?ZlA2c0lRTnNONTVDK2VXYmQ5Y0t0b3JyMGs1VklVUElHSXI2NkU2WTREY1dp?=
 =?utf-8?B?R1BzRkp1dkpMSlF5ZW95c0gyZy96UGFHZXlCVWtBanlndmNSYnlRNWwvUWJr?=
 =?utf-8?B?c0lwRkhMSWh5TWoxb0lYQy9ZOXgxMFdYdEM3aEhXVTdOSDU3a3pYRXV1aXdu?=
 =?utf-8?B?SjBQVW1aZGZ5eUd3YWh3cnNSUXI5MDJoNXJHNmh0ZEdhMStOZjFlTGtjM2F1?=
 =?utf-8?B?NjRLTkVqbU9YYjBubTEyS2VPenBJNzdpb2VkMzZiSzB6MWV6bGlXS1RSYWYz?=
 =?utf-8?B?ZmZVOStEdjF0NFBmQ0QzcjVxKzBFWnVIUjdsSjVjKzltMkd5VS9HK2lPbGxL?=
 =?utf-8?B?NFBXVklXMVNHZ2Y3ZUhhUCtlQjNrZVFBQXJzbUFHb0VwMFpxeWVoTFJkaEhr?=
 =?utf-8?B?WHQ4QlBpcGljRWxoSWpjOEJJMWJpNUxZb3NXWmIrV2lEdEFIQ2UvZWxFTFNk?=
 =?utf-8?B?emJTVm5pVGNrcWFsUzNOWDlCdEZuWDZ0Y1FZV2tMVjd2QmNMd0NDNkI5L1VE?=
 =?utf-8?B?OVdjMkE0RUxvcjQ0YXN5blN5TGJtUkJ6TllPWFhUYUlTYTZ0VnRrQUlid2N2?=
 =?utf-8?B?KzFWQXJSZjJhemdORk5pdHgvYVFiRElPZ1B2ZGk5bHB4eWlibUh6QkxBRlNH?=
 =?utf-8?B?NTAyNkJtSHp3UlVRMlNOM0kzSmE3dFNpczFWampxc3hmS3d3UDQ1OC9ZYmM3?=
 =?utf-8?B?RGk3QkVhTE9IdVFwTk9XaDhCQStld3Y3QTlKazJzNWN4ZVNVTGwyWC9HaDBp?=
 =?utf-8?B?OWdiQ0dUV3Z6eWtKL2gzRjlTV09mbERTWlhwKzdQM3Z6N2NKSHlsanlkbFI3?=
 =?utf-8?B?TU1DTEFuaHczaG9vNi9GN3RDRTlOblVhcitaSlFuQXFyMDZwQ0xQMXA3eU4x?=
 =?utf-8?B?bzJiZ3JxVnR6T0tNbmJvNzJUZVlZMktUaDQ5a2srTVl6dHJ3RFplamJ1T3hu?=
 =?utf-8?B?eGptZ0NCTHlRanNNMEhaN3l1YzZHQXYrMlFuUDJPOFNoZUJSWnNOeGRPbTRS?=
 =?utf-8?B?a2hzMCtKZGZyeWpxYkVDdksvcEtIWlRWTEs1Z0J1OEo1RVBTMDNBUTVIZFpa?=
 =?utf-8?B?d211dENCYUppSlMra3BQOTgrem11QXc5MmJtUDVkSEZwdGtJeWNqNFhCbG9i?=
 =?utf-8?B?TmV5a1pzWG54Z0E2N3ZUQ1VFYks5MU14amZrLzVOdlRQaFp6YVRBMjI4QXJi?=
 =?utf-8?B?SXZWVFlNRHZ6THJvUDBkSVZZZVVEMnhEc2tCemVlUEd3dGw2ckFYTDNhTzNK?=
 =?utf-8?B?RmpoWklBRUJEdytJdER4UmNlcEZXamNPT0lWeCtFbFlmbTZic2dxL09TczlM?=
 =?utf-8?B?MUEwRnRmK2NxL1FNREJQaUEvdFFFQzBxa1MvNDBZU2RyMDk1ZGh1N1ZQZkRJ?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a828793-f943-4a9d-b237-08de22231fd1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7831.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 19:38:58.8047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+kcA/Lu0uR8pOx2tFb6ohFa+ei3PcxA94k7EsUdBQNxoC1Xj929Qeh/fi1rkUjgZurTO12yRhOO3B0rrd28ZnK+zKaygCNwV6rZzSJIQ00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
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

Patch does not merge cleanly to drm-xe-next. Will issue new revision.
