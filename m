Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9348BCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 11:21:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5216510E701;
	Wed, 24 Sep 2025 11:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gdTaLONc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6142D10E701
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 11:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758712886; x=1790248886;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Oq5KtwP8vQrGbtMimDr7y1IStk4iVGh7Vx1FWckSV+4=;
 b=gdTaLONcLJpkIXJ5WNt4Aez8ft3JHShZPphnFbZMdQef1U2ih97AnVRZ
 AB3fVDNHgAytW9FRiZEaBm04++fCbGZtWp+MMR7Ux5WI5U7X6nn4dqH/T
 LY9OXHFAx5Ee6fcOturcEUh3pR/+ccEHoBeb2Z6LM2jyPIrrTB8tZm/mG
 dkI3Zam+0W+Etzx10LQRHyNAnughwh/1MuyOY7Ok4G3Q+fljjKsTAriMO
 x2q4UcknQW9GJE0Q6wB3s/SWNngfxdtG5ymsRwHcSKDKSkPyv9lNqnpn2
 BgKtqqrmwr+yDvOYlKHb0gvVEz4U55AsqxP9+cheqMJasr5hzdFKSI934 Q==;
X-CSE-ConnectionGUID: jJyUB5TQR12ggdQrDH9/2w==
X-CSE-MsgGUID: 5UozhTlaTQK0ZE63uLEB4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72364146"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="72364146"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:21:26 -0700
X-CSE-ConnectionGUID: pkcAVnIHT8ue1lQ+iPAsfg==
X-CSE-MsgGUID: xqcZX0cxQ4CR64z3gBEQvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181022148"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:21:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 04:21:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 04:21:25 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 04:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XmQpOGbsb+IYD5ErCRVy6XTXLoIuemsgEZkivVetkDUs+UmXgxOzjIL++G27bKZGbVlpyTqmotz/zwZiqa++c8zlVcACXGrzEnzo6eVXQh7lSv4eht8rwRTej7N//tkaFRcFoiBpxoLhpPy1LOC2WayjhSczK8beeXX/fEv0UZbA1g+1KcLM2k07leqCt+ynXAypKaIep8+BJufcu3Mq8sIvAgBJtQbfbqWSIrrZLpw6arOrX4wVl1ROUDv6N02DE0cIupf+cG/nGkXAdZAmowBF8pecJrgTs1UxMznCDGKvjySCWsl6ixcQWOIpR/X1S970+AFm3evmLMmPUyTAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvN0+pjMpEzx2jxMyonES5rwcVPWfcnjCQ4sI5TU9I0=;
 b=eOnNH/BRQ39n5qATZG8uevGY7Oe6h1ptyDwykMbcJ8jMBszTWIhGn7Sp3YLNT0UNZ266NdAC5hnqgsjUz/QfGBqRGNaBA4C4vNlYCf5iSJd3utikqAlMzzG8aiug1GGMGug6fpe125eZD95JFhyHe9GGjkHrRLPGcQWOo4Nmoe1FWLAEU+yzXIhLNL/HTS1z7byNOW02A4ueE5ZScamE+crIPPGPHQ8g/PkAT3J+wB85g7TUgcIcSSEP0xIgh2+9X9oNGbWVIhMs6ZzwUgSdvgUVXLNsv8vByyng0/SRgjDYTl1gtxFkEp9R2PTjnGgIxSICyH+EhaWoGCKxMddTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 11:21:23 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 11:21:23 +0000
