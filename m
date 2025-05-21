Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F31C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 21:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F0410E038;
	Wed, 21 May 2025 21:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFkr4al1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771B510E038
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 21:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747863096; x=1779399096;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1dkXwHlw45PgB6qrFH/E8ROYDnJexusRACP3fFA1X2c=;
 b=gFkr4al1ySo7ksIFhjcjbmCALouTwdo98Czq/fs8Q8/+/vFa1welHtKy
 /vGF81ghVLsZMnOvtdVKS+y9n+vNxeFkTZ8/HkQWB0cvQ/K2CIw3dXanB
 qOQBahZECTrqDfaPHST2LOF79U/qS2XmYO2vi4wmkcZgCw8VfhwlHLR5i
 2pcOOIwNS8bTQ9qOP/MjhLelgklsPGtE5HpfkIB+1yErKfO/obrilgTwE
 tAGJxrNrMczrrfXSj7qG9+XwBhqFa8yehItw3KWhppCOPFxMSXAk0erlK
 bdweyUze/UbGoHmuxRtOm/tFb4j+vpihmCF8clpZn44O7vz9/Tlpr7rqp Q==;
X-CSE-ConnectionGUID: U5e3IojIROOcYBT/Bdbxdw==
X-CSE-MsgGUID: 6sg2pANXQ9qELE+PFnlGHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="48982925"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="48982925"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:31:35 -0700
X-CSE-ConnectionGUID: moiw1sIhQ5+Xmn5jto8Z0w==
X-CSE-MsgGUID: Gk/5H6LsQ1eKc04e+pEb6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="140010426"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 14:31:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 14:31:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 14:31:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 14:31:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atIcL6Pnc2l5p+WW5NeA5xMymYs/ueUoa80q6tzUVfGLTjB/OYEIuX8jCcDWO02BiYDAiPcMICx1O+h7Okqjz/Q14Ytn9vV6oXkg9cojUfT+PfgXjQPUF9RmzzJrCXsUB0ISZGwb+kSWZ5d/4IFYmJANp57zpdtbZtl7kaGBHQ/bFdme9mZmQXtYHeCMXM9VuWAv2vzRIA4sD7/nV7FarzYbXp+DqQJOyyAtf0pwSVTkMlmkHv2J/563czZnOJAkvXKzH5kBTuJam3Bh2DfOzxiPXqeMjBqAfxqEWU1aqmnxgy9Pwxhrq8hdUUPOLmjdZj8L06pM+ZmnX/k4/5NKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKwvxfKFg+Beup+i0DEw/+Dc3taWGUWnzqPd+8GRlmM=;
 b=YtPQhfBx+fSR3fxD/yz8t5ilaDFe3ZvlNDz4Zcmf+zQ6BSqSLijuQuPuR9if14nZxDiKXZGApr4//ACXGrHlOw56mo1VVa4+fdO/Ixa6XBf51ftmZ8wiG/2rnMjFPcyZeSmtIuthk3vmKGSJZHK/2sNzm9VSejNSxiCbkyLv23eA+sqiLAxKt7SFOAH7SBevnwOhSeCCB9Kv2Hp8KLta/wQSVe+zFkbYpQt25q4w0N/Dy3XbD5E89IZ5BRyT+3vmEsj/OMo1EccrXLsC11E5bSi+klQd2/zWr0HzTifQUV5jzimqBkNTeyqN42HkQPuZ6WcsTnm/hJjcWXg0mxmndQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MW4PR11MB6617.namprd11.prod.outlook.com (2603:10b6:303:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 21:31:31 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 21:31:31 +0000
Message-ID: <e04fe935-b7ec-4c74-a472-230ef71f9e64@intel.com>
Date: Wed, 21 May 2025 14:31:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Jani Nikula
 <jani.nikula@intel.com>
