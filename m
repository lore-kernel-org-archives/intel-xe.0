Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF5FC531DF
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FF910E4C0;
	Thu, 15 Aug 2024 22:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SU9DNPCa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEDF10E4A2
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759689; x=1755295689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8kOzBVSy2X/0z7Gd8XWIVE10orJ7EsJfYMCfjvJC5c0=;
 b=SU9DNPCaNFcrIUE0gzRoiuq2vdXzbf5aT4DerqCXlAGUHp0JTYGPJWA2
 673ty9HWie0I1dskEYRd5gpoOMKkb1ypExGgZXe0BcQ9F5pEI2zKUBBBR
 iTyxOB0N8He6U5kbQcqHKEx6A/OMCDWr8IcjpxCBGiI7PKiNE5QffZ4A7
 TIo1nfVOVs0hQMpd0fZcDd9IOxIXLPkpkFzS9HxEKs6vFDq1NK+VHo04E
 ZWxtouf00FyG5j/nUw/TxDgfGejiAl0I+Hrnwkdvfnvh8cgs6vks8YGgI
 TENXLoGf5R8woO/cMoLc0KwsUnJqCJgd/x/KpFy6gNegQmN/tQmjadh7E g==;
X-CSE-ConnectionGUID: 4qOwthL0SIWKlgwIOU1BvA==
X-CSE-MsgGUID: I/f/2pQCQ8mRve64zv+LtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22213935"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="22213935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:08:09 -0700
X-CSE-ConnectionGUID: e7bYqe59T5aaCquXg0/l6g==
X-CSE-MsgGUID: YfjaljpFT4G5s2b4xwh+cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="59766496"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:08:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:08:09 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:08:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:08:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:08:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKUAizy6dJor1CzoxctNmBf2+0H6e+6dIgMxhj5hOLEVN/uIMekUEi/lvysApUam5wevXxS7UZ1+4E3L/ttQF2AL49P7iW5wzMd3v371gmC9xZInAvDuP4X00yrsr6s8CcqV1Hq2j+XALR3UZeVU3n/eOcvuKqrNoLDulQsGnaLYA7EulhAB7Kb7z7jiWTbfu08520jtqrAPXOBVtmZ4OarF8FUozYZZalEgtyA3Vqi1jzUQkknbeI0O1Hh0o4ffEuLgKvhfVsXZr4mdR4YcGX6kB0yYt8Ek3VfHQFlg1tlzrBJXc30x9CP7h1lvlFEl5V6fWwIOV7/+AZsqO8Kx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXFt6taclsJ8BRG03RC3Swhx0zzZ8XxwGGHLeZyIcFQ=;
 b=FQTTLXfKm/GMDOZIU75JfWOiCnGBAOWR3yFYh8HDRxfWytAU9av41Z6KimYgXh4BSn19ESlL9BXnkOpjiekPbvxiZV69c6EWpKJbD++6dzzWT5HITKm1JAsbX6NRqolo8IX5YRCK3ejd3p2XWhZX56EIHGKzGpVyOdiJ1Oy798KuQTnN7byKy5zhvVyKYYzjzJBYy/PEnxK9vcmiNMFxFdS7+9RD6Ole5JkUHOzBasKfLlh3zlWZV3mnFzpYQ2Sp6YmVHaC44izxJQ+Qlkwa23eMj5vsud9Vh+JkHYjxF+gFSExnAV/xyF03vKICkA2juRxRmMh9PvtdkdksrD0Zcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:08:06 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:08:06 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 12/12] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Date: Thu, 15 Aug 2024 18:07:32 -0400
