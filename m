Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEE3C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 23:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4EA10E18C;
	Mon, 28 Jul 2025 23:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKhmsfyq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4040C10E18C
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 23:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753746756; x=1785282756;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N05iKcMDBKHoaYAYqVHL0JBXPjxky+7y7GkDrx7wHZo=;
 b=FKhmsfyq+UT2URZM5NHpXlqTbsczo2smf3TQQTTEjguzB7HD/tAGqqs3
 1hWUns/xTlyltgKQxd6/CLu56yfL5ZVtBG40YDrQMDEZ69LhjIahMDKgp
 e3NkuOcVgdSm7fczsMxshGsLbFklpASB953dZsRk7EMcFRENO7991Zpoy
 E6kR4q3mdzEngyPejzAuPIrkj+iO1pBaKdtPPaRITDfW9L7gtPWmv+eKr
 nfS948Zvit9Ly7qyxyBvlzmctxgw5h01jz38OrX+oOqWsfjrAtHMIAQXv
 F4hSH/tFMGW2dKcARNa8iN7E5vFI/TxJ4fctojSozqofp97qeHdbvSAkD w==;
X-CSE-ConnectionGUID: 0vYdZVT2TpCxLgZswb3nTg==
X-CSE-MsgGUID: XarK6x/OTR2YQSDV4KhtbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66278235"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="66278235"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 16:52:36 -0700
X-CSE-ConnectionGUID: ImydkscISQGzexeK6+K8oQ==
X-CSE-MsgGUID: hjJiNCDJTnm0AZ3INaXlnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="167954380"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 16:52:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 16:52:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 16:52:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 16:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9zHy1aUXT3L5wLcsrNuG4YVSCjH0cbriIdU9lN93dAGS8X5eihxR4hLVOXDK3jetYzYaGTZOBqfKkN9MNDTWTVcOaRNtViQ6xF8UUcnYKIaxUQ9SYjaRkMWWPHI0IgWL4V5tGgTYA0QOc7KQpToxH/xqSdPxqzl9wUF95zyMF5OhsTF4DK6uuAEJYLjppR5r02kiyilNVaWixzGFXle6pjq2oNeWEAutmUt8OEWYJIId3lMS4Uk47AC7EyB8qIULyrdkUVv9gS2CBpQSdfIcrXqoVPz9spVCJnDiAVf/n/IAJDGOjipQTBE9XxFMboQWCdTu6JBnOaSMgw7vumnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSq3oQpM/4GhO6vRm/wjY/RNExe/YFNpcL0+jv8vkh4=;
 b=vOi70H8XyIQDAJ/0gqKk8lFIPqECGN2xWudxQd5kutIkr7l23gX2pdKzlQmb+Qe4gIZ0WS5ixVGlgaf6C6DkvdkwgoqbbwQcUeDyNTANcFMsvIgILcG4roepJue/bJGqnFwtjjNyJmbt28b8snnwqYhYz8+VdelYZu1CrGHnvj0r5LAh/7UMadpejVkLCrUCnBvG9cg2yfnbgt06O3oHh5gYQgMD5GJbqQ1zfgn4AGtk+BfD4WloSYZNBtqBuyxS7jUzdJPdZPe1epzGBAegd722c6BS8/GrQKW8NdmlhDLozd0+s74PQYvF/bDfJgXXLc5VhW3yjrFGMLMnyp3gHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Mon, 28 Jul
 2025 23:52:32 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Mon, 28 Jul 2025
 23:52:32 +0000