Message-ID: <c44e9ebd-33d1-488e-bba5-724e00c0e7b9@intel.com>
Date: Wed, 24 Sep 2025 13:21:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/34] drm/xe/vf: Stop and flush CTs in VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-22-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-22-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 56631a9e-decf-4cba-f724-08ddfb5c7e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzFSc2tGVU5kL3Eyb3FJQ0s2c1ZST0ZjcllIc1U4d292aUJ4dFoxOWtKU0Fy?=
 =?utf-8?B?N1BNcFVvUjR3SlpQL2c5SjNqcVZnOG93RnJraDhkRU94N3U2cnF0czlMLys5?=
 =?utf-8?B?b0pqN3VBWG1Da0k5WFlnaWx5SE9BaWxzTHo4WThNMEVRYlZ0NGJvOC9zaVhD?=
 =?utf-8?B?amx6dk5qajhSNjFwNHJidzg1d2l4c3NDOXFOTHhoTGxUQkNsY296aGFIRnpE?=
 =?utf-8?B?dUZlMTIzeW9od1JhQzFjRG05am5nUGdxeDZRU1BLOCtoNXpsZmFOSGg5R3JL?=
 =?utf-8?B?NkJLSGptT04yT3VsVk9KMWg3YTI0a3ptQlZoUVlzVXVyc0VsRTAwSDFxMElm?=
 =?utf-8?B?cnRkb0FSdEdnYXRRdjB4NkJaS3I4eVlJbjNwMHZKZCtld0ptaE9obEZPM2tB?=
 =?utf-8?B?c29JbFBsaE9ZUnYwb0Y3Qm5mWkpOTG9pb0FUSWhDZWVSblVxeWJodnBjelpi?=
 =?utf-8?B?ODhXV1huRm5uRWZMektCUVNoY24vbzZwRm9FNUxKK2pSaW5BK1pyRmQzWjFi?=
 =?utf-8?B?U01EVGJhZTNpeXRHOFZRaUl1MW54QmZ5Ui9YV3FYTnNYd2lZeUxuc0hsKzJN?=
 =?utf-8?B?eE9ueTlsR3FReldRU0FzK2ZjZ1podDRKd2pteXlQc0lvN2ViVjZJak1YRXRR?=
 =?utf-8?B?NGg2OEM5aUxpL25iaHl6TzI4VjFSbUhjQ25VblUvQk1telE5UHg5ay9KV2VR?=
 =?utf-8?B?c1V6YlFCT2MraFNtcmJDUDk2YjA4cGxyYXVGK2xXU3FYK1lHcnVYRjlqUFB2?=
 =?utf-8?B?SGEzaWFtTmVjSEJHdlYxOHFJLzltb2I4K3dLWkVSRy80a1FuNWM4b2J2THhG?=
 =?utf-8?B?dXVWWjhTN2JERU9xdDlJRDFBRmFNaTZxL1RsdGUvbGJ1YUZuNWhERDlpTmZk?=
 =?utf-8?B?Q3c1KzdnZnlxd0g3eUIwN0RqQ1N6akpJOW51TUkyUkdqVURtNHU1RnkyVlp0?=
 =?utf-8?B?eWlSeitoYS9NMXRGaFVPS0IvSTJTb0N2cnZhMEJGZnpRTEtvb1MzM1gwLzFq?=
 =?utf-8?B?SkhjK3VSYjdSbVhUVCsrcTZuYWdyYnM1ZUR4VTdUVjdMa1Z2ZEIxVFBXbGJH?=
 =?utf-8?B?TlM1c1FpWGRXd2dlTk01RjBMVXZoWExrcWphRDVaL3hFQlRpUkxWY1JxMmxz?=
 =?utf-8?B?Uis5S3RvRUdIWDRYaDRIZncvdm85YXJ4d2RqVzJqNys3YWhnWUVPcDNLU0tt?=
 =?utf-8?B?dVdiVzJvMEFjdGRxOXpWQ1EvNDNVV1ZTMkpSN1Rlc1JFVktub0RjUUpKWnNB?=
 =?utf-8?B?T084ZUVrZEdTR09TQnlzbVd3QlVmVU1zUzgzRSt6VzZEWExnMWdtWjlSQ2tt?=
 =?utf-8?B?NmJOY2RWRDRYZHU2NS9yMVJQbDdCenBoczlpblRBQ1NaSWR4U3dMNU9CWGNI?=
 =?utf-8?B?RTkyY2lxblBreURSUmtZSVJ4MWlaQ3ZBMWZnVG5VTVIxY25VdXVXTkhBOTl6?=
 =?utf-8?B?VWVtdjRWY21UNjBDdUFkWWJVYUtTUkV5UkdmWWU5RjNxaXlKNG9DSFNiZ2ZG?=
 =?utf-8?B?QmVBZUVrMVN3N1h4eWlPWDBRdjNqTmVkU0NENGsvTUhKT0xxVUlkTTRjS2My?=
 =?utf-8?B?dmx2cnlYck5DbFFHVWJBVGdEWC9EQkVTVk1jNmx6ZlZLbU1XTkpYd1YvYTM4?=
 =?utf-8?B?MHdSS3pNUDZlQnpSSWV0TUd0UGcza0lhK1hyTW5GZG50eGkwNURtYnMxRGw4?=
 =?utf-8?B?UXF5NnRQSVJxSytSMmV6YWV4UDJJM2VaMmZlVjJNQ000MVVtZnMwUUNxYXFQ?=
 =?utf-8?B?d1U5U0swYmxJZ0U4WS9udVo3OXp1SC9KamNuSWQwS3d6RWJHNDhnRDcva3Ro?=
 =?utf-8?B?RGFkdkFwR3cremJQb0hYWkloZDA0YkEwL0thNGpFNFhVT09YcCtKaEhPZEpy?=
 =?utf-8?B?MHRST1BZTldOaXpjcjFXK1BIREl0TmRVMDc5TlJHMzdzMkY4NXlFRjRSZGh0?=
 =?utf-8?Q?xNhpnxJRqCE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnBsMGpEVk8xUnRmSFlSeGxIMlFNM3lWMGJWa3d4dnJqQ1drUDU4VFZDUDhu?=
 =?utf-8?B?VE01bWNWRG9jcFF5K1dwVmUyTTdYYWVicm9EK0VjNUZxTTBsQjM2dlZPa3Rl?=
 =?utf-8?B?N1BaMktiK1Rjd0UyL0ZCUjhGUnUxR3loSzBPK3JlSk0vOHliVktiOHljU3Vh?=
 =?utf-8?B?eis0enNFakgydmlqd1QzNGVPZXpGVCswWGlwbHhrakI5QVpFS01vNXJHbEJy?=
 =?utf-8?B?enpxTHc4MXFVclUrVm9GSXV2TVBUeHZyWjhmdi9uV0FvZThRZ3cxQUFDcmhj?=
 =?utf-8?B?eWlRU0ZTVDJIY2h4NkFpMG1yY3dnZ24yZ3U4Q1NzT3YvbTFJVUhSa1R6UGd3?=
 =?utf-8?B?SE05Q0RxQ2NaaEloQzN0ank3YndrWUFicWl0ekhRWEluOVpZZmxGNWY5NkZy?=
 =?utf-8?B?TnhIc1QwSU9najJkK0U2d0ZiRjZHbnhvNjh2dUtuaW5MY0tCRldBbWdHYlVJ?=
 =?utf-8?B?WWpOYW5hUHdwRUtXYjJYWXhVUVNtNzZlblQwWFhlb01BS0FUMDlnOElnODl4?=
 =?utf-8?B?SllabzV4d3dTc2twLzVaYmNjSnJyak5LNHY3WHpydTJRUENsUTFTM3MwcTRM?=
 =?utf-8?B?VDdTSTJocGlsb0Q4ZnBvaEpSTDZRUXRodmVIQVFQU0g2NDh0ODJiYmw2WmFT?=
 =?utf-8?B?OXREOXlEZ1oyR0V0UmZ1NlNIaElObkxsM2dmTkFidXFNODdCT01HUTRSK1RJ?=
 =?utf-8?B?WktTU1ppWEZ0Z054TnpndDYvZG1haGlaOElEVkRlS0pjeVlzaFJRSlM2T3dr?=
 =?utf-8?B?WGY2WFBjSWJIa2tQWVE4MG93THlwdXFORUY0RzhZK1g5aXkzMWcyclI5cThz?=
 =?utf-8?B?b2lGOCtweVR1ZzBnYUxoS0ZZRFJ6aFkyZkpvN00rNk5iSktQZkFHUUtTVTFt?=
 =?utf-8?B?bDljc3U4ZSttbHZTb1dQZUlKbEYwZlY5QXJBMmY1SXF6T29SSDJuOWFIcEtx?=
 =?utf-8?B?NTBpdi9QUTNKTWVGbXVhWmFnQ1ZiNUJGT1VhMVN4bHIzeHlOMW8xem42ZlRJ?=
 =?utf-8?B?a2hKamQyQ3dwRGpPdXhjdlhmQXRxb2dHcWVhdDNYMjJobW5GZTFYL29Hdmpw?=
 =?utf-8?B?N0hCQ0E4bHVXQ3RnVk1JbGJwNHBVVmdxVEhRdFRUVndVNU9kYWZLTEExK09h?=
 =?utf-8?B?UlZ6cGh5SE9pWllZeHVFc2pHeStNajI3NEFhMkJhVEF6VGZyL05vcFNITERK?=
 =?utf-8?B?M3F1REQzUTY5OElPbHdyeWVGK1ZkNHFLRFVZaWJUTXRyWHd5dW9jMEpHUVBN?=
 =?utf-8?B?WUNuZnlCWGVMNEFXMGwwaUovTE1LamgzU1Qvdlg1Zys1NXNOT21TYUtVS1Fh?=
 =?utf-8?B?ZXZPbitpQXpBaW5uQWlUakl6L1IwbXlieWV3MmUraUtuVk96WmVzbW92WU9F?=
 =?utf-8?B?cXFHQjJlRFcydkEvZXNqZ3RlUTFLZW0zM0hJaERCVk43ZkV2UHVIdEVaRDJM?=
 =?utf-8?B?TjZxUmo0cHA0YUFXUVNjYW9MR1BBL1RDVkZ6UWtPRFEzc0xBY3ZFOHB5NVR3?=
 =?utf-8?B?aXpUbmJGY1JhbG5oS1RHanBYaytzSG1lSGI3aExTZDV1OW11L0Z2OWtFZVd4?=
 =?utf-8?B?dWJTSnNVTDNGYkNJbE9IU2xwMmtmSVRTM0pKaGtENk9GbHJkMXA4ckR5Zm1B?=
 =?utf-8?B?aVlSaGRTWThMK2ZyMXVGZXZVRlZkc1NiaXJYb1VqMXhSY1JZQjJVaWFCOThP?=
 =?utf-8?B?dUJRcGxTV3V0U3pLQWtvYzlwQUcyYm94a3ZBRmVsR09yMTczNGJWK25uMkJz?=
 =?utf-8?B?R014Vkt4STRnWkcxRWxaL21yTTJ6U1VsV2ZieloxV0M2WGNZcURzTnZIbzlD?=
 =?utf-8?B?MVEvaEtWUnhJdG9sdG1ROTBUNjFjM013aDNCZ1R2ajdaWHFRSVpTWTNsUkpi?=
 =?utf-8?B?QWt6SGVKQTQzcDNNSzhDdnNEQnZPTGRXZm1WeFhWcUVmc3BGSDlkeXhoaDk5?=
 =?utf-8?B?eGF1Yi9QRWJYSmtQQ1FMS1gwcy9vdEpzUGprUEE3WlYycVhnQzhkWk0wTHpp?=
 =?utf-8?B?bnZ0aWFoVEVHMFRzUUF4NHJaZlN3MWpIaGplMGlvUnArVkgvL1hrSzBnS3Ex?=
 =?utf-8?B?dWpUOVFEVHZVcVlGbklFOFdwVWhUblhEck5LWFNaWGlZeE11QXBCbmQrblFS?=
 =?utf-8?B?cnNYck9hUWFxZ3FRYWpXQWRWMHFVZ3hLZDc3bzNvZmZYWEtOelc4WllHREMz?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56631a9e-decf-4cba-f724-08ddfb5c7e6d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 11:21:23.5621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWUhJDXIVnI7HKK5Lsg4Jht50USHPIX6uv2/93AXMQUpaErFrXtknmHlurfRlZcvBFrMtbq30rw0gfpfuJyOcJJ3sm7hlicHHJk32+emVKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> Flushing CTs (i.e., progressing all pending G2H messages) gives VF