Message-ID: <20240815220732.49675-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:a03:100::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 5880712d-3de1-443a-2985-08dcbd76bd77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3NXelFtZkVKTDBWVGlDNHFITC9RRkhsRlBWUFJ5eTVJVzNMSE1IRm1JUTEv?=
 =?utf-8?B?dGI3eklLRGl4eHVMbmJtOEE5ZHBCekNHaitnYnZlZi9HODJFeVMyRVI4M0Fr?=
 =?utf-8?B?clFRU1VpNllKOXkyUHpDUHZHY1VsR05IUEtLM1d4NExKRG8zNDg5SUhrMWJt?=
 =?utf-8?B?M3M2UXJDSUhDRVJSUDJuQnpjQVVsYWdlbXlySVhEa3VzWExJM09XL0hEL0VG?=
 =?utf-8?B?ZTkzM3o3amN0Q1h4RW5QZmFHS0JGTGU1amc1YnpjUXJIQzJXdDdWK3hQc2xw?=
 =?utf-8?B?S0grN1BOM1lCKzk2V3JjbHNrTUhmYlRqYUd4SXluQ1B3NCsyRWZHK0h1UHdN?=
 =?utf-8?B?VmlGbXVSMXdhM1JZQTBqaDVBREFUenIzc0FNV3BJNEJOWFdwQ1ozU2dtRjFz?=
 =?utf-8?B?YnJyM2x1U1lUQ0xJbDJKdlJWSjFsenVadThjVFdSSzluSTJqK2l0MFRCVk5m?=
 =?utf-8?B?U1ZxOHIzb0l2TEJXa0tMV3BEVWg5TDJuV0dTUE1xMWRmTUd4RnBHaHcxU3dX?=
 =?utf-8?B?c2diWVR6NGJ1RytUR2JiZzVxMHErcWRLV1VTY2xYRXZKUS8zWGU0VWVZeDl5?=
 =?utf-8?B?VVZya3F1U05mNTJMQkp3blZRcTJnOUpYaURKQnhET1krbUt4aGRLcFRKbEl1?=
 =?utf-8?B?akkyckZKK2IwREQ1K0Njamh4dVlPOUd6c0N1K1E1VTU4ZGVCTnlYWWxjcVJL?=
 =?utf-8?B?cmJPalFEY1J3WGFDMS9IZmRZUUEyMDlVandtTHN6a0g1aExIdlg2K1FRTFY4?=
 =?utf-8?B?WkI4Q1hESnZnVWhqV3FtTU5aWWozd2UzcTZKUG1MdE1HSGpUQWhEWGJ6Zmhx?=
 =?utf-8?B?bkJCaHErOXFzS09MUG9IUCtmcWRnUE5Kd1hMTXdROHpDZ1Awd2JuaFdORkpk?=
 =?utf-8?B?SnpadFQ5bjV5UFpaQkVFWmNaV3d0N0tNdzVDTWFwYk8wVXZ0M09RMVVLK0s1?=
 =?utf-8?B?elNWR29CTGQzMEx2Y1RZUHV5UDZwVzc2WTdHN0k4L1k1em13MFpoQzRqYzhN?=
 =?utf-8?B?YjI3YkVoK2lDaEtOWTVqc2hrV1ZySVVGUWJTa3BNeHltVEV4c2RRNTNDUXRv?=
 =?utf-8?B?ZkN2dCtURUJtOGJmZWx0b2NkbGVleFRpSWMzZG9sYkYvbUY4WURtSUtCMWE0?=
 =?utf-8?B?MmUvUEZjNXFJVHc0cjlqSFd5TWlSeHRsWG1nR0FMczV2YzlIaGt2dzA0KzhQ?=
 =?utf-8?B?b0JQUDRlL2tuaW5oY09uSThseWtMVUU5Y1hzV2tRVjgyT2tWNHkvcjJ0Q3lY?=
 =?utf-8?B?dHZneTdkdnp6aEtJQXNOUVhqVTJDdDZ2Q055WHJZTzA2aHk1T043RlVQWVFw?=
 =?utf-8?B?TEFVc2R6Q0cyMTljRklidTZmUlM3cVJLalIxekhUaWM3UUtXdlpETXMzWVBE?=
 =?utf-8?B?UktKSUg5QmhsVjRLOEJNNS8yK1ZVTjJ2ZmtMY1N2cys0VlIzNlM5L0hSWHFD?=
 =?utf-8?B?VFFkbkVnYUZzOE8wUndnV25MaHFlY1BkaTA1NERibHBsR1lQMFRNRjdxbXFh?=
 =?utf-8?B?RHQ0RlNoMEtIM0xyMkswMXVwSEhrdWFVZE1aN0FDR0dKQUZIVUF5RHB2bU83?=
 =?utf-8?B?RlZpZWlWc3FuTUFYYWpjZFNXdjBLT3RPWUEycXpVZGViWWlGNURUSkVQZkxF?=
 =?utf-8?B?cEFDcndycGRmY0NtSEFoZFJnK2plU0RkSjVHdkRNSjlEanFEclU2QjBpM2E5?=
 =?utf-8?B?WHdLM0Z1N0hoM0VES1lrZGNCWFhURFZ6UnprNHUrZFpXWTRBOXlKSmxncWhs?=
 =?utf-8?B?N1dMSlR5eUVCN3hneDlXSTl1QytFRWV0NlcxMDJJb1RaSkU5N1QweVoyWlRR?=
 =?utf-8?B?M2FnK3ZJcWNkUkZvOVJjUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlAyRytNbC83ejFhSUY3dmJMblVFMWRRb1lic2ZmT3c0Uzd2ZmtMZ1A2VEFD?=
 =?utf-8?B?N25UTmN2K1hxbU94czVMRjQ4Wi92dHFVaU1oVjBOQVNkM1RrR2RNOGhZK1o5?=
 =?utf-8?B?MVRYMlZQZnpRTDhlS1hvN2FFNmpNTzE2c2RsVzdKWm9GQ0s3ZE9paEo0RHhO?=
 =?utf-8?B?c3ZDVlc1YlcyaHJOSDRubnBmSDIwaTJ5RGcwRk1GSXdsR2FKak1KOGR0Ris1?=
 =?utf-8?B?VzdsRmh0RUpVOE1zM2FKR0Nwd0RVUVlrbGtsc3RWUm50R25kNE9lTG52WEEr?=
 =?utf-8?B?QVpaaG1jc3lWWVZXd3l0YkZKL0tJQ2UwYmdnbXJGU21lc0xyTXk4WENIWHFE?=
 =?utf-8?B?MTFrb1FUVm1tbldHNElKZkJEVSt5UFlVZDlnMGFkOXBXUktxMHUwQ2kvRndw?=
 =?utf-8?B?L0hWZ3N4YzhqK2pTaitnSWxNVFdDOThFTGhDbmhYbCt4Ym9uVXhKL1pTbFdt?=
 =?utf-8?B?UEdVcnpvaTNyMjJzVzdGVlk2QURVNVRidjBNd0xhRC9ORnFBaDBVVjYxcVIy?=
 =?utf-8?B?QVJlWEs4Zmp2SmMvY2RTTFA0NXpIa043N1hrbWNBb2NVS0RDK0xYb1RVNjhm?=
 =?utf-8?B?a2JTZ1k4OU8ydk9xT2h0YlAxUk9jTFY5YThkcHh3L00vR1J2TnBtakVMSjRS?=
 =?utf-8?B?WENDemtwdFF3M3B2aXQ2TUJXR2YrQ1g2dHR6a0VjWDZFZWpiYWplVEpXbzVj?=
 =?utf-8?B?QUYwUFZJUHdsY1dFeDJPek4zNVZTamtQNXIzQzh4VE9HVVFzanpISTE5dHY1?=
 =?utf-8?B?TlBPWk02Tks5M1VIRk9KZlpSYmVtanNxL0Y5VlpGNTJzeFp3Z3BOZnAwUExr?=
 =?utf-8?B?YkFScnFqUG52V0l5Uk9TREFKRHMvNDE3YnVZcGIvOWhuVHAzREc0SnlxcGlY?=
 =?utf-8?B?Tmd2UURScGhrb00rbU5wWnBWRS9QVVpWSXlHWUJCV053RDcxSHhqSTZ0djVJ?=
 =?utf-8?B?bzlRNGx0Uy9vQ3c3bkN6a0MwaitCOCtVd0xjd1RtbEk4UVJReG9IdVlQdklk?=
 =?utf-8?B?NFE0RStOVTBtakE3Vy9CeGp6VzhzNHFxOTJQY3BidHNSNHZ0aHZFV1Ivc1FP?=
 =?utf-8?B?c2d5MGFZZlk0UmVSVHlqelAwUWVTVEFJV21yKzlQR1lINDZCRCtWYjNxaE9K?=
 =?utf-8?B?SUYrV1F1ZE1TdEM4QVNJVGQvZzZ3SGpOaHh1UWpqL1JlR2MydE41NzlOaXll?=
 =?utf-8?B?WFRRUFlRTFQvWUFSM0pWL0VOeTcwSzdvdVE3cHNzemJMQUpYcFNOMy8zKzRo?=
 =?utf-8?B?ZURoL3hMZERSeFo4bW9Wb0tVRVFiUnp5VnNaSmEyekZqRWxoMlR6MUdNM213?=
 =?utf-8?B?OGNVWTVyUmRMOS9RZmFOZVNDYTFtTnlhc2JlVjMvZi9zK3I2ZTREdWVpVVpM?=
 =?utf-8?B?b1BMeU00V3V1SVpIcEV3SnppL3h2YWNjSTlyYnNtLzRNcllDZXAwSzY2RFVx?=
 =?utf-8?B?ZGVIY0hhcEJjdXdFR3JCZHJaWEdGcXBSWEdLNDg0NnI2Tjh5UWJEcFM1MXBq?=
 =?utf-8?B?NmZHOFdVMEIzOGNLWnZjaFNJYWxudFU4WGhvVk53R3F6WnFja09jaHBGUHdX?=
 =?utf-8?B?RC8xZGZUVWRtYThiZktqbXNyUVdzb1FxbVFidVcyVGdjSHE3MHpQQjhMUlZY?=
 =?utf-8?B?Tm54REdOMzlVc2dUdTVSdHY5bmJZOHFHVmg5UVdaYkVUY0orRmNyL3I3ZzFW?=
 =?utf-8?B?Q0FBUXh2RTVaOHRsZ0p1eEoySy9GM2tFM0Y1bFFaUkF5OGdkTmJRRXV3b1Fw?=
 =?utf-8?B?ajMrS25QdlFSNVlBL0h0SkZtd21BMmlBYmppTEhSb2hrQlBBVG5kZFFYSUIr?=
 =?utf-8?B?RTR4MlF5d2hROFVlQkwxN2xCSWJyczNJemhLcERrRkNrNTlMaTlUNjM4dXVK?=
 =?utf-8?B?N212ZmZzRThZQjI0U1gyczlPY2pndUYxYWEybHQvbXFJamZNTlE0cC82ekQ0?=
 =?utf-8?B?YmdRbXUyU0RTVVgyWldmSm1GRkliTjVpc1lHblJCeitmL0V2UmpKazBMc2dN?=
 =?utf-8?B?SU9IYWE1dHZrMHJoaWp4anpET2lIUmI2ZXRLQm1iVTZSekFhZUZFdDZzZjRK?=
 =?utf-8?B?NGRDTUJMdzFNMVg1N0E1L2dXQ1FxOXhGQS8zMVVLK3dLMTh5bnM5bmRLcXlL?=
 =?utf-8?Q?TS3COLWRig+Gk7D0TalXFbCAl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5880712d-3de1-443a-2985-08dcbd76bd77
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:08:06.3991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/Erno+o4EQs3Um5UFHwghpHtNxrygGWQ5GsKszuwLZazA4f6SCypiiRE+D9uJtTOkI+eaaPg5nZ0oBdcw9S1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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