Message-ID: <a9c97f83-eec5-4b16-96ce-803132287548@intel.com>
Date: Mon, 28 Jul 2025 16:52:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] drm/xe: Simplify module initialization code
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250727172009.587-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:303:2a::32) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|PH0PR11MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca39525-4c0c-427a-f49e-08ddce31d1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmhyOEZQWThrQ1c5N2dlNTFRS01veTZqUHR6WW8xdzBHcnlXRXIvang3YUxq?=
 =?utf-8?B?QXRIcmFwYWVLbXBYQWRsWUtJZUNmam1tL0NRdjJJeW9wQ1dsS0VlWThDTExN?=
 =?utf-8?B?OUhQTGgwT3RzdTN0RHNqZzV3aWhtQjVqd3R1NmRUZFRqaDNLRk1WRmRrRnpB?=
 =?utf-8?B?RUFVN3BtNVhhcEtqQkcrRDFVNmJITVIwcVB2U3FuZFdUODBVQXNldHc5dWJx?=
 =?utf-8?B?Z1lRcVM1UEx4U3k4NFdpZ0lkSnZYOVEwRnlheWQ0cGJmQVRYVkxoQnhhbXZH?=
 =?utf-8?B?bHMrZkVoWjFIamt0Z0ZZRmcrWWFPbVM1Y0NwM0s5cTh3TE1iOGt5U1cyRVFR?=
 =?utf-8?B?dCtFZmVRRjRtRW1QcFBtaGxSTjJnb0EwTldvUG5ZTVB3bWRVbUZNYzU5N0w3?=
 =?utf-8?B?aHdibzFxQ0dJWUVuNkRVckdaRWdIVThZMEZKMWEwOUpUOEFZNTZkcTQ0VEEw?=
 =?utf-8?B?SDY5cWFiMUpSQWpPaCtkeVZvOFVOQjdzRXBreDNoWnpIR1VuU3Z2WVZiVHcw?=
 =?utf-8?B?UXFEWFdxN2ExTzZSZFIvNHhYd016TjF0N0pja3RRWEl4eTNycGROWFRlR3kz?=
 =?utf-8?B?RkdBZnlmN2dMMmZLVEJkb3VuWjVzMEFwTUNYbVRNV3ozdVd6dU5vQWZoMytX?=
 =?utf-8?B?dUhZKzd5ajBpUERDcGRITmM2cDJJTEUyaVErY3h1NmZ5TklCbm52TEZxTHg0?=
 =?utf-8?B?OW9OMXp5RTBJWmp6QVJhSVVwUkJXTU51QWhCa1kzaFYxRWNHNUlvOUYzcXE4?=
 =?utf-8?B?d25USzVPL3NqUTZnSTVyaUwvZm1RY0ZFY1RJc0xvQlJJdHh3a3hPK2dIOWZG?=
 =?utf-8?B?Z1l3U2ZQWERzTHQ3bXU2M3lqRDdVN2JzcldJQjE1dmdDQ2FGbS9iWS9UMFVE?=
 =?utf-8?B?OTh3RE9sY1oyQVJINkdTbUxNbW4yTmxxb2NPZUhiRkxiZEd2UDBOdmxTSkhm?=
 =?utf-8?B?blQ1VVg0Q05iV29idVR5bWxmV21mYXNIc3BBNWxYU0gwVWlUOEZLWHZIY2VJ?=
 =?utf-8?B?cUs2eEUvRnFsbHBjZ1kxTm5pb0V2dUoyTkxGMTZxQmRoaysxenpVanNsam1Z?=
 =?utf-8?B?bXpsRzVBWk9Tbm1wdGxaTy9SajRqMTJJRCtRNy9SdU9lZEN3ZUhjTnhYMDF0?=
 =?utf-8?B?cVNnbC9Hd2xFdFU2c3V4a3dQNHRrSU5WNHA4TEkraUg4Rm92YUNCS2Ztc3Vq?=
 =?utf-8?B?Q2o2WVEvQTJxKzQwOFdrRG1Jc3VEWUsvdloxQVBSLzF4UDU0bjh3SkxleHBs?=
 =?utf-8?B?UjFyRTVaNkUxM3pFR29KOFdZWk5rWDJHc0FwbURRRkdFa2xKaXJPbGRkTElX?=
 =?utf-8?B?YjEyd0FDVnpVaGFKYWtUTUZZTmtORjFmZElVUVVVak00SGVuRHZLUjhJU2M4?=
 =?utf-8?B?YUdZSTkwWW56ZWQ3T3B5S0dNL0VHSk1SNDBiaUpibWFENkxFYklVQjFGeW03?=
 =?utf-8?B?cHNYdmgzNkozWG1hSTN2dTZDaEt0ZCtyejZsR0RHdHAvMHZjUm5hSUdIZ2ow?=
 =?utf-8?B?dzRRSDlmOHZwWXphMGR4em9PendnNVV6T1ppQXMzbFhvQ1BRdk1sUy9TUVZn?=
 =?utf-8?B?RlpoZHFkTTljS0I2OWtFS0wrMEF1ZTJ4UGJGT1pXZVpCT2M1bGVtT1ZKb1pM?=
 =?utf-8?B?dFp5OWtZTEp6NXlxVGRDVGVlQVJCcXZ4UldLOURDYjYzV3VVQmtrb0RSblJJ?=
 =?utf-8?B?c2ljZkJpVVZuNjE0ZnNDaGZ4ZTdhMUZtY2V4aDNmZVhHb0NLcldsbHIyN1ln?=
 =?utf-8?B?bGxNM1oxRjJDenh1ZmE0RGYzN3Bxdzc2VStlSUxJby80c3E2cE9oRDNOd2Zp?=
 =?utf-8?B?UG9EVk9LaWtmU05TRWxNaXFLZjRibDZWbzZad3FWUGc3cEhSVUovQU55clp6?=
 =?utf-8?B?QUhEZWpKVHdDbVFHOE1XS0VmS05UdXMzT0g1QkxSRHhnNWsvUTcvTy9aMHBH?=
 =?utf-8?Q?lvNQucTH/ug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHVObGZ5cDF5T3BJMFJ5dFp3UXBOenJocXJyeXZjeUhFb1VseGxnbk13bWtw?=
 =?utf-8?B?Vk9LYUc1K0MxQk50R0VUdFVZYnEzZnI1b25rbXE2b3dsWm9MK3NJN3dDTEd6?=
 =?utf-8?B?QTdJZ0ZLWm5icE81VkNSZVo2QUJ1dXRtNW4wenlQTWxvb0hiNG9zdTI0eDJm?=
 =?utf-8?B?cFNDeENITDhRZ28xaVF3azc2NGgxVVdqY2xLOU42YlhqbWkvS3FOOFU4NkRS?=
 =?utf-8?B?bmxicmZoOFlSTUgxQ1EvcTl5ZzBmVUVTaENDVk9HdVJQTWdZVHNnWWg3Q3Ra?=
 =?utf-8?B?STV6cyt3TFMxOXpPWE5NY1lVa01ham8xQ3hXUmpVdHdteFdHblNab09NSWVY?=
 =?utf-8?B?eFZaUHZTSlM4bzk5ZTc0ZGlhMHIwbmVGNXgzMW9wakZnTlc2SEhLYVFzaHor?=
 =?utf-8?B?SmlKNGpmWE1UcklCUUFnTlg1S25zWFN0NmdZQU1PUnErYVU4dkNvNVdVL1Vz?=
 =?utf-8?B?ZndTN0lGaUxPc0syS0dnd2JCWGN1ZHJTZ0IzYmxYWmlrNmE3RkpiVXdPVUhl?=
 =?utf-8?B?TjlBVDhYZ0R2ZWRYM28vc3Zhc0lzNjJHNjNTN1lzQ2VPbnB2NERxazNSa3lW?=
 =?utf-8?B?MTJJN2NQcVB1WExrOEd5SWRSb21kZm9XUlhhbHhoVFRzbWVuMXJwN3NvbjNv?=
 =?utf-8?B?SzFNM0hZUmlJczFxK1NQSktjRFJzQXhjK3dFUVpPZjBhSDNLclRsVHVVMVMz?=
 =?utf-8?B?MTVNZWhYbEMreFFRWWpERU9UaC9OamFiR2EzRDZGUUo5WmwyMW1IYWE3VjBx?=
 =?utf-8?B?SG83Vjh3L2FEdTJvdS8remJ0WW0wazRVOWk4Y1BZcWV3b0ZsN1NlMWRTYmRR?=
 =?utf-8?B?aWgvMWNZMFZ0U20rcEtFcy9FVjRJMElUTE9FVlJlZlJRMjdtUGM1VnRDQTBi?=
 =?utf-8?B?V0k2YXR6MjJEZjRXamhOU0U0RzdHaW05QUFhSnhUUkdGZ25QRmxaa0RGVFJF?=
 =?utf-8?B?RU1zM21uVTJOdjRWV3p5clZ6ZkYrN2t3eDdtdXc2Mk1INGdCdmN0cVI0ZE9C?=
 =?utf-8?B?UTVad2VPN0RNc2grdFJtTEJ0cUUzR0Z5UkROZlF4YVdBRGFvcmFtQUlDbGIx?=
 =?utf-8?B?TUE4Y0RNcCtEeTRjQjladkxDdWNZWklLSFVnTE5mZExnYnEzTm5wcEtrNm94?=
 =?utf-8?B?NGkwSzFnbitvUDNyRFRPUVlFVUdFOFZFMnJtb2k2bTVwRFZhVkttdHgxYVBx?=
 =?utf-8?B?Q05rUnNYM0NSMWtlUFZTY3VtVDNkRmhpNUtiVHVaaFM1Y3R5Mm9OcC9jcEF3?=
 =?utf-8?B?UnZHbXRqQnJWb0dPRTU5REl1bWtLVDdoUkd2RlcrRGtVUTd0clE4OVdqbURH?=
 =?utf-8?B?SE44eURyTWJzbnhvVWFEMThyc0l0UXRabXdBSXRHbzBvYzdQZ2FOSHRPZzVE?=
 =?utf-8?B?a3F6eitMUXBoN3BVc0gydmNuL3VDRVVDNFBOaWU1eS9xQ3ZsWm9jZzQwOXI4?=
 =?utf-8?B?VjFFWGd2dnVTdUx5bFUxTWpLL2dvT1pXdENxQ3RZcFMvU0pFMDljOXN1ZFgz?=
 =?utf-8?B?eXNwTUc1T2hLMHo3b0hocmtIc0RPdm5kK1NUajRnU3FESmcwRG9RTjgyQy9s?=
 =?utf-8?B?SzYwQVppejU0RlJqVnlETmJLMFhOb09hRFlOZ0lVajgybEN1TDMyNkZvdzV4?=
 =?utf-8?B?MjJBK1plVFMzcHRZdzZKOEhlY2JyamxkOVh4eXpueFdSRkw4Q2RpQ2laQmE4?=
 =?utf-8?B?SlN6VjhNTXN4QU42Y1h2cGlGUDF4cE5BVkF5Nk96dFA2RkhVTVE1Z2FqU01q?=
 =?utf-8?B?UEl4ZEhaRG1tUWlkU1k5MFdVTUZrT2ZuNytJYkpBNnRzdUFCNjNJb09PaWdM?=
 =?utf-8?B?bXZnN2NObTMyMm96QlVJSHdkMFFsajRXSEx2enU1Q3dHWWZWbFA5b2Q2VUtk?=
 =?utf-8?B?WEdaUHppT25sMXI2ZXBYN2tDZ1FlTG9vZld5R0Jlckl0WHpPT3JjRVQ2d1Q3?=
 =?utf-8?B?ZzJ2bjZMUk5SRm1ORFl1NE5sVVk4YVgzS0hPOU52OWpyYzdRTHE0cklKTHBh?=
 =?utf-8?B?OTN1RENQVnhPek53Q2IxMHFsQ3I4aENTeTNNZXg1cjlEMU1CYnNyUjQvYnl1?=
 =?utf-8?B?N2RBUlA3b3lpeGhsQiswT2FUVCt5SmxFTUZOR0tLV0NSYTBTOWE2eUU2bTl2?=
 =?utf-8?B?M3FqcU1VS3dqQlJvZm9xZGd6ZEhxdFdYbVFmMkUzSERUTEZxT2FOTWJiaDZL?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca39525-4c0c-427a-f49e-08ddce31d1cf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 23:52:32.6711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+4GqYmFeO5yOJHS8r0kjF/fiCHV+lI4bJDgv3pJ04fjlB6YtldKPF2edVcet4/KqBimkRvVwS7F1wNaZqkYG3eIsQIcDxAzfF1gNdYmFt4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
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

