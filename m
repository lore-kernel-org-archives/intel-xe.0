Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A3ED6DDD7
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 07:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF96F10E3A5;
	Fri, 15 Nov 2024 07:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dCWDmNfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F297210E3A5
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Nov 2024 07:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731654314; x=1763190314;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PVIu/6VZh+A2p6FGYGnM2SOdH6D621LnbeOEKv9LLKU=;
 b=dCWDmNfj3B/yJ3wj5U27LTg9oJrBKC6Al4bvtdVQbKr6jRaBbLvbI5Yh
 8cE4fWec4ao5kbSybnFjMQ4AX6hIa4m9cFIHaTqa07VeOD12VB0dTakig
 7eeqTd0216BbyEKG2IHkTWGKppQt2hHk6min6bCcvEKX6FmWmnxVeeJWs
 NoTb3EQdN8neJg3DWAtwUgcgMMQG7oJ9kON14gFc6BMP6fSy1blpvsAdC
 rVYhNNZQFgWCbQEQk1L4+6fMXtr5rW8QM9avWVZKTnhwbdRAFg8xe6Bc7
 A2ECqu/tmq3XHPqeolKJeiBWWnmTCfFIS4W3gUrstAsz6ZvcNSCF5W0v8 w==;
X-CSE-ConnectionGUID: UPJmaOiCSYagDqEGUWyqZQ==
X-CSE-MsgGUID: isoSF764TpSeJcl/1DwY3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35407473"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="35407473"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 16:14:19 -0800
X-CSE-ConnectionGUID: boEZKMA2QG6Mt8I+sBjw/w==
X-CSE-MsgGUID: twB9lTf+QuaTUmOrKFAq7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="93323785"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 16:12:47 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 16:12:46 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 16:12:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 16:12:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAULZbFtK7D5xbqrXASaYLyaoaV4G49ET2ERK6L/ZR5KYuB9pS+K7wFn6+FEPAUTqrlN3H3EgcfxxCQJuOAe+1supoNVt84O1DgFcstaAENrGQ6zRld0WD5A3TYb189oeY2jDfhUY9v5s3PxWMuXrpwiKn5t3eXfu4Rgi+fE+XZjD14wmbswLPRsT7qmZuC8bIIP3iNyX2uEWiJbb/LgU0AXd7ccqjakhc28DN8u9R2ZTPaUOCp5iPxHmeMISgfiW4kH7JScWHR09AWHNjg2b7DnfW1I88RTwBzBAf5xvlPEejRyUrkSMOXnrj3CoB6aVqypU1ZJi5aO5hGuY0iH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKCyi+BZHnReVXc2QLRHUvmn03gcy6qrT75qut0ofCc=;
 b=e0E4QAYbToXNKjzSsnLUmc1NPWFwX1z5uWrcHRjJ1m94rpljqf4XjHvwQONEXfCcnYVS+giv/kwwGkS4yyoBuhayvs6Q6jnZJstFNCqrJfN6hC24cJns+kw7IF5N+K/ehZ9Awz0g20eR4TKXNULEfmHDzIPHSVJi3n3HI8RpHHJ9/JSIRb0Ik7vl/r5dggzXuwcPqtqkckoSo4mCaScTPSYDHjuXTbH5CF7rjGTglfvA+6NmWioOg+Jq0ZPQzSnoE9HNU2f7jh016PIGUZA4BLPDsNtj8VOeV8FhLmonEoJiabQ7mwftcltoIhS59FTUPISm3BCSsEm1DdYQt7ExEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB6700.namprd11.prod.outlook.com (2603:10b6:510:1ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 00:12:37 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 00:12:36 +0000
Date: Thu, 14 Nov 2024 16:12:34 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 6/7] drm/xe/guc: Expose engine busyness only for
 supported GuC version
