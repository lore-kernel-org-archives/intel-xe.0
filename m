Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E263BCA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 19:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D96410EC39;
	Fri,  5 Sep 2025 19:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXT7ZExo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8315F10EC39
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757101354; x=1788637354;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Q69Ls44jnD0J6ykRRTzA8RKoXB0OBU5rJ6GUfcBr+qA=;
 b=aXT7ZExoxoS3bgZjR6GEGtTEPsH6NffeUbxfR6oNTuIg0erwntn4iwsC
 IxfKghA+MbK9gZkbbW+SUIDtYLwVGsKgMf8un3bM2+NVciPKaJx7y0Rv0
 89CVP1ArnA4HCgaesUqw6NN/bDHgrsltQ0bs+NY4mc3q1R4gggTLDN/yx
 KfAplksOplFy5enL1CXUJspoAIuGvEoTrjCuyEfS5KlgWr/GFEiCKraYM
 G6zI728KsLW3W2WJpYCzJpMCmX8vhckpZeWDU7ObN/SrhecxkvXjaArVC
 Y4YrxiUspU9ib90DYpXrgNSnhAKOdyj0l24nN55OJnK9vHVHdqlwiqLk3 A==;
X-CSE-ConnectionGUID: MWuDMSkoTFSF+HD1qRE3DA==
X-CSE-MsgGUID: lX+7WbZVQyabliQenJcttQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59396037"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="59396037"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 12:42:33 -0700
X-CSE-ConnectionGUID: PVSTq36lQye/UZmzl737Lg==
X-CSE-MsgGUID: PEXhC83ZRfGX0giRRwoJJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="176577978"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 12:42:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 12:42:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 12:42:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.71)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 12:42:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1M1U1ICGCmcfW0wBB4g93qgA/A9vlPoDc4WZvQGCBKEPVbZQYgEEqZlDQb5hR+olZSIWjniTiqxDHPuzVnxX0HwVAOV/RE3yMUWhmRgzVmlGyhNFDSMOBXjzHhN0AtfrAL2OuKwsdnop1DIJSwpHsuYa8MSNKLn0ZE0tb7guMzfWwr3c58hufkrFufubDRB8eqZYjoMN8V1gBy4kfAA4yAmSoCM8oMFSgu0cTntTGGEsqKluyRuMgLLAQjJQCxG8LjfF7E7sv/PkcHCeFdK9OI5ppC0Id8KVJbq6KV/bVLUWqtzVcia+LwLTvIQ2UhOxAeuG5/1Q+nhGxzojPAgWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4dvlj8qI9VTw3PU5i7Usel5Sd1shHmmvzwE93HMZr8=;
 b=hj86F7nkdR0WVoWVAF87ksi0gpqZl3syY5SDY81BBfAy1wznDSekH4RPiPn6Pi5JQDUn+O2EMc+/I0QmdAwNiyaIhdzZSkx6m7IQZ9qqGguxDrlo9/fOCu7+v/VbOBVDeXplMhsW2tVNbqhlWJI2+qkomv6Zau54KBZC3Ibh9PWfoV79vE7yyQqMM2JkkBAaYMIhrr2WdrX1u0i6se88KIrL5F63idgtXal7nqvMdm885CiVVBUeCb6sHRPb5yszBijCHbETlB4bAtyF+ZktWQMQoYmZyuQpNYIUFBtlEozGEaH2yHfUEsP0a2hE7HO1Q9rwigGrMu7ugDg1LajEqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 19:42:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 19:42:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250905162236.578117-2-lucas.demarchi@intel.com>
References: <20250905162236.578117-2-lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Use config_group_put()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, John Harrison
 <John.C.Harrison@Intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 5 Sep 2025 16:42:25 -0300