On 7/27/2025 10:19 AM, Michal Wajdeczko wrote:
> There is no need to have extra checks and WARN() in the helpers
> as instead of an index of the entry with function pointers, we
> can pass pointer to the entry which we prepare directly in the
> main loop, that is guaranteed to be valid.
Not sure this counts as specific to configfs but it looks like a good 
clean up.

>
>    add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-180 (-180)
>    Function                                     old     new   delta
>    xe_exit                                      109      79     -30
>    cleanup_module                               109      79     -30
>    xe_init                                      248     188     -60
>    init_module                                  248     188     -60
>    Total: Before=2774145, After=2773965, chg -0.01%
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_module.c | 27 ++++++++++-----------------
>   1 file changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index d9391bd08194..593bc9e5851a 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -135,24 +135,17 @@ static const struct init_funcs init_funcs[] = {
>   	},
>   };
>   
> -static int __init xe_call_init_func(unsigned int i)
> +static int __init xe_call_init_func(const struct init_funcs *func)
>   {
> -	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
> -		return 0;
> -	if (!init_funcs[i].init)
> -		return 0;
> -
> -	return init_funcs[i].init();
> +	if (func->init)
> +		return func->init();
> +	return 0;
>   }
>   
> -static void xe_call_exit_func(unsigned int i)
> +static void xe_call_exit_func(const struct init_funcs *func)
>   {
> -	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
> -		return;
> -	if (!init_funcs[i].exit)
> -		return;
> -
> -	init_funcs[i].exit();
> +	if (func->exit)
> +		func->exit();
>   }
>   
>   static int __init xe_init(void)
> @@ -160,10 +153,10 @@ static int __init xe_init(void)
>   	int err, i;
>   
>   	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> -		err = xe_call_init_func(i);
> +		err = xe_call_init_func(&init_funcs[i]);
Would clearer to write as 'init_funcs + i'. The compiler should generate 
the same code but &x[i] is technically a reference to a derefence of an 
arithmetic operation rather than just an arithmetic operation.

Either way:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>   		if (err) {
>   			while (i--)
> -				xe_call_exit_func(i);
> +				xe_call_exit_func(&init_funcs[i]);
>   			return err;
>   		}
>   	}
> @@ -176,7 +169,7 @@ static void __exit xe_exit(void)
>   	int i;
>   
>   	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
> -		xe_call_exit_func(i);
> +		xe_call_exit_func(&init_funcs[i]);
>   }
>   
>   module_init(xe_init);