Message-ID: <ZzaR7I1G+kuu/SCx@orsosgc001>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-7-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241113045549.2390980-7-riana.tauro@intel.com>
X-ClientProxiedBy: MW2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:907::33)
 To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a9541a-df34-496b-f318-08dd050a35af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGgwK0Z5N212eGNzK3RmYi93NnR2QWpraFp6MkxTNzV6VndvZkErS05YckRw?=
 =?utf-8?B?b3h2M1hwV2libWpOT2I2MmNDdHo3ZGNhQ1dHWStmTGVGSDhvUTUxMnZUemhp?=
 =?utf-8?B?SXNMdjIwcWF3azh5RnJLRGlzWmRXOG5ISFVzMWhYSHhmVlNiN2piUTFOR1Ar?=
 =?utf-8?B?VEJIU0U1dlAzOVJOUG1PRWhvRGFldXVaakx5aGZQRGFoL2N6ZENKYTVncXd0?=
 =?utf-8?B?V1UwMG95eTdheWt5QnFQekxBcUEzMzF5OERpZk1pVW1NbTdBck1FRVVCM0hM?=
 =?utf-8?B?bW5wWjhtMnZaYmxYQmNENFk0TnZ0YzhkbEdGY0ZVa2MwMmNLTXhyWGFJd1Yw?=
 =?utf-8?B?QStZSHo0UVl3aVl2ZjZhc0UrRlFKU243eGs1alByOGowaXI3ajd0K0VNMXp4?=
 =?utf-8?B?aGp2WHNVdFNxWHIwOG90eUZENTdvRllaS1d6MDZiWUJSRW5teTBXSldLSXM1?=
 =?utf-8?B?ZEc5M2d6SVhiOFM0SkF5bmJVMis3d1pXSHBwVktqc0FpUnRLb3Qyc0psTlZ2?=
 =?utf-8?B?OVVXYzFpRFkyNmNid2MwaXFYVFRLb3YwbDB0V1FpMlcyNTZOMHJHK2J0YmM0?=
 =?utf-8?B?UWdZTWhQOW9tU3huQmpmTHdMYW1QUG4wQUtEdCtSNFJvOWcvenp6MEpBYzg4?=
 =?utf-8?B?LzBrUVlOeHRDSDJYRzMxRFg4clZPUXNTZEdoTmdWa0NrTno5c0ZHa3J3aEVv?=
 =?utf-8?B?bnEvTlBUVWxmWll4eVNhcTRSa2hYKy9rUnJzWXhxZ0pRNE9SaWtFSjJ5Nktm?=
 =?utf-8?B?LzM2RDRQcmpuczBRRUl5UG9yVCtxaGVYYVZZYzczUFB0OG1nYjF2VlR1di9I?=
 =?utf-8?B?NnRKaGhtTHZZRkROd3RwdENtditLajllUlhxYlpDb2tJN004Nk11RUtpeUll?=
 =?utf-8?B?WFI3R2ZVd1N2aWlRV1NaNU5xZ1E3N0tnVVhGbUZzMUFENUpmcElZckQ4MURP?=
 =?utf-8?B?OGJaZmhYYVRuR3FXaGhaU0pJbE0wMWVJRzNRaVhjaDdpRGZmQTA3aWczb2wz?=
 =?utf-8?B?WEdZekp3cTJNRVRQbytUeURnL0lLUkhLeXFWV0J1WDhBWnJsSlNBNHhsYndr?=
 =?utf-8?B?NnVIK3NuVDNIS1RVclU4WU01ME9ZeUlBZS9VWkt3VWRMMWdUN1FqQW9nekFQ?=
 =?utf-8?B?eFhjMG9hSzR2cWpXV2M3VkRNbS9MT3dmNEErTWZrMW9oMmFhMzl3NUU0aS9N?=
 =?utf-8?B?TTZZdm0wQUhGQnl1TDRoQlZodGtiZkhlS3V2WW0zRGd1VzlhMHY5RVN4eE92?=
 =?utf-8?B?MHR2NG5kUGFIR2FOblhqdkZxUmFPdTA1UVdYUDN1Rkx1QWZ0UWkxeFlzc3RL?=
 =?utf-8?B?UFRTOVZKZS9pYVprWEFubUNGVkJ3Q0NiWTRqQW9xRmVOVGRwaE91b0NkRjlX?=
 =?utf-8?B?OE5rczhKSU1sVXE4YUMxTFErbU90S01UcTd2M0lLY0ZSU1Uwd2V1cUtBczBq?=
 =?utf-8?B?Vk9PcGVFZVhjUmhxc2d0aWFpaHJCTUF1MXc1NGU5Vlg2S0hsdEN6VmlhR240?=
 =?utf-8?B?ZVR2MUxJbEpMYnQ2RzdacjlpdzZPQmRXa1VvSSsxblRWUllOelZsclRJQk9p?=
 =?utf-8?B?R0FxTktZMEd3SEJaVmdEd2ZPY0xGRW54RE9rQ1VwOVNhcWRkSWhUL01USy9r?=
 =?utf-8?B?SklqRm1QMlZLcExKSndSM3VqMXJ3OGs0L2ptTjQ3OUJEZ0gvVWlOMy95Yk5Q?=
 =?utf-8?B?NzUvcGk4SkFVTTZTUTNnamU4N0drQk1lYUNXUEU4Zjh2N2tzamxScUNPeGk0?=
 =?utf-8?Q?UHr50rnQxhX4S2AuYna++a7puKb127/JpRyZiDv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU1SeHFQaUxsZGVzWE91SG1jVjNyWjVtTGVhdHFSak8zcytVQmdLbm1jT2RP?=
 =?utf-8?B?dVIwS0gvZUJXalExd25DQzNEZElTK095a2xqOFkwRzhNdmJuK24xQTRZa011?=
 =?utf-8?B?MURpMmE1d0NDQmk3RGRwckZXZG9ueXEzN2pBMGhBMnB2ZXUxb3VzY2JFNHVT?=
 =?utf-8?B?VzRSR2FXZS9Bc2g3cTV4NXZEakN6KzNxaXloMWR4TFpYa2JFL1Q2Vkdjc2Vo?=
 =?utf-8?B?RW9iQUZuM0toVlduYUh0bXZDSS9STkZlNUV5UHo5K2M4eUpleC96Wjh2LzBm?=
 =?utf-8?B?Vm1BL1F6Q0ZpRmZEMlU1T09ydmtJKytBTjA5VmRFS2hQa1NFS05TdTFCVzBU?=
 =?utf-8?B?bW9hQThZWXI0WXZWZklzMHlDbi8vMjBad3V1MDNRcXYxRndmbTlGdGJ2VzE4?=
 =?utf-8?B?VVBUQ1RScFoyTFRLeG5ra0xRcEtUTStKWWxsU25JTXM5QTcxa1BkT3QwNzlV?=
 =?utf-8?B?cXpGRUU0aVl6WE5SMEVpMmxNbnlQenJhMGVQMkg5MmtVYWNQemRmMUc4R0dm?=
 =?utf-8?B?eUNKRkhpTWY2eUpnaUQ2RXlicmtpcU52SnQ4WGdkbjZBSWFQM3dPQ21OWVN4?=
 =?utf-8?B?QkxiSlk5bVJKM0ZHSGlCNEY4V3hsVE9LcXQxbzVJUTVLRlRybU9KWjByOFNl?=
 =?utf-8?B?K0RjZmNTSGhLd2R6YmVXTzMwRnZ4KzdRcmwvWXhaRktkalBrbG15TU9EY0ZP?=
 =?utf-8?B?Mng2Y1BVb3pzUlZpMjlCcm11L3ZENnA2WmUveHlIYmtXZTIyV3NUY0E4cW8v?=
 =?utf-8?B?SDJlSk1aTFV3UmZsMXczT0M1MXkxMFpWRkxHcnozRys4dkdJd2dXbFo4eEdY?=
 =?utf-8?B?KzNjOFlnbGtlQlQwaDBmUU9BL0VkalVxT2tIbkRwTk1KWXkyNVUwM3FIYlIv?=
 =?utf-8?B?ZWVpSVZFNFFVWkZ6Y25FeTh1NkJSdm0vaVh4K1gyZ08vWHFQZmlxSjJwYXAx?=
 =?utf-8?B?ajg3SHNuOWhiM1BLU1FXNmJlZHQ2ZGlqTjFubDZyTVlJaXNDeFY0ZXNkUE5u?=
 =?utf-8?B?ZkNpdS9wcDFFTXhQYy8xTjc0KzNRWXJSYjFJRVJJSFh1V1FkYi9tcTF3cC9t?=
 =?utf-8?B?T2M4bUFjbjN1dU5Ra3dhZWhwNElnSmE4b0dLR0JpRFdWc2U5U3JHV01kRDFh?=
 =?utf-8?B?T1YvQUcxak1BTjNlYlpVa1pudXd1RGpKbWU1QzJ2NjA5V1h6UFFxdHVMekcz?=
 =?utf-8?B?Q0xmTFlzR0pReG1rSXcrSGx1Y25kV2I5ZWtyR01yYVg0T2szVE44K0lJOGlv?=
 =?utf-8?B?YTFjTFY4aXFVekpyS3JWNUFWNXpKQ1ZDVWo2NEsvZ0NscTF4eXRZQ0xDZVNL?=
 =?utf-8?B?a2pNdWRFVyt2TjBLTlphU0Q3Qy9JbVArYTk4UWdhd3ZWWk9RK0RYekN3Y0JC?=
 =?utf-8?B?Y3hvYkoySkNGeEpCVTRsZ1k5Y0tzNVNTT3JwaG5YUW5DOWpCdjN1eHVxZEdZ?=
 =?utf-8?B?ODB2K3pxZHdQZHg5a2k4N3VtSWFnNWVBY2M3Y21aS3QrRTVpRkh6Nk03cW80?=
 =?utf-8?B?cGp6RHFwVWJibnRxUjU5c0lzdjF4WGdhNjF1emZLYW5ZNDdhSmd2V3BrUitZ?=
 =?utf-8?B?QkpTeUZPd3NnditIaWFrOWVYSTVyUlkzNGtTMjRjSXplUXJ4dGtKc1NHd0VP?=
 =?utf-8?B?bkJocGhZNmtObjFNK2FPeko5WG9OOWJxaUc0d1Y4VHhUeEpPSVF4OG1TUVNZ?=
 =?utf-8?B?YzRCaS9MWStMMWNrY0JTaDdiRngydWlXQzdWL0MvWVJYaWxhNmxlMVFFclBV?=
 =?utf-8?B?enpIb2JLdVFYUTFOcWkrc1pwV2pubFNWTGJ6ajllMFl1RlFQMmFsVXdKOXU1?=
 =?utf-8?B?Z2RnajhrVGZoSVB1NXZER2lDSEh1MzNUV21teE5qYzdyQjNmZVV0bmVUWUdm?=
 =?utf-8?B?Tlp2NEV0ZVFyaSt3V2VPdUgxUVFkdTFCbzZZN3V0eTgyREtwTzh5Wjl4endW?=
 =?utf-8?B?bmZDdEo1c2RmN3hOQUt3eW1Uai9NYXl0em5mdllHbGhHNTg3ZCtid1dWbUwy?=
 =?utf-8?B?dWxqemY3WGo5YmlSTjFRYWEvbVNENnpBSW1PSElTVnZ1bTg2Wmx1V0t5WHFF?=
 =?utf-8?B?eDJxdy9ZUlppMThxQlJ2SHExcEtOcEtSTHJua2Z0ZS9kV0dvV3ZQVzFtREM0?=
 =?utf-8?B?cDVqMnFOa09xQzZkTTVET0ZXdG1DUHhwNVJxa0lQYjVaWUdrT3AxYmFCd09v?=
 =?utf-8?Q?RDSBF/D8xs5Y1Db9SkuWk8M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a9541a-df34-496b-f318-08dd050a35af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 00:12:36.6973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNZDMJFnY8On0BdthCSU0VtYp4BaOXhDE3Zy/S9HoKmb6sH7OkVXussiJ7XbT2sD9HHmtQq68AQfOWHoEfT7Zwqq3hpko5Uhb4k5NEqmBN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6700
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