Defer the ggtt node removal to a thread if runtime_pm is not active.

The ggtt node removal can be called from multiple places, including
places where we cannot protect with outer callers and places we are
within other locks. So, try to grab the runtime reference if the
device is already active, otherwise defer the removal to a separate
thread from where we are sure we can wake the device up.

v2: - use xe wq instead of system wq (Matt and CI)
    - Avoid GFP_KERNEL to be future proof since this removal can
    be called from outside our drivers and we don't want to block
    if atomic is needed. (Brost)
v3: amend forgot chunk declaring xe_device.
v4: Use a xe_ggtt_region to encapsulate the node and remova info,
    wihtout the need for any memory allocation at runtime.
v5: Actually fill the delayed_removal.invalidate (Brost)
v6: - Ensure that ggtt_region is not freed before work finishes (Auld)
    - Own wq to ensures that the queued works are flushed before
      ggtt_fini (Brost)
v7: also free ggtt_region on early !bound return (Auld)
v8: Address the null deref (CI)
v9: Based on the new xe_ggtt_node for the proper care of the lifetime
    of the object.
v10: Redo the lost v5 change. (Brost)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c       | 107 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  12 ++++
 2 files changed, 79 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5c04c1bc8417..110acf828974 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -161,6 +161,7 @@ static void ggtt_fini_early(struct drm_device *drm, void *arg)
 {
 	struct xe_ggtt *ggtt = arg;
 
+	destroy_workqueue(ggtt->wq);
 	mutex_destroy(&ggtt->lock);
 	drm_mm_takedown(&ggtt->mm);
 }