> post-migration recovery an accurate view of which H2G messages the GuC
> has processed, enabling the GuC submission state machine to correctly
> rebuild all state.
> 
> Also, stop all CT traffic, as the CT is not live during VF
> post-migration recovery.

this is what I was looking for, some comments below, but LGTM
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index e79ab4a2a273..071c2c5e0d0a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_sriov_vf_types.h"
>  #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
>  #include "xe_guc_submit.h"
> @@ -1185,6 +1186,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
>  	gt->sriov.vf.migration.recovery_queued = false;
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>  
> +	xe_guc_ct_flush(&gt->uc.guc.ct);
>  	xe_guc_submit_pause(&gt->uc.guc);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index aa9fb08f7856..d4a132b81b86 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -574,6 +574,17 @@ void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  	stop_g2h_handler(ct);
>  }
>  
> +/**
> + * xe_guc_ct_flush - Flush all processing of G2H / H2G

Flush and stop ?

> + * @ct: the &xe_guc_ct
> + */
> +void xe_guc_ct_flush(struct xe_guc_ct *ct)
> +{

do we care about ct being not initialized yet?

> +	receive_g2h(ct);
> +	wake_up_all(&ct->g2h_fence_wq);

this is part of the guc_ct_change_state() called by below stop
isn't that sufficient ?

> +	xe_guc_ct_stop(ct);
> +}
> +
>  /**
>   * xe_guc_ct_stop - Set GuC to stopped state
>   * @ct: the &xe_guc_ct
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index d6c81325a76c..1e32a59817cc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,6 +17,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
> +void xe_guc_ct_flush(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);