On Wed, Nov 13, 2024 at 10:25:48AM +0530, Riana Tauro wrote:
>Engine busyness is supported only on GuC versions >= 70.32.0
>Allow enabling/reading engine busyness only on supported
>GuC versions. Warn once if not supported.
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_engine_activity.c | 22 ++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_engine_activity.c b/drivers/gpu/drm/xe/xe_engine_activity.c
>index 7a2ae09d23de..fc34dcf3057a 100644
>--- a/drivers/gpu/drm/xe/xe_engine_activity.c
>+++ b/drivers/gpu/drm/xe/xe_engine_activity.c
>@@ -236,6 +236,16 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
> 	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> }
>
>+static bool guc_engine_activity_supported(struct xe_guc *guc)
>+{
>+	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 32, 0))
>+		return true;
>+
>+	drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>+			 "Engine busyness not supported in this GuC version\n");
>+	return false;
>+}
>+
> /**
>  * xe_engine_activity_get_active_ticks - Get engine active ticks
>  * @hwe: The hw_engine object
>@@ -246,6 +256,9 @@ u64 xe_engine_activity_get_active_ticks(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc =  &hwe->gt->uc.guc;
>
>+	if (!guc_engine_activity_supported(guc))
>+		return 0;
>+
> 	return get_engine_active_ticks(guc, hwe);
> }
>
>@@ -259,6 +272,9 @@ u64 xe_engine_activity_get_total_ticks(struct xe_hw_engine *hwe)
> {
> 	struct xe_guc *guc =  &hwe->gt->uc.guc;
>
>+	if (!guc_engine_activity_supported(guc))

Hmm, not sure my response to this landed on the ML. Sending again..

If GuC is an older version and UMDs have implemented the new interface, 
we could return CPU time in ticks here so that UMDs will still be able 
to use something in the denominator instead of a divide by zero. Busy 
value will still be 0. Thoughts?

Umesh

>+		return 0;
>+
> 	return get_engine_total_ticks(guc, hwe);
> }