@@ -242,6 +243,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	else
 		ggtt->pt_ops = &xelp_pt_ops;
 
+	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, 0);
+
 	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
 		    ggtt->size - xe_wopcm_size(xe));
 	mutex_init(&ggtt->lock);
@@ -276,6 +279,68 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+static void ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			     bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	bool bound;
+	int idx;
+
+	if (!node || !node->ggtt)
+		return;
+
+	bound = drm_dev_enter(&xe->drm, &idx);
+
+	mutex_lock(&ggtt->lock);
+	if (bound)
+		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	if (!bound)
+		goto free_node;
+
+	if (invalidate)
+		xe_ggtt_invalidate(ggtt);
+
+	drm_dev_exit(idx);
+
+free_node:
+	xe_ggtt_node_fini(node);
+}
+
+static void ggtt_node_remove_work_func(struct work_struct *work)
+{
+	struct xe_ggtt_node *node = container_of(work, typeof(*node),
+						 delayed_removal.work);
+	struct xe_device *xe = tile_to_xe(node->ggtt->tile);
+
+	xe_pm_runtime_get(xe);
+	ggtt_node_remove(node->ggtt, node, node->delayed_removal.invalidate);
+	xe_pm_runtime_put(xe);
+}
+
+/**
+ * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &xe_ggtt_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
+void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+			 bool invalidate)
+{
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+
+	if (xe_pm_runtime_get_if_active(xe)) {
+		ggtt_node_remove(ggtt, node, invalidate);
+		xe_pm_runtime_put(xe);
+	} else {
+		node->delayed_removal.invalidate = invalidate;
+		queue_work(ggtt->wq, &node->delayed_removal.work);
+	}
+}
+
 /**
  * xe_ggtt_init - Regular non-early GGTT initialization
  * @ggtt: the &xe_ggtt to be initialized
@@ -482,7 +547,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
 	if (!node)
 		return ERR_PTR(-ENOMEM);
 
+	INIT_WORK(&node->delayed_removal.work, ggtt_node_remove_work_func);
 	node->ggtt = ggtt;
+
 	return node;
 }
 
@@ -499,46 +566,6 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node)
 	kfree(node);
 }
 
-/**
- * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
- * @ggtt: the &xe_ggtt where node will be removed
- * @node: the &xe_ggtt_node to be removed
- * @invalidate: if node needs invalidation upon removal
- */
-void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			 bool invalidate)
-{
-	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	bool bound;
-	int idx;
-
-	if (!node || !node->ggtt)
-		return;
-
-	bound = drm_dev_enter(&xe->drm, &idx);
-	if (bound)
-		xe_pm_runtime_get_noresume(xe);
-
-	mutex_lock(&ggtt->lock);
-	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
-	drm_mm_remove_node(&node->base);
-	node->base.size = 0;
-	mutex_unlock(&ggtt->lock);
-
-	if (!bound)
-		goto free_node;
-
-	if (invalidate)
-		xe_ggtt_invalidate(ggtt);
-
-	xe_pm_runtime_put(xe);
-	drm_dev_exit(idx);
-
-free_node:
-	xe_ggtt_node_fini(node);
-}
-
 /**
  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 0e8822ae13fc..8b83610c6ee6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -47,6 +47,8 @@ struct xe_ggtt {
 	struct drm_mm mm;
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
+	/** @wq: Dedicated unordered work queue to process node removals */
+	struct workqueue_struct *wq;
 };
 
 /**
@@ -61,6 +63,16 @@ struct xe_ggtt_node {
 	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
+	/**
+	 * @delayed_removal: Information for removal through work thread when
+	 * device runtime_pm is suspended
+	 */
+	struct {
+		/** @delayed_removal.work: The work struct for the delayed removal */
+		struct work_struct work;
+		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
+		bool invalidate;
+	} delayed_removal;
 };
 
 /**
-- 
2.46.0

