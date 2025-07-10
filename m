Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3695EC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 08:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AC410E1E0;
	Thu, 10 Jul 2025 08:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2pOzPs4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9855B10E1E0
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752137858; x=1783673858;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gi3yRrYQ3igE+h2fevR4xVk+yS161yXpxKBZpSRVDJM=;
 b=X2pOzPs46ZFQS57aZ71q8qZ+j1ZPyoddVdRHy2O8tGCmaEjbhT1oaGSE
 CyO6Z7IJkIoN5KcC/aNkb08IX8ie54GHpSgI9ApHY/gByvw8Daq4Rjjfm
 5eCrv3w/BwLmw8etGDxNwXC0N8zapYg7NlN+O9k0e9Iha5p0ZOn1iP8uA
 ngL6A347TJLf+sGraLqJrAZfX9wI2Ln8ACQ4qdn3RUkMRJ/5MxRMEtnTn
 9A4r3LM4+BDjtZZ86BCmYgXrNb5vMaScjUeY72M3AsUerdcBC7ExAlVHV
 aqMiZP2VadQXejyOs2PGLFaRoKtf10g+zAgnfrT9hr6H4HqSareduxKXw w==;
X-CSE-ConnectionGUID: DEJyYnZPQhiPl037QBhqzQ==
X-CSE-MsgGUID: Lq0wH5H7QpCnobg3/Ql3dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="76954425"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="76954425"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:57:38 -0700
X-CSE-ConnectionGUID: T8ThZ882SCybjJmENfGxrA==
X-CSE-MsgGUID: zUHCpnYkSBOkaLb9TuP9vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="161676318"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 01:57:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 01:57:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 01:57:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 01:57:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szeMpIGWA8Msz206OvLziOwnMx2q7ikTuWBTuJ18PUVjXyUr1Fl70HLRqgar8duOKOV766VXzEMaRI1wJQnoIU+8wL4zpDlLLHbdYkcl4bc+XItJQZFitV/yiYCQStVJ1GsjC/QrXG4JcJLq4PsJWyO4NTX9GV3sMxJ3xQPUmIIeAeCoNIb5EDrwKB4Nhqx/tqNHKL3rLTCSomRK8XgddWUzfwJSJoyEX5uYdsr7FNjbWdYArFPfRULWUz99sFKOqEkgfi2mRVaYQOh8CPZDww9jGLkZkDD+5yLcXuevC2LZX9y8hK/YVPnEZBB3PK7vxj01SLojmfGdJqjWNSoL5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQJ2ErdcTivbFeUzCk9HKD/AMRoP1nv6l3ks9hsTJew=;
 b=q6LSTbW3bbBOjNIopKFrLBg2zwEPhqNirBgekI4gyqi05hi+Zgc+IwcoLQZfS7cWUiaPht4aN16BD4Blgl9uceIwgKKcOzeA75Z1WCjkTO3ANwYlfQRjgP6gKJ+eFk91NGpdkjS0b3A1ODmlCdiPhbw8H96N8DYZ+E/Bj4rEaLaSAV70q8+EOEY+i6kIoghwNQ+rp09xXI+7v7H0Jwrx5JjQcEnv2ONTDETLurlnXpTQcIIdYZJ0Di5J7+75vuyOYKn/eDQ0E2MCRde6Qzs6LmQEEcJvqLJCEFgW5A5TWPBcmoUZbDxaFAQ2EaqCGpb6/uOuvhZpQUC9XhBO7TTkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS0PR11MB9502.namprd11.prod.outlook.com (2603:10b6:8:295::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 08:57:34 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 08:57:33 +0000
Message-ID: <68fe9d28-5044-4038-b8d1-950a069d0af7@intel.com>
Date: Thu, 10 Jul 2025 10:57:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/pf: Print configuration KLVs using debug
 printer
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250604190021.725-3-michal.wajdeczko@intel.com>
 <20250703145709.1832-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250703145709.1832-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS0PR11MB9502:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e864de-5d49-4065-8110-08ddbf8fcedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVRvQVYzcTVQemswSVhSZ1VyaCtBZmVaaUhGYUtTZVdXYi8zWUM0Y04zOGJz?=
 =?utf-8?B?SjF5NHpLZHVYNnErTGV6N0tQREkzT1VhTXp5amlFV2tMYmRHSkZmaXg1SmFC?=
 =?utf-8?B?SnpCSDJhd3p4U0V5V2JERHlpSUEwbElPMFB6bGMwK2dVUE5mZ0JubHduYjBC?=
 =?utf-8?B?dit6OVlUN3hyZG9CdXZTYTM5aFJkc2xseENQaEhZRXk1ME9QdVZXRHBDTy9l?=
 =?utf-8?B?K0s0Zk9iU3YwcHpYQVMwZjc3SVJlNGFrVExJWEVha1RGNFVvL3hVQnltUmpo?=
 =?utf-8?B?cTJ3RDFxMkNtK2pMQjlXY1NxNndhcm1BV2FXVTRtV1dNd0o4cXRRVXZURXYv?=
 =?utf-8?B?TDBKNmZqWWxFVk5BYS8wM01YQWhBY2dKaTFuVzVBeW5QUkhLVzV6c2pDcUlO?=
 =?utf-8?B?TTJGRkJTNldEWDhpdU5kNkNyL3Q2a1F3ejBhUVBVRVNnd1YvSDBsR2hnSXpV?=
 =?utf-8?B?RTNKcVhmOGJiaGRCT1JnWGpEa2NrRjNicFhPOG5qYkE3cDNsRDlJSXJSbm5j?=
 =?utf-8?B?UE1iUWM1Z2krVU92bHE3c2xvekczSDZDa1dYYXlsTmp6cXJ5dTdyNWwzZWc2?=
 =?utf-8?B?eThsbE52Nld0TEw3SEZubW9PRUVjQ01xdmkrSjA1YU5BUW42QlBYSkdaK1hR?=
 =?utf-8?B?cG1LUmJsQjBaU1pkUXljbXR0cEoxbTJQQ2Y5c0lzVDFkU3ltRzlYUjJxM1dq?=
 =?utf-8?B?SzdRcElhOG4xMjhWTkR5TzJ6c1k2bnNLKy9RZUxwZTdoMFA0MDc3cG8yV0lO?=
 =?utf-8?B?SENpNG1vTllVbE5pdEpCTDdGN0NkMTI1MXNicDdwYlYyQTJKMFo5cUwwQ1pF?=
 =?utf-8?B?SlJSMFB3Y3FuVExRbCtoL211Wk5EektES1RIL1cyQklXUVdyUVl5amQ3cTQy?=
 =?utf-8?B?amM5WUZHNTIwMzdXdENyS05icE9jRjc2cG1kNlRXLzRaUCtLN0tOQ3BrQmxy?=
 =?utf-8?B?YS85TytYWkphdGI5RjJ3Umx6QWdyTVJEbzdkUngzK2w1dUFMYlAraTQ3aG14?=
 =?utf-8?B?cVBGQ3J5emR2NGRaSUN1eWNFNTJSQVk0YzYwa1JIVXZSWlM1VEk0K2o4Qmw1?=
 =?utf-8?B?Nm56TDJoUXBCVm5xY1JGbzZyRldMVnJ1SzVWaEFoSGN5MDhxTE9lKzBkUlpX?=
 =?utf-8?B?a0ZOTVNPQnN6c0RUV0hDNm1CaWt1SE5ROURMN1I3SmhERUNweWVxcEpKTVN5?=
 =?utf-8?B?cUNHV2hiYTh6MHE5SzY5V3VsTHZCRHAvUVk3V3NKcjVxSElqdGVFTmV4ZTdm?=
 =?utf-8?B?TWE0OHBDMXpuUE9qeVQ4QUo2SmpLQnJLTnBGVCtGTEMwb2ZUdy9hMDN2WVRP?=
 =?utf-8?B?Ty9yaU5EY1pEamxyUmptUktYYURJZkVrSENoYkhpanFyakZ6UDRyRWpQU0hB?=
 =?utf-8?B?bVNUZ1p2MVVlc1MvY3F2OXlWRFgvVmcxNHljeHp5V0hpVmFkellJR0RueFhC?=
 =?utf-8?B?UVFQUWRVNlBBeHFrZWZMVGJlQ01HckxrSHFxUjU4c1R5MmRIWTJEeitDNDNP?=
 =?utf-8?B?NUk5R2p1alNXVk5UbzBWRGNZa3hmcDZZSDFyZmRCbU1yTElCM2tLYnE3UEQz?=
 =?utf-8?B?NU9HMHdCd0VVRmVYN3RDYy8rWGFnUm9yZkFlN0hhRjZYTGVLdENIMlFtSEpJ?=
 =?utf-8?B?T1dBd3lhWTN4WVpuYUhPREI5NFl2L3lYWEtMV3c5OVRubzVMa3I5M1hoK0tG?=
 =?utf-8?B?NmtPN3BTZExPVHp6WFNYMCt1NDNXZ1p5UkFSd0hWSmpveCt0UTFCYXlMZEpS?=
 =?utf-8?B?MWdWc3hORm5OalF4STh2VFRzU0RVdmV3eXRWOXFrSUN2OU9PSVF4Z2hpVjFJ?=
 =?utf-8?B?N25jVUtRZUo0WmgvUFBmN2c5MGJwdDYxT0xaQWZMeCtraW9lM1FkTFlQaURK?=
 =?utf-8?B?eWhCQ3NVcVN0TThJamZoNjhUTU1vSUxYeFEzNlpoazlRcXZUWXRTSXovT1lT?=
 =?utf-8?Q?kMHFOq6m4pY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVo3T29VU0gwWEs5MUM4VStVNkJPT1g2NFVpMGVzOHBSMlowOVNadzZBQitH?=
 =?utf-8?B?akNDbjE5OWx5QWVOZitSQWdoYUhxdCtIWG10MUszaWNHcTdOM0orMC91TVRY?=
 =?utf-8?B?TnlrMzRna1BKOEZySjIzMGNxWXZWY1lMcE13TGgvSnIrMXFBcnBpTG95L0dj?=
 =?utf-8?B?NHAzVm9QNHhUVzdzeVBVbXFpM1dDNDVuTEpad2kzMVJIS3kyMURuVEh6VmhZ?=
 =?utf-8?B?WllNYW02K3lVS1F5QiszOCtWYXZkYnRteDdOeE5sVy9VWjYvTUxCaWRMdEpn?=
 =?utf-8?B?c3ZBR0NqdG9rdURGTzFWU1M1Rk52V1l1NFVaejRZZEI2Qm55NVJleWR2dVcx?=
 =?utf-8?B?UG1HdWpSNU5PeldYbzdIamlXLzF4ZmxIeWFROXRYNzdQckk5NStEV2dtcCtQ?=
 =?utf-8?B?VHpGWHZjMUFzRzNmS0cyRHZ5ZUtQYnhPK0tkejJHbU1PQjRRWWc4d2JpY0tP?=
 =?utf-8?B?U2gycEtzQzBDdExEdU1qU0l1bU9pRVNXYUNIRVJ1YUt1bjgvZ2daRm1wZFRG?=
 =?utf-8?B?WEExQ3JBSzIyaUtNUGNJVkJGdjdydjBVN1h5YzZVNjMxRHQzaFZtc0dTZmtE?=
 =?utf-8?B?TGM1ODBDb1BPdEsyWEhSM3UvbEdpSlVCbUc0SFJMLzhhODN2RkRRQldiTnhh?=
 =?utf-8?B?WjFXeFptcjJDQTcrT0toVGVENjZ6ZnNVeU1XZlpnQUZPQjFkb3ZWTHpLVnlp?=
 =?utf-8?B?YlVmQU4xNlVpbVJPaHNxTzZWVzdjM0RsbmRyNDd5SnFPNkV5aWFUY0xpUUI5?=
 =?utf-8?B?bk93OUtIZTQ0elZzNVpUT1NTOW5Hb1N0WVpRa0YrVDdvNkhWQUIzQ1Y1WTRh?=
 =?utf-8?B?aWZHa0RPZms5K2RFZ09nNUFWdVNmR2U2SGVJSFU4N240c05aUDk5UUxHampq?=
 =?utf-8?B?K1k2WXZkblhOeHR5dzVndTgxVHhXODVuOTRrMGxVcnZ1NGJnTnZKQlJiTFQ5?=
 =?utf-8?B?dU9ORHRtSmQweGNnK3J4bDl2bWEwMmkwZ3dHcDA4dWNneWxmL09NZEp4VndD?=
 =?utf-8?B?MEs2WmU3aVBrSXVSai9RQysrMzhxUjcxWTFvNVZaZW1hZHIzRkxLMzhYNzN6?=
 =?utf-8?B?SUViU2JuUGo4QTNMZlZRQ2RwblpZZnBDcGVrdkMxdjh6aHZZK2tKQjdXUms0?=
 =?utf-8?B?bmZUMTBSMXhKcVI4OXBOQ2lBUUdjdmhrUXN0eG9XWHA1cXRBQTk1WmpYZDQ2?=
 =?utf-8?B?VHE2STN5WUZJa2hlajVZQW1jMys1eHdPNG50UHJaR2xmcStTSGtYQVFqOXBo?=
 =?utf-8?B?Q1lkektDdzkvdzd2U0xKZGQ0V3RzbndZZkZyNE53UVFNazgvRXVqNUtlRWJF?=
 =?utf-8?B?aWU2V0I1ZDNueVpkSTl6VkxmVjVObnlaOGNWWFVrVGNjOUJZSmVkaWJSNXhR?=
 =?utf-8?B?bWxKb3UwQjI0cm9ZRUg0SnRQWTNxUUUyUFU4V1RXa3ZNdnJudVVCT1VzTXA5?=
 =?utf-8?B?bzhMVGEwMSt0UzloTmx3OTZQSFQ5RU5oOXFOK2hNcFBCSk5mUUdmRXQ2OUow?=
 =?utf-8?B?QmlLc0RsZ3ludTMvV1dveUZ6bGtPK2dXQm9LM0tqdTVjYjd1SzY3WnZyR2cr?=
 =?utf-8?B?a0gxUHRJNmgrZW9oajhSc21NQUxWRU5sWjl3UlhqZmhVdmIySXYyR01WMkF2?=
 =?utf-8?B?eWNqMStNN3lkeUlaYlZJc2QyTGVzM2lBUm13a29EY1B0cDllQ1RiNHZvY3Rv?=
 =?utf-8?B?NjhKRENkVmRtTUFGZm55bHdXc1BMd1FUdkllRHk1YVdPajNUK2lIenVXVE5Y?=
 =?utf-8?B?SEMxTFVTWHdhTUh6UkV2dk12NWx1UU02cXV0cDQwMHphYXVvWDlLWWFXS3lN?=
 =?utf-8?B?S1UwdUhFbjVxdXBpNjlyRlN5TTFYakhvTTc1RUYrbkRmYjJMVzYvdm43Z25h?=
 =?utf-8?B?Y0Q1WlBoVHVUbzhvdkx2SFFKVVFvbWkweFNEZXVUN0FDZU1pV2cvQmN4RnZk?=
 =?utf-8?B?TTh0NmQ5U2xwM25OMWV2M2s0UlRYQ3l1Zi95UjBTYS9IaXZNcDI1SkNoMmpi?=
 =?utf-8?B?aGZ0aVdLMVpodDlTQVkyYkFSemcyRjJNMWkxZGpteDVnUzhuaS9IWXVtZnBH?=
 =?utf-8?B?eGVMeDA4KzZJWjY1NTk2MDRXUWtjaU16Zk42RXU4RlNKL2tNWFZTRVIybElG?=
 =?utf-8?Q?Cj7KLn+eCC+enXmnP+b2AlZhE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e864de-5d49-4065-8110-08ddbf8fcedf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 08:57:33.6715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJBcgdNIBBjUhn6Aq9SX/BpMCNmRufTQx18JvTAMioW9zW5BdgZwSWBf47EiopmvfCR1Nz6xC/IQS8kkYI819A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9502
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

On 7/3/2025 16:57, Michal Wajdeczko wrote:
> While we print VF's configuration KLVs only under DEBUG_SRIOV
> config, we should be doing it at debug level, not info level.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
> v2: update xe_gt_sriov_pf_config_restore (Lukasz)
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index d186f780885d..d0cf1d80be07 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -104,13 +104,13 @@ static int pf_push_vf_buf_klvs(struct xe_gt *gt, unsigned int vfid, u32 num_klvs
>   	}
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
> -		struct drm_printer p = xe_gt_info_printer(gt);
> +		struct drm_printer p = xe_gt_dbg_printer(gt);
>   		void *klvs = xe_guc_buf_cpu_ptr(buf);
>   		char name[8];
>   
> -		xe_gt_sriov_info(gt, "pushed %s config with %u KLV%s:\n",
> -				 xe_sriov_function_name(vfid, name, sizeof(name)),
> -				 num_klvs, str_plural(num_klvs));
> +		xe_gt_sriov_dbg(gt, "pushed %s config with %u KLV%s:\n",
> +				xe_sriov_function_name(vfid, name, sizeof(name)),
> +				num_klvs, str_plural(num_klvs));
>   		xe_guc_klv_print(klvs, num_dwords, &p);
>   	}
>   
> @@ -2349,7 +2349,7 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>   		return -EINVAL;
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
> -		struct drm_printer p = xe_gt_info_printer(gt);
> +		struct drm_printer p = xe_gt_dbg_printer(gt);
>   
>   		drm_printf(&p, "restoring VF%u config:\n", vfid);
>   		xe_guc_klv_print(buf, size / sizeof(u32), &p);