References: <20250515101952.19317-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250515101952.19317-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0280.namprd04.prod.outlook.com
 (2603:10b6:303:89::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MW4PR11MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 17fd3b0a-0af5-4be8-46ab-08dd98aeda87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFpkdEdsMVVHaHVJc0dsVE1hSy95bUZISi9NcEdVR1MxRm13bHpwa0IzT2tP?=
 =?utf-8?B?djF2NklyQmgwbkZReG4zZHJVbnMyOU1OZ0ZpQWJDUGhXelluUU5BZ2VyU0Y1?=
 =?utf-8?B?aUFiaXl4MkR1bEVrMDlSRndicWh6dlE4aWp4WmcvU1J3TEpBbEt6SW9YbFM2?=
 =?utf-8?B?ckhhSmhOOGZOQ2lLRXF4MDhTZmNJUkdjYXB4MW04K2x3M3ZSTS85MUd4UDlP?=
 =?utf-8?B?Qk1UZ0pBam5sS0VSdEd4YkNGSFNKbWdKM25QM1diSmJkd2d0T2taNEJJN1pl?=
 =?utf-8?B?Uy91b1l2L3NNTHBlZENYZUNFSzZWMHY2UmMwSzM2WkM3aWlrNjJMcnk3SHBl?=
 =?utf-8?B?NkEwK0g1WVNhSTdvSm9SNmdSS1NBa1RCczhyd0J6Tjkwci9VRG1ablcyLzRM?=
 =?utf-8?B?ZUJ4NFkyc00zN1dCbWpJcDBTYmxqWmtTRWM4ZUdpaERPZ2JXZ2NCR241QjFQ?=
 =?utf-8?B?Um4zb2oveGc0RUJtK3lneTNHM2w2Zy8vVUM0Mk1CNUxVb1R5a09MMmo5QnhP?=
 =?utf-8?B?OHBrWmRDSkNmVzFvRUlrMHdBbWJTelVYQzdlUmVNMWJVbUp6K3I1dGNQUSth?=
 =?utf-8?B?TWF0aDdKb0NFUmp0Y1hmd2NoK09saDRGeXQzM1pHR1hXUXpNMjdBdU5JekEy?=
 =?utf-8?B?a0UwYTQ4bmFvSE9nK21ST1VXZHZZejhudXU2M3IzdW5pcTN4b0RJVG83RDd5?=
 =?utf-8?B?amtTQUMrdUdpTXBlME5YTm4wQWZDTGZkVlRZTExuVjFTNnBYS3lHS0sycnd3?=
 =?utf-8?B?RHZOZTkvc1FUdEtYWWF4Y3o1WXBzMjRlUHU2V0gvRnVlUVQ4UkhyL2lLZXNw?=
 =?utf-8?B?Ky9OUjZDOWVuTzVIcUR6bnY4VnlLVUp4cm9zWTJ1UlVGNXZlMGZNWFNUaFhv?=
 =?utf-8?B?eU43RVV6a1NuVkppeElOWmliL0wwM2NpRUdDcXpKWGhIcTRSOHBqZUxyNzJ0?=
 =?utf-8?B?UEJnL20rQTA5NTBKQTZidG9vRG5nSCtXUmJsUGhERGJxdUVmYW8wcnZyVjRM?=
 =?utf-8?B?YUxBcFh6TXJySE5RdmY2c1hlaEtkanRjS3ovTTNCM2FIcE9QVFdJMXlUM214?=
 =?utf-8?B?ZkRZaHBrZzNYaGt1NVZ2c3Y1NndyS2drek1Oam5STjBMNFJGNGk2ZEZsb1dq?=
 =?utf-8?B?Q1Z1YVIrL0w1REVMN2hjK3M4NEY4UDZ3SURwaDZvZEdoYUVpWk15TksxTXF3?=
 =?utf-8?B?WFNKa2JibXZxS2JUUmVObXFvMTh2ZVRqSTBuY2FkUlRDNEczN2RNMFp2d0tP?=
 =?utf-8?B?WUF5Q2ZxM2VmU3R5NjRWTE9TNnJ3TUV1a0xHaHF5NExBc1pDTW5kR1dFVEpy?=
 =?utf-8?B?VVFVUkpDWkJVUlhSRCs5ak5BTnlkVmZjUXJZTGtnck82Zmk2cHFHRzByei95?=
 =?utf-8?B?RFBkYktJa2RZUElSSnExcWljckJJWTNIMmxHdUhISDFVK0JWaWVHUlVjdVYy?=
 =?utf-8?B?MGNjdk5QQkl6MENMUHhnTDJvU2JZd0RFem1FOTg2M1U5WjZHampDekZkYURi?=
 =?utf-8?B?YU1SQjlLTnpOTlBBMDhPdlFmQWtxY1JpWXRtajhkdkM1d0ZTRVlPcHZHQVVo?=
 =?utf-8?B?YTVRM1FHTG5ucGhiYitrMzFxQXlueCszR0lsNjF3cWExL1FIcmE3K1huZG5y?=
 =?utf-8?B?eFJkL1NzNVNkTjlLc29Dd2x2ZWFnUTRzbFQrbWphQk5CcFlPcE1oZWJCTkNw?=
 =?utf-8?B?Y3JOdVR2alZscmRqQlFsdG9relpUeVhQbkJuZ2FpaUhrNjNFQVhDb0NrSDc2?=
 =?utf-8?B?TWl5S3BXZmt2eUJzYVE4Q2J3bWUvOFJ1R0MzcEhrcU9XVFRETEp3bzhkeDVM?=
 =?utf-8?B?eS9Na2hva2NBY1NPRzFlbUdPcE9uZElabTdHeTdvRzYxRGN1elFhcXJUdWY2?=
 =?utf-8?B?RkVnRmNpRk9maHB2K3Z1R3VoUzVqQkQwb3gwOW90UHJXNTFabHlnWVd0ZFJa?=
 =?utf-8?Q?NjbFtcUr/JQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTNyQ2l4TWJtTC81Z29rUDJUQm1vNzFPY3hNMk0zRHhRdU4wUW9jeklJSS96?=
 =?utf-8?B?N3o5YlB2ck9STTJpT253eHNYYzZobk4vYld2L0Q0ZE5naGhEd0pBRkgwNnRo?=
 =?utf-8?B?VEhmWElZOEJmUmRVS0plZlhTdko5Y01zaUIwRXZXampNTHJXUlpDRFBnR2Ja?=
 =?utf-8?B?Z2FoVWduME11eUczbk9JbENvMGFBWlRneUh4UVIwU3ArcjZDZVM0czFpcWIz?=
 =?utf-8?B?aWp0bUJ4dXZmTmJEMDRhZzFReENZZ0F0TW05TVdGbmpsY25MQXJZQkRCTzI3?=
 =?utf-8?B?eVU1clFuTyt0L3Q1bnFQTHdEYTB3cEZ4WjlOODBDUzZENWt6SEFVcmFadzBG?=
 =?utf-8?B?ME8wUGZ0VnJMaTM3a2JvU2xOVE1hV0Rhdi9tb1JiYzVpQ3NFV2ZoSG5acHc4?=
 =?utf-8?B?bkRWZFh3akpneWZERGFxdDFSVzNxeHN6R0hsQWxFSWhJQUFHVEx6Mk02eWN1?=
 =?utf-8?B?WS9MME9HR2dSTjYxZWNra1hrbzNiMnJEYjBpaVNKay84aVNCUjluUXZTVUgw?=
 =?utf-8?B?b2VjTEw2OWw2WjJuQWhCS2FaeUQ1ZmNHM3JVK2VvVTJiR3p4bUVPNFdmbkVv?=
 =?utf-8?B?QkR6b0ViaXZ3bllSRmxIYTNZQXZaWk1mWlVKRUlHcERUbG9ZLzVVd3EycXRv?=
 =?utf-8?B?NVpwakU3elNHSmx1THAxYUFOT3RRdnhsanJqN1ptYWhHdFptcjlmRmplUUhu?=
 =?utf-8?B?Z1p5TTJJejdULy95UTF5QVVHQmJuSVhUUkgxMlBxbXZjR015RTJla1JsUkRa?=
 =?utf-8?B?amUrc0cvMHYyZGY0WjhwcEM3UTJML0ptK08xU1JjbUt5eE1MYUszZkNudE9h?=
 =?utf-8?B?N093OVNXNDJCTnFNaWZFOEJDYVBTZUp3SnFZa2RFNjNUZk9aNDZ5UjdUZnVv?=
 =?utf-8?B?TXFSZkh0aUlKUkUxakp6SHlGNUdpeURLenBJNHFNdENYZGk5VXYzZFRGNWRJ?=
 =?utf-8?B?RFlIQjh2SVAwemhFV1htWU9KYkVJUzFkY01nZExOZjFhb3hXa1pHN2JFVDRW?=
 =?utf-8?B?UTY5WUJXa0xwd2IrejhXUGx5TnJPd25PR0lkVnhjTWlqaWdtcXYyQjFVaDVW?=
 =?utf-8?B?dDVva2g2V1ErRVA0OEJ1aHRqZ29Ra21MRU5QUTRSQTlhVU1LVUlBUm9vbkJZ?=
 =?utf-8?B?THkxaUltRVRCQU5JQUdiTzYzSzNnaWVqc2tEWEFMa2ZZbEFTTm8zaE54NWpY?=
 =?utf-8?B?QUZPNU13bGZJa294RS9HcmN2MlFpQmF3MmxnQ0d2KzFYNXZtSm1xcHZrUEdh?=
 =?utf-8?B?ZTd3aDFNTnE0STJaSDdmeUo0QzAzajd6U3p4VjY3NnhnOExQNXRxR295S1Rt?=
 =?utf-8?B?a3RJUCs1dG9EdSswNEhhc1MyU3ViV1lKSkhOdG95TERhdnFPV09qeGpBdVpY?=
 =?utf-8?B?ME1IcXlWcWhKcUllVU44TVIyUDJmTzZaSUhPOHpjL3VRTTdKaWIzTWVnL2da?=
 =?utf-8?B?bnlZV1V1QXJ5RStiYTB4alh4NmxxY1NZVm9tR1h3QS9MSXNadmNtSTNwNk9T?=
 =?utf-8?B?dmVMVkduSWJweklXSU9rL3ZYbHlrUkFrdlBBUlZZWVk2TDZIZ1pwaGsrTnlq?=
 =?utf-8?B?Y08waHZTZjdzd1FObURNb29McTR5ZUZlWmJ1NE1PZm80RjErYTNObGJzaUpw?=
 =?utf-8?B?aW1Uakt0Nm01SmlqNXBUU0tPNFE3dmVkUDduN1FzbGJkRGNhR2pXc0w4Zkla?=
 =?utf-8?B?T2ZucTFEamdzcnN6VkhvNU43YzliZTRTMTVPNGpDaS9XLy9xQTI3aDM5U1hi?=
 =?utf-8?B?WktLNUloYktJNVdJendIOVRGMHFLb2gvVkE0QlNnNUlWL1Z1dGdkVG8ram1K?=
 =?utf-8?B?MEFhR3F0b0dHME90azZTdlE3d1RrWjE4SlVFaGNQVHBKTDQ1d2dhTXRWZkxB?=
 =?utf-8?B?OHBmYUlCQzNnZThtalRFdWszc1JmOUxoemE4eldCZjJsMFNBSnFzd1VGcnVP?=
 =?utf-8?B?MGVySG43MVRBbU1BeWIxb1F1QW5GVjhYa3Zjbjk5dWF4bEQyMXhkSUxJT2Vu?=
 =?utf-8?B?NVJudEtBL0xqUFBPTnZJN29FcDVxZ3ZYT1hhNnhFQUpIQ2NBbmdCa3lxcFIy?=
 =?utf-8?B?S0NKT1ZGRmtPRTJ5TFA1bzdCVW9MTjBnNWVKWjN1TEZPM2o2YjlHOWFreFVx?=
 =?utf-8?B?WlRIRWhjS1l5MDNFK3V0N0c0NmErVnpaQkM4VmlFb0dBNWU0L3IxN1RPdGxx?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fd3b0a-0af5-4be8-46ab-08dd98aeda87
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 21:31:31.6182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c4ySKqZsWowfUPD/5PhVi/eKrwU7uG4uAq2kP/JL1bym2eGE1sJb+Yp2fB5W6TXw9auk3ZWlMCoODjAQRK0A+7uzwSk41ZEF0qr1vWG7znE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6617
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

On 5/15/2025 3:19 AM, Satyanarayana K V P wrote:
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is
> injected into this xe_is_injection_active() helper function,
> ct dead capture is avoided which suppresses ct dumps in the log.
>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
>
> V3 -> V4:
> - Updated the name of helper function and moved to xe_device.h file.
>
> V2 -> V3:
> - Added inline function to avoid compilation error in the absence of
> CONFIG_FUNCTION_ERROR_INJECTION.
>
> V1 -> V2:
> - Fixed review comments.
> ---
>   drivers/gpu/drm/xe/xe_device.h | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_ct.c |  6 ++++++
>   2 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..b937d585083b 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -195,6 +195,24 @@ void xe_device_declare_wedged(struct xe_device *xe);
>   struct xe_file *xe_file_get(struct xe_file *xef);
>   void xe_file_put(struct xe_file *xef);
>   
> +/**
> + * is_injection_active() - Helper function to inject fault.
Technically, this is not injecting the fault. It is a place holder to 
have a fault injected in to so that it can report to other code that a 
fault injection test is running.

> + *
> + * This is a helper function to inject fault into ct_dead_capture().
Given that this is now a generic function in a a generic location, it 
should not really talk about specific instances of usage.

I would say something like:

+/**
+ * is_injection_active() - Helper function to test whether a fault 
inject test is running.
+ *
+ * This is a helper function that the driver can use to detect whether 
a fault injection
+ * test is running in order to suppress excessive debug output. By 
default, the return
+ * value is fixed as zero but it can be modified by the fault injection 
framework to
+ * return an error.
+ *
+ * Returns:
+ * 0 if fault injection is not
+ *-EINVAL if fault injection is active

Or whatever error was picked by the IGT side?

> + * As fault is injected using this function, need to make sure that
> + * the compiler does not optimize and make it as a inline function.
> + * To prevent compile optimization, "noinline" is added.
> + */
> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
> +static noinline int xe_is_injection_active(void)
> +{
> +	        return 0;
Is the indentation correct here? It is showing as double intended in the 
email reader.

> +}
> +ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
> +#else
> +static inline int xe_is_injection_active(void) { return 0; }
Why have the first version spread over three lines but this version 
compressed to a single line? The code is identical except for 'noinline' 
vs 'inline' isn't it?

You could even do it as:
+#ifdef CONFIG_FUNCTION_ERROR_INJECTION
+ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
+static noinline
+#else
+static inline
+#endif
+int xe_is_injection_active(void)
+{
+            return 0;
+}

Although I guess the ALLOW_ macro needs to be after the function definition?

John.

> +#endif
> +
>   /*
>    * Occasionally it is seen that the G2H worker starts running after a delay of more than
>    * a second even after being queued and activated by the Linux workqueue subsystem. This
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index ff6edf1b14f4..a6964d13f3a3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1963,6 +1963,12 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>   
>   	if (ctb)
>   		ctb->info.broken = true;
> +	/*
> +	 * Huge dump is getting generated when injecting error for guc CT/MMIO
> +	 * functions. So, let us suppress the dump when fault is injected.
> +	 */
> +	if (xe_is_injection_active())
> +		return;
>   
>   	/* Ignore further errors after the first dump until a reset */
>   	if (ct->dead.reported)