Message-ID: <175710134539.5916.1325336923027423466@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: 29633f1f-1652-4715-3273-08ddecb45975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHRwSnRHbVJZTVVPdUpiclJRQjFoMUdoTEhsaXZOdnJXZTN5WDZ6d3djZDZN?=
 =?utf-8?B?WFd4SXBKRTVtZDVqNGRzTUZ6NmlWVWYwTlRMZG83cTZhUE9qVXFoZTFSZXMr?=
 =?utf-8?B?QS9wdEhZUVJuK1dpdGxFNmRZL1Y1YXQ2aFo0U0NXTzJ1cUhiajZ3aGpDaWY2?=
 =?utf-8?B?bjJoTlJBMVFTVXNiWDA5eGFVZTcwbGs4dEVTaWZHdXF4Z2RQYlZmZEV5MVVk?=
 =?utf-8?B?a3Z1SDUyQ25lL0N0TEtneWpUQTJzdWRSRjBaYVdaQmxWZW5LRkoxbTU1M3ZR?=
 =?utf-8?B?QlAzTktUZUN5UDdjaHk2RzNjRWVjUUxTbldrMkZpeW5lQkRaSnpVM2U5bmpv?=
 =?utf-8?B?dVBla0IxUDcyOE9laU9kME0wdEViTWdQYTVpdnlhMHhHcW94UXV0TnRxVlYr?=
 =?utf-8?B?b1ZTK2VCNlR3QjQ0eEpKWmgwdXdVVXhUZG1HbTNzTGtRWDNqWFh4M3JqbFkv?=
 =?utf-8?B?YVF0cWxrUTA0RU8zRDVpTWpGSVpXdTBaMlM1YU95OWYzR3RSMHp2VC9FYzg4?=
 =?utf-8?B?U2dyRGkwcXhtUnY3UmNleXFBUzJkZWFUU3NqRlVMTlpZaE9WeFVGZS90Rm1P?=
 =?utf-8?B?aGJhY1dVTTB6Z0ZWaVJYR2wzNG9CcEpRSCtBVW81bjNrOE40cjNnQzVHTUh3?=
 =?utf-8?B?NGFyaDNBVzVWRXAxNjJsWGYrMnJneVpReHhVV2ZtbHhRRUsxbTIxbEE2TVh1?=
 =?utf-8?B?VHBqY05OYW0rdWJqSjNrampLL3dpY3ljK0FYRHFqdHBMdWlsbFFCbkNkUW9B?=
 =?utf-8?B?RlBldWVFZDNQR01OcFFDNlI5ZURUazNPQjNQd0kremJCdFNJWG1SWWtsRjdi?=
 =?utf-8?B?MHpHNDFyOTlzcVJWYTBibjNlV3Y1aFUycnZPU2I2MDc1TW9kRXVVSFNsZ0gx?=
 =?utf-8?B?WGVTRDc4bTNoN1JGUCtWWlhoWVJGZ1A2akRheml5eGlVZUliNkdNTlk0WXBE?=
 =?utf-8?B?MmJGZzdpS0dldmhLTHYwR2RudEtBRXZFcHAxVGZLVDM3TXlkQlJmRWpMWVp2?=
 =?utf-8?B?VW90Rk5VQjJzbHUzQ2o0TXlHM21TeitBKzVOSlVUaXk0OG5lZGQ4WXJSN1V5?=
 =?utf-8?B?L0k2UGJTZUErWDJNOU11U3RUeUtlWDc1WnhLYzZXaDAxdi9Ta1lwYUV2TGJU?=
 =?utf-8?B?ZldCS09sbWVWWFBrd25oNXhNT1RTSUVyOTZHbW5rMGF0YUtGK3FKSTJhMXpQ?=
 =?utf-8?B?ejdORFo2STEyem9GV0FBZU8xaml1REVmUDRpZW5jTFB2OGt2Sk9PNnhZZGdO?=
 =?utf-8?B?Ym1WNWQwaGE3Tmgwc0VRWDhndW1GRnBvYjJ2Qk5TRE1yQmNwdGNzNGxHRkYx?=
 =?utf-8?B?Rkw2WnlpZmVYazFZWGpZekp3V2JmYklhMXRNVU15ZzV3S0JIc1Z2SzZ0eGUz?=
 =?utf-8?B?TlNOcWlaMlR2enhtb3ZkUDc5TitpOE1hZXlUZmR2ZU9oZmYxRlkzN0ZJMVhI?=
 =?utf-8?B?Qjh2UHBCUmVjckNBaG9YWFNIWFRFcWVZTFJXWmhFcGRURCtSZkZnZHppdDZU?=
 =?utf-8?B?Vk5JaW1UTTBubDRRY2xzSlN3L1R6WHV4bjFmQ3M4aitCOTIvakt2Rk1YSmxF?=
 =?utf-8?B?QzExQ0xLclVUOFpkaEtYdHlvS0RLbGw4cVdXWmg3di9zbk5iS2MyOXJGalhU?=
 =?utf-8?B?Z1h1MVF2MmI1UktaREFMWVZ3Z0duMzlVcmxkMkx1TUY3MHU0MHkxZXNwUHpx?=
 =?utf-8?B?bWd2QUNabFZKSlk3WFZjU0NtcXB4WC9iVm5jQy9FYTZ2TXBUS1JHUXpicEFs?=
 =?utf-8?B?ckVrL1lEZjJOeHR3ZEJmdnpZWWluME51WGI1anNHV2tXMFE4SzdnVk9QRFYy?=
 =?utf-8?B?eWRqc3owYlRVMjFrbFlpQXFWL3NBSnJLcWxrS3NtSVVGbnR1ZFR0N1BKUmZh?=
 =?utf-8?B?K0xDMHNPZ1lwY0ZoTzF1VVZEM1NYbENxN0VLSW9jbTlpRjN5YzliNGl6SE1Y?=
 =?utf-8?Q?mngVE0PC7I4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cENHdEhxdjFaNTVNUTNOMCtBTE5USldzclA1MkwyeW9Sb2d6eURxNUJmMzlo?=
 =?utf-8?B?QzFxbXJha0xIdVA5MWJSTm14MFpCNW9ySmR3bXpOUks4YlJCY1NzSk1ZZyt0?=
 =?utf-8?B?M1VxQkpXK3RsVGFibC9rMU9oUjZlV1VEcEVzWEE1cmVzREY1NVFBMW1Vd3JJ?=
 =?utf-8?B?ZEhwN2drZ1FkT2QrcFF6RmlBL3lwTGRaMzJyQnREaFJwM251SFg2amhWd1hD?=
 =?utf-8?B?U2xLTEphZG9WSzkwczdrRzNVdWxlNHE3SVBYdDNKT2lya1JjSGRXaTBOR2wv?=
 =?utf-8?B?cSs5QVBUbGFYUyt4OENURFNKcGVRMndlSE9YQ3VyVnlaM3VVNXU3MVBseWF1?=
 =?utf-8?B?RytPNjQ5aXQ4U1d2Um9JVVUrc1lUbWtWenNxWURhVzE1ZStlbzlKMEl1SHhP?=
 =?utf-8?B?QVp3a0h4SW1sS3RFeXlOTytlU3A4bTA3NWF0anByNXFDcmZlWXhJV1ZkWWRK?=
 =?utf-8?B?T0Z4dVRjYTV5Sm82cDAwSGR6MXBrdHVHQ3M2bUVsRUNaR2dKNTBtYTJ5TkNP?=
 =?utf-8?B?cEtQU0k1Ynl1aGN0QVk0cmtkcHA3aS9TVm11KzVMTFVBTDhpcUxjV2dacG1x?=
 =?utf-8?B?YmU4d0JkMGtMazhPUTI0eXRYU0xuTm1iOWFPMm8zS0krWTZ6N1RhM0NmbWgv?=
 =?utf-8?B?Nll0OTg0KzdjTEEzb04zS1c0Z3k3YnE0UlZxaldWc3pHdXF0VStxSzU0RUVQ?=
 =?utf-8?B?S0VSeThtYlVwek1FVnNhYjNiclhxZk9JckNZZmF5VGQ0eVVsRFdhaWFNYXBr?=
 =?utf-8?B?TmdIeDcyU2hOL1hwUVlHS3JHOU44Y2svdUJEa0JWTjNRek9UaXQzRkdkOFF5?=
 =?utf-8?B?THg2SUk4U3M5S0p6U09qTzhxRlVabllCZEpiNU1UNjFxK3dqM0NlWTdKcVVi?=
 =?utf-8?B?UlMxZkd3S0Evb1NNYnFWcGdtdzVNR1ZSNDUxbzdYVnFUVTBNU2hRbXdtZGRx?=
 =?utf-8?B?UEM4YlNhWWFzbmIwVitVbUNGaEtGUk5KT3BtUnY4M3F3UHNNT0hQaVJrT0pI?=
 =?utf-8?B?Z0UvSUsrLzBKYzA3Nkl6VjdqT0tCNmpjMHMzcFFiTEN5MTdFM01WNytmbXQ4?=
 =?utf-8?B?Skx2N1c3V0gxWmpEOVI3cU9id0NNbXprdVhtRG5OMWV5V281Qm9KYi9senpM?=
 =?utf-8?B?TUJmQkQyWS8yTzRuUGhiYWxNczRMNVBKSUgxL0s3NGpHZmlRSGdpbUg4UjBN?=
 =?utf-8?B?NHBqbWFRMUk1R2cvam5PY0owdmR0dDdHWHBTb2lIRENhSGNCRkJ4Mm9IOVJV?=
 =?utf-8?B?QnNEeURiYmxhT2IrSkxGL1lQTDB0RmlDVXZNVnBqL0c0U1loV3l3ZkhnN0FS?=
 =?utf-8?B?N3BXcnZIeVUwekpNTi9DazRQWUZXenh3aVE1TUxwZ094U2hyYWtTMkE1S0tu?=
 =?utf-8?B?Z3Z6UnExeXE1NlFMaTIxYVd4TDJJcENFTDM2Y3B3YnNrK2ZoV0x4OVJFdTNE?=
 =?utf-8?B?VFR0YlQ0OS9YSGMzVjZ4QW9EaDBpa2t5YTF6M0FrVXAzUmtBd3I0YWRTd01Y?=
 =?utf-8?B?T3kveWZLUXhDNWxZSVNjMkJqZDgwcFQ5MEtvN3p4OGpHdjV6MFA0eStmLzVQ?=
 =?utf-8?B?bGg4azRDLzNSUTVSellRa0xhc3A2NStwWnEyOG44NVB4VkszVnhWdmxWUW1l?=
 =?utf-8?B?NnhkaGJWSk1WcXA0ZU1mVTY2QnRNd0k5VDI3MjNnNGg0YWkrNTd0UzdleGNi?=
 =?utf-8?B?TjQ0eUpoeVhHWFBHd0FZQ0ZjUWlLeTNMbmJtMHRhckxRcXdaZEdKbUV5bzhB?=
 =?utf-8?B?RmZxWEVVWXhvVmdqZ01HSUF1RGhaTHBFQlZnSmhvdjRhRUxraUNsa1lMci83?=
 =?utf-8?B?VDIrTEhGc29ZT0NsOFdFc0FiemRoeCt1c2pSeEZKanVJN1d6bWt6RFJJdEcr?=
 =?utf-8?B?NUFzV2IxUG9QM2dDWUhOVDdQTWd4SDFJOFlxcThtcXJBd3JMN2VPQ29RQUFW?=
 =?utf-8?B?SzFVSEFuMktLdkc1ZWVCekNhUTc2bVdVT3IvRXp1MS9DMHg1dzVMU29oRkly?=
 =?utf-8?B?S0kzcDduem5ublpWTmo2L2Y5dlA0dGxhV0NBb3JXcUJabW5XUFdUWGxGZEp2?=
 =?utf-8?B?bEJ3L3lJayswQXVBSFhRTnMyRytOcnZxWGhZOTJ3OHJ0T1N1RHVNMFpXQkdW?=
 =?utf-8?B?TlJlWTRscG1jS2svalhzbFRsd0l2VXQzTFNDcjZiNGhGR2h1MkFTNElUMk9J?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29633f1f-1652-4715-3273-08ddecb45975
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 19:42:29.8854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ILDRO0a97/r6wJeB8F+6YIsOBXbRsC5OBrX7jRkyxZjqoT82kG8IXY8M2gEi7bCbT78rCAefZcFwsBRTnZ7Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
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

Quoting Lucas De Marchi (2025-09-05 13:22:37-03:00)
>configfs has a config_group_put() helper that was adopted by
>commit 88df7939d728 ("drm/xe/configfs: Rename struct xe_config_device").
>Another pending work to add psmi later landed in commit
>afe902848b41 ("drm/xe/configfs: Allow to enable PSMI") and didn't use
>the helper.
>
>Use config_group_put() consistently to hide the inner workings of
>configfs. No change in behavior since it does exactly the same thing
>as currently being done.
>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

By the way, after taking a look at how we are using configfs, I wonder
why we are defining each "device" as a config group instead of a config
item. Shouldn't defining them as config items suffice?

--
Gustavo Sousa

>---
> drivers/gpu/drm/xe/xe_configfs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_conf=
igfs.c
>index 0337811864cd9..e515fa7085fa4 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -598,7 +598,7 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev=
)
>                 return false;
>=20
>         ret =3D dev->config.enable_psmi;
>-        config_item_put(&dev->group.cg_item);
>+        config_group_put(&dev->group);
>=20
>         return ret;
> }
>--=20
>2.50.1
>
