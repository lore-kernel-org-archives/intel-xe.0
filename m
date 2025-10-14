Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F850CCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 17:17:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4987110E1FA;
	Tue, 14 Oct 2025 17:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="klwO70xa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126CC10E1FA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760462247; x=1791998247;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GWvK0CvCgsO3a2fs0UePQPGU9MmmL9xo26VM/89P4Ac=;
 b=klwO70xakX81YV9Ab7ah3/piL9cU8zhCPQY9GDkHGNdeF5qPtib3rQvr
 CkXIN8cdk71mQaLeMJIVIczhXNdYNTn3Cjp41rbYSGu3ZYBeEub3rOmLn
 NSTOOSUQW1TxFJtctYT9GRcLk/0wdkSQa24LX8hthyTxIXWXIZ2qwU3v7
 UlrmRUiiMHkMQuQY5hIdktFcxPZIsm/C+7qINdQokBLuRvyjhzRxJzC5O
 KGc9K4K1gra8dZ8JAfEH3/hch2EXl+E+vKv3bIjegYK7ofP/kdB0WLAko
 EdK9v2g6JEIHm7tQqsdYDqEUz3p1ioD1uTomLptgvSZlS3fanEzM1fcya g==;
X-CSE-ConnectionGUID: S6V+8vWyQTe7j7qnYj6img==
X-CSE-MsgGUID: cYGCQ/qGTCmyhsZCvu0zbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66487801"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="66487801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:17:27 -0700
X-CSE-ConnectionGUID: Ex6KLm+nT2CuZQcqHoOSEQ==
X-CSE-MsgGUID: i9L5GLrsQ/+wARh4m5j24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="219081701"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:17:27 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:17:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 10:17:25 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 10:17:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvQPL6f8Ebd9tXpYzK8iaqZhBUHE0TYNb56WyKYTLDZGjBBdDrFhebsrKKvxxCOkdavSSNmoYpSTmMDudc/DkBiUxVU30aPOOldLCrPWNs5vEypnynW3DhVlN0A0McosVr4MN+ulaqnD6+R8KeQqwOHyEf5an6UutUqFHEKc5LOsMtwB+9Ej2Tf6JcybSZkJCjYXafm24l6Jh6heJeD6AzeVq9Tg3vchHhEsTj6jiBmthMw30c5fo6Kxva6rRfzKEva7PkTm98QoeiYuaUMBoyelhPCyWJYuJ1nVvji0jYytcCsBMBcxzEYlX7JGkX2XZ6m4b+SqmA07ZBQltuV71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvCffsi+pJmrqf8t6mBYwyuNRH4nqFUY9WUqD5Mt//M=;
 b=APBGCDYyS6tIXHFcg6V7fO9u8TuKgOMBnAEQiNXzYzEPEXfjwyRBbLSkemp16At+fY0Z7xNzHcMrXezomOqhWuY0aZZREeAOaJhT7N5dfpRmgDK7X9MjWd8HuwWhQgbMC5ha0D2+3cfwaBwonBFGMnHDAUahatDxIDkWZUeMy+C3bJ5SAgQ2Q0sIFZvsJ+swpI/nPiStPTJMjr7M8+SlTVipuKl0WjRz9xIz/AbZmn9Q4cK1zKsS7IYCLv9LnxEk0zNGQ7viIqDqYCuTILtiGmt7aUClv2W9SzqkEBvVBZav7RWHI4EnK2m5cv0yY+Gl8flXZfWgF/5w/X77sRwtJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6140.namprd11.prod.outlook.com (2603:10b6:930:28::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 17:17:23 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 17:17:23 +0000
Message-ID: <02b2088b-1b61-4774-bef4-33b3d1ef44d5@intel.com>
Date: Tue, 14 Oct 2025 19:17:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/xe: s/xe_device_get_gt/xe_device_lookup_gt
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <matthew.d.roper@intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20251014164758.125598-9-jonathan.cavitt@intel.com>
 <20251014164758.125598-10-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251014164758.125598-10-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY5PR11MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abd371f-6f7d-4e75-0025-08de0b4589fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDBBcTI2bCttVEVJd0RsQ2Z6ZmQxV0U1YUpYV3RNR1ZrQkFrQXd6aUY1dkR6?=
 =?utf-8?B?RDFJQUsrYVVua0ZZQnBwZ29TOGtkRG9YcWN2Q3orUllvb3M1TFkrR01RNnUx?=
 =?utf-8?B?TkJaYlZmYk9FdDhrTjFaV3RQV2hPVDlqUVVQOXRtM0dBRURYb1ZtNlJubHpK?=
 =?utf-8?B?c2pBZzRrRXBMNThvYWpoaTJGWEFFcUZmY3NndVlXbHFvSVhzWmkyd25QWnlw?=
 =?utf-8?B?Nm1aOThEanFaWmFzS3ZYNkpKS0V4cDhQWG9NQUlJa1doZjJwQWRuamhuVytL?=
 =?utf-8?B?RnZsQVN6RGFYZ05vZG92bkNmck82cWZReGR5SGd1VTU1SUkwU2U4Z2hXK0ll?=
 =?utf-8?B?Wk5xZWgySG00T2dyeTJsUm9uUFh3S0NpS3F0b0lZMy96cEljbnIyeCsxNUZM?=
 =?utf-8?B?VU1RYTR5Ukc2QVNwdWRqTGlkNHVuWktHL1ZpZVo0WDA4dStSK0FLVklNY0xE?=
 =?utf-8?B?MUFCcVcyT2xRNnc4MFRjdUJZQXdEeGMweFc4c3JYOHE5NGlJRmpGazhFTC9J?=
 =?utf-8?B?OXAwL3M5QllSUjI1TVgva0J2bUszcFZJTXh3ZnBUR1lmRlFnQk54VkRLY1FC?=
 =?utf-8?B?OGV2aU5MZDd4SFhUZVhxNU9taU1vampZczVOUzVlL0hIdHdYYTJnR2k5anhh?=
 =?utf-8?B?bkxFRThZSXNITGJjV2grWjJSVi9TeGNNYWNsR0QwUnF2RE4ydExPdUlTVDRC?=
 =?utf-8?B?RCtoZDlBTjVrS2luNVNQVGE1dWd0SUFyUEZLMnpXUURwZ0F3OWZwTFoxYXE4?=
 =?utf-8?B?MDFTZS9WQnVWNGs3cnp4RXNBR1VsM25OUGNYdktLRENOUVAwYitoUDVDZkpT?=
 =?utf-8?B?Nld3Zm9LSFV6QWE4a29TRmhteUxBNk1hZGRZVUt5TnRFVms4UXJpdExiSlNW?=
 =?utf-8?B?SFJEWHB3V2tLU2NDSm5NaDN5MTVWWjBtSjh1YmRFdVB2aHh2ZlNLV1ViYmRS?=
 =?utf-8?B?YkFUMU9YUnc2eEVhR1czbHFkcDZ2Z0wvRjdVOWRUMnhCZHEzbjA5WGZSZnQ5?=
 =?utf-8?B?dTJTMnZXTFpqdjhwN2tSWXdEUC9INTJkYmxLeVZWVjZrck9wNE0ySWZiR0FG?=
 =?utf-8?B?QTdwZGtMN2lCVUNFdTJ5TnJlMjBIZTlSQ05NMjNCbndLVy96ckZWeW1IZFdV?=
 =?utf-8?B?MldWaDZVdGw0MC9SdThWODF4UG85N0VuR01VVzF3WW9xdzAyeXNDVUZXZ3VG?=
 =?utf-8?B?aVBVVVBGc213OWJuZFFzUmhlaWNha2lBc3ljaXZoVk5sekp4Q1lmY2U1TW1q?=
 =?utf-8?B?Y042anJvbVJxQWdrYktoMklNeWZrZ0UzMmxhcHhBRzM2M3AzNEtjd2Y1SUNM?=
 =?utf-8?B?VDRVOFJkLzZZdURTYVRJVWRRNGpHelJWeTRrTVpQa1hEYkIxU0lybC9qRWFP?=
 =?utf-8?B?QmJNNTJuMHlEVGhOQW44d3dzQW9FVVp4NkxqTlRFZ2xaTzZBZzFzRG4wdVFs?=
 =?utf-8?B?bnlldm5abUtEbmNTNUlPOTdTWHpnUHRZRWg2cjJ4SklyTE1IYjBmOXZiL0tw?=
 =?utf-8?B?OU1uZFM3QmJsNGU0VFlqblJYOXlXQmlndWl4bmo4UnhOTFQwN3NKV3NkOWN5?=
 =?utf-8?B?YkJZZDRrZC9jYmN2aEpXU2hiV3VWSWtra3BoUHJ3M0JWdmxrRUJZZmpMUWJp?=
 =?utf-8?B?Tm5zbUlYQWFrdHpqamY3cGl2S0tDNUkzdWtRTHZHd3NsQUsyWlV0Z1huTlVW?=
 =?utf-8?B?Z1lDWDQrVTc5WVBXQkJUaEJBUFpEVDhybVNGZ1VudEJLWjFKNXZtTTFnY2py?=
 =?utf-8?B?a01RWkQvUG1Wb09EOW9HVWNVc1V3SXU2N2kyMVgvNXlaZVIrTGxMSXZsQkph?=
 =?utf-8?B?dHkvallvYnZGV0tuOTFvaEZpZVpwL3FjUlBSZHI1SERNbTlKb3ZXYkVuYVlh?=
 =?utf-8?B?ZUQwVDFmTTBnZXpnUW4xVHNyQnR4VnlOaER3ai9NVFR1RnVnbzZqcG1kSVZO?=
 =?utf-8?Q?2VSf9dLiCVhlME/lSaCfLmJNMkq3P6J5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnpxU3EvTUpBOEh0SHRCRkJSYyt3R2xtd3ZoK3NBdUx4OVhORFhmem5acjAz?=
 =?utf-8?B?dVFwWHdjK1RTSXA3TzFudnU1ZW5nL1RPVDdwMDJvRndMK3JQZlpSdjZUOGQx?=
 =?utf-8?B?cWc3OG1BSjJkeWNrVXdlb2QxMUovV3FHa0ZDbHNJbjl4OHBmY1RFRlNlVjY4?=
 =?utf-8?B?SWw3ZUF2VkdET01aNzc5MTBUU1VUeHVEb1Q3VFNia256dUtpcDNnVmpreHlG?=
 =?utf-8?B?VGUyQ3Y5OXpRekFlbm5zR2YzbW9maFRRZDlSdEZEaTJJU0xMaTlCbEV4Y3RV?=
 =?utf-8?B?K1Z4MTQ1UXhkNVFuTGZCSW1XZ2VjOUo2SlczR1VqRW9sNWszdExCMEpQQW5m?=
 =?utf-8?B?WFJoQStSSTJDQ21SbjRHQVJOYjIxVGhnbE9pcmUwZFVDaktPSkJKUE40empj?=
 =?utf-8?B?YmxBWWVMT1pZZXpUa2hJdTNNWHpYR0ZST3RWNVJ5dWtCMSswQTEzRmdYTWFk?=
 =?utf-8?B?RjVTNHplN0x2ZHBlUTJBWVZRbUQ2OHBHT3JCN0EwY0swbUZ4bGl5VW05eXZa?=
 =?utf-8?B?MmdNVXNVWXVlQXVQbXZaOUxvT0IreFZvZEhJd3doRjI4M2ZwQlNKVjhGc1dq?=
 =?utf-8?B?cU1PUkZsZzg4ZmQyOTBZbVYzU2FRaitnY2RKMFJ2aEExOER6bHg3VzVjeTJM?=
 =?utf-8?B?N1BKbGxUa2tIcno0aGFEQjAwSnpkTTY0OXo1OHcxMjI3RGd1SlhJdUt0Q05u?=
 =?utf-8?B?N1cxak1admhCeU5hWGdsa0YzeTJYNnErT1pJMlE0aG9peUluaXJtc0EvTkhG?=
 =?utf-8?B?VmhKc1ZQTS81NWVFRUs1YzdWYi9xQ3VSa3pvc1ZQU3NjdFRoU1VQcUYyNlcv?=
 =?utf-8?B?RElOWitxZlZGTGpoSDBCcE1kVWZEMW1oSEw3WVh4UnJ3Z1RtR2FsckQ4Yyt0?=
 =?utf-8?B?TCtoS0pCcUJQOSt6T0o2Z21Wdk9JMXUrUTNlMldMSTgrdGoxbysxSmJYbkQy?=
 =?utf-8?B?MjdtR2RwVFM3aDRWOFExVmYvK21HSEhHVnRxY3lMSGZSMEhPOVo5MVB1Sk5J?=
 =?utf-8?B?L2duY1NXdlRLZHBSMXVzdnJsQkZJMHNyUmpMK1gxcmZFak5TbHp5a3Zhd1kw?=
 =?utf-8?B?Q0RueHJTbjR4M0dlNENGK2FKVnFtZUhNL0pTSmhET0dHWHI1LzFWOWVUT0p1?=
 =?utf-8?B?bE41V2pGSG5HcG5tOTBTWGkwOEZhVkpEMlEycUlxd0R2UGprVXcrUFFyNHYr?=
 =?utf-8?B?MTZ0cGNxYjhnZ1R4bThjQWwxbW9PcXA3TzhMVVJUQnRQUEFrMVhsRWdtM0tz?=
 =?utf-8?B?ZmZUWjVzVVRRZk1udVJyeEdTVG9IVzdVN0IrdHN1QTlaTzdBNCsxQWRPRjJB?=
 =?utf-8?B?c0RvTWlEUTVoRzdhdU92WWZGOGtSQ1kweGpHb0dHdWk2akd1THd4dEdseHAy?=
 =?utf-8?B?TW9aSlR4WWN2cVBOMm5zalQwNUQ3M01EY09lZk5RYlFuN2t3UDBUb0wrbnhG?=
 =?utf-8?B?VWZCallNOEdzYWlFTGcvSUJsN016YlQ4OVVlWENSbmkvT2VteExqZUo5L3Fr?=
 =?utf-8?B?Z1NSMzJzRnEvZmNML2MzdWN0QklTZXo2ZGh3K0U5OGc5NG0yWUZZYXRKaDVt?=
 =?utf-8?B?VjNkSGUzVjE1SWJQbkhFeWhoeiszVGpqV3pKT2xZbktpMDVNMjNncTlpWlox?=
 =?utf-8?B?NWUrRmJoSU9LdDFYZ3BtR1pTNW05T0NUa2gwdGhOOEdObis1VFBZM2oxMmVU?=
 =?utf-8?B?RzZRZE5FcWh2VW03MFdxNlpuVU5GZk5IT2dEbW1EcHZYM0RuWjJHN0xna09F?=
 =?utf-8?B?QTBvdENwR2YwaVF6S3pjOU9Rb01CTDZKSUhFVEIwK2RDeEdPVjVib0NHYU9J?=
 =?utf-8?B?U2g1VG5hQjNjZ29OS29VNXg4SFZoblF0akF1Q080YURDaGFGeUozMEpKRXZM?=
 =?utf-8?B?VVFvRW1lUEN6NlNBSFl0WDA4YTRqNzBwaEFQOG5YY0ZWUDdaSmRFQldWZlE5?=
 =?utf-8?B?YmNXTG9CUkx1V1ZPQXZPQ3J6VWZwdFRtZXlNd2xpYXVQUlpqUER0cGM5Vkcy?=
 =?utf-8?B?Wm1xQVhuODVNa0JNRGVoOG96NnBmK3B4ZFBJQlNqRWpTQ0d1VUVKcUJRcyty?=
 =?utf-8?B?VWtlUERHRDFZK2h0eXFCSDFLTkptQ1N0YzZGOTdIU3hYeGIrTGFwWlFBWnk5?=
 =?utf-8?B?ZHpaUVU5YmxBOWcrQk5RRXlXZWE2OW9BNVcwVXZLQWRNWXJGVEVwQm5pcVpG?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abd371f-6f7d-4e75-0025-08de0b4589fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:17:23.2205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLJLJRAJSKSqBL2dqmzr2XhcAmH6B3zJ5tHeItPVT2aQuC1kILBZJ+r+jLVHEGB1bDoTd8X15etWK8uIuVdATnYiIpMRO+bAuGw2QPYLviY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6140
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



On 10/14/2025 6:48 PM, Jonathan Cavitt wrote:
> Replace the function name xe_device_get_gt with xe_device_lookup_gt to
> better illustrate it's capacity to return NULL in some cases.
> 

my suggestion was little different: introduce _new_ helper that can't fail
so the tool will not complain, and use it where we are sure we get a valid gt

renaming main function and then adding dedicated helper (that only wraps 
the original one) is not solving any problem at all

if we don't want to reuse/abuse existing xe_root_mmio_gt() then maybe just
add something similar but renamed for dedicated use case:

static inline struct xe_gt *xe_device_primary_gt(struct xe_device *xe)
{
	return xe_device_get_root_tile(xe)->primary_gt;
}

and start by using it as replacement for xe_device_get_gt(xe, 0)
where we known that checks are redundant/not needed (kunit/sriov)

then update remaining usages of xe_device_get_gt(xe, id) by
adding proper NULL check as needed

> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   |  2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c |  2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    |  2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  2 +-
>  drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  |  8 ++++----
>  drivers/gpu/drm/xe/xe_device.h                |  4 ++--
>  drivers/gpu/drm/xe/xe_eu_stall.c              |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue.c            |  2 +-
>  drivers/gpu/drm/xe/xe_guc.c                   |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c             |  4 ++--
>  drivers/gpu/drm/xe/xe_pmu.c                   | 10 +++++-----
>  drivers/gpu/drm/xe/xe_query.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf.c              |  2 +-
>  13 files changed, 22 insertions(+), 22 deletions(-)
