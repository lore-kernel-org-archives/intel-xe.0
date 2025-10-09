Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6C6CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 13:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7FE10EA3A;
	Thu,  9 Oct 2025 13:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmAqGeGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92E310EA3A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 13:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760014855; x=1791550855;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HXTkLEBOKXAdV75tqMqiDKRPAqprp/I7txR6bIREjOk=;
 b=LmAqGeGPw2EapJZfsZUE+NASR9sfJPmUf5IRCTU3ccEgVU0HOTmjy+Cp
 hrCgMzRi6L9n9DBNMWkEg7LwznafkUpqO68ARjjKtmbWdU6qyjNqiTInd
 p4q1zwlQ2te2mT9E4JDmZmGucqqSbFGJYXLqSH75T5mFlkKt1jWIO5ppP
 vi1RiNQE+LZPwirPeBT8bGkE3gL3CdCy3sydrH1kkp4cx5e+JXaLpFBCl
 9mswAEcLwOwCQ4TiKWDyLKDVnk3gra9+y17oOxBU3UxnFPbDWEv+OoKr2
 LDg0nbbWTeUy6YAHRM75QuR1sHJyspFhJD35wjwzaTQranCH5WLRuZq3N g==;
X-CSE-ConnectionGUID: qHZxJmwpS8OxLNvBqod/dA==
X-CSE-MsgGUID: C+YOftk6SpuTe/t/CzCBhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73649901"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="73649901"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 06:00:54 -0700
X-CSE-ConnectionGUID: ZhqlobTLSM2wNufw/9AWMA==
X-CSE-MsgGUID: NUKJxUZYTxCRc0bdMdloJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="180525160"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 06:00:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 06:00:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 06:00:53 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 06:00:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2phYDBBlvogKfdHEyGTuZyavIL3n+entNLzRzgNETBpBw+Nai/eyAj7hRbOXCdIUvYK8JEs+wE8gH+ijhg7qZ1dxfC8slSot0sd0NfeFKusjgqIhEvB5gRQqC+rtPNxaFd50Yn6GKTCtMLiQPVTRBwj72TK8EjzVKopT9urO6r7UN0u/+PIMH8kUw8FHD7fCgDnv2nXJl8g3ETsZJAnJbKQMagV0wwSyGdMcOI2L/Q0YbwQqNgFpaQFoZ+aGH0e40cX/htDFaXPrDRoLTgCjydoCD2254MEiE+BNUC8LRFc8/sPEuUT4awCURHKZ2dOWJE5u6uE+oo83AhMTkr3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5mY/oAU3i0xkWWDjf2cQrLZsv/1hdcInhS+pReMYws=;
 b=f/fJKUvV23ayiBpMxNGtIo4524sDl6f7c9Z+fY+X4H/ePvJW9OZ4U9gOMUQ0v1g+iAjnC3X6nxWO/OsNvYQVfV3KrInpatS4jIQ/3NiyHpSf6LVhRCvKE7efqY0s5gWaj0r8mvnt+Upw1ULffrxJdIMFHd1o/osrtCaEI82vQnp5PfRF7ODhnoniSdjv9TlgzDsb1wWp1LZHb42JQVkRzbRGUEmaeDfVzehZZ9RgTYewbIfqqwLg/jqDKNs71JJoPbbG9slwAFBhF9pnsBIpVB3g+wiGSJhtnJ6FdkkIiCLOAFiObS8GQ66GavwqvlJglCPB6NTN+o0hHVRzxqZfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 13:00:46 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 13:00:46 +0000
Date: Thu, 9 Oct 2025 09:00:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aOex-1E8yBlGFbwI@intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cee206b-4d51-4357-5f62-08de0733dcee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHBvY0lra3oyckFoTTZPTXdJMzhyeDBhUlZEZ0Y1K3VoeGtEWnpvbHptem9J?=
 =?utf-8?B?MUxCdEloTmY3TVBUWSt0V05YWVBWcSs2ejhBRnZtWUxVSVI5a0NQVkdzZ01K?=
 =?utf-8?B?TGlwZlBna29NTnpMYTBGZ0Ixc3ZFamljaVIvTDdYTktFSGQ2RjM3V3ZieTdF?=
 =?utf-8?B?SWJFSkZ1Ti84VVZnT2xsUXNXTWF5WGl3RDg0MU0rN2h1U2x0aFlpRVZyc0dH?=
 =?utf-8?B?aE1MWkxNVGR6ZFVxME04MC85djhjOE5NTno5QVAreEFmRW9mdVdtaTBZbEsz?=
 =?utf-8?B?WWw0UkM1L3NMbWwyVk5wL3E3TzgrNGhpMmZlblNURXhCWkxqb2Yxd2lNUU1w?=
 =?utf-8?B?cFVRYU5LeHFkdUEzRWdmZDMyQTJ1ME1rYklGaTdncjJCK21ZWWV4K2NaK3Nr?=
 =?utf-8?B?YzE3TWc4MzR4RTBkaU4vSEFRMnQ0S29YUGYrZzN2Qmtna2YyRm02eTNaaEJ1?=
 =?utf-8?B?VzRsemJuTk55VGE5MCtNbk1XelVuVy9ia0xvdXBlQWNtY3NXQzhoWktncE1F?=
 =?utf-8?B?ZURZSTlnSW9hbzRzMVlmM05kRWxiMi9lMVNtbC9ZU3IrczlPZkpVMzNFWWhi?=
 =?utf-8?B?SFpLa0ozd1FSTGozOGRLZzJoeG52Ky92blEwVlVhNVMrM0NMWmpzUmdQaDY2?=
 =?utf-8?B?T1E3ZGNiM3hHbXp5OGgwM2NDKy81eVE3a2dnY3Y0OUE1cFE5WnErK0tTTEl1?=
 =?utf-8?B?T0MzankwQzdjTExTWWZQSFZmaWtydFU1VUp4Vm1vU201aWhnbU13Y2NHeExw?=
 =?utf-8?B?Vm5wN3RtWkhpWjgrVmIvcmlIb1h2cDJFNEdVZ1V5a0RaRXV3THFIKzgxRkJ6?=
 =?utf-8?B?c0tCNVpQaUkxajczUlBpUnZDTTl1dUdBbDM3NnJnZTdwQ054NlBnWjI0N0F6?=
 =?utf-8?B?WDlzMjJFRCt5VlVMSUp3TWN0RDVGZ2MzdkVGNzNVOEFDSFcwQTRjTzR4eHFw?=
 =?utf-8?B?c0JUZDBzek04U3laRUQ2ejJ4TUhrenppR2V5RU5neVg0Q2RmZGl4NnJ0QzhN?=
 =?utf-8?B?WlJPbndZbytRRm54MlBEd1dIcUZiV2FKMFJBSGxPa0lzanE0clZzaWEyYmJV?=
 =?utf-8?B?amlHdC9nMUFXMENMVGlnZldhWm14dG5jdGxiNlRrc1ZNVzJsM0tnVUxvc1g3?=
 =?utf-8?B?bWVPQ0w3UTZKOVRoTDlLOVlRTWpnVzZDQytLdTdKWExWRXp2VTNZYzRhbVhD?=
 =?utf-8?B?eEd4Tyt5MHc2RzBVN0RzajErMVM1SXRoelg0RG9kUEZqTis5VEFtMzdmLzBQ?=
 =?utf-8?B?Y05hc2YrVnFSVXJ5QzZpWDRXb2RZYnVuTG9WZFl1NThoSVREWU5mQ21OZ3Mw?=
 =?utf-8?B?ZkJaZlpjRU9ZU0xWMDQyNzh2TCswR2piVFBEYXZ6dzVFWldJemtoaWRSRTlh?=
 =?utf-8?B?TWdNZVZ2aDViSVdZL2d5bXgwMVcyS2YxWndycDFyOWE3d3RxNndBYlQyNTJk?=
 =?utf-8?B?cDJDWERBTnhVZ1lRT1hhakJ2d05wTEVIWkRpeTVFOU9Db1lxcFB0N2tvL2JK?=
 =?utf-8?B?N3dxeUdybWhwTGdIaDd3dEx0QTAweTNWYTBkK0VYMmVUWWpubFlScWhDTjBZ?=
 =?utf-8?B?dEtnYzN5cFlkKy9kajB4U25uZy8vaHV2aEwxNUVwWVF1YlQwN24xUERFRXht?=
 =?utf-8?B?ZkVHNnVBK2lPcGxoczFCQi9kNGtYckxRTXhDOUJSM3lBS3c2TzBVbGpsSDlj?=
 =?utf-8?B?aXd3cGNUQXM2OFEvb3pYY2l2SG5UL2N3V2JBa0o0NmFpUktIZXQ0cnphK0o4?=
 =?utf-8?B?SGovUVRlbjZiRkFNWjRKeEM1RnZ1NHpGdkZRTmdub3MyRG15SndKTXBkY25y?=
 =?utf-8?B?RWU0STZWNWlMaXVZbzZCM211TnhDdkJwZlFVRE04K0pWaC9qOEZtN3pMbFps?=
 =?utf-8?B?b0hoZWtWbFpLeU54ZVEraU9pbkM1S3gvd2QrYjdFTXZrbkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlJWQW9PSXkxUE1oTTVtajFlb0h0L0EvM2FIQXBBek0zRG9jN3NwTE5MRG4v?=
 =?utf-8?B?V0F6VVdSWXAveWgxWVNkWDFtaFBHL3VRRUtuU1RWMWdYMDZOVVlqVVZQa2hR?=
 =?utf-8?B?MWRjcVI2MHpFejNSTVpVN3VkOGwxNDFTTTRoL0pYRXVjcUVtcGM5U1B4cEpK?=
 =?utf-8?B?SHROMmVTL1lMZWFvYlA3V1FpTk5tTUJKSkhZZzg1SUhDYjRkSDBSSG84aUZl?=
 =?utf-8?B?RGhNallzRFd0Ri9BRXhBanNGcjhicVFPSExSMGNZZE5qL2xuWDFBK0ZZbEVF?=
 =?utf-8?B?OUxDQkUxeTRDR3FFSXdQNWpuWXR4V290ZTdxTzdNeURJbDB6b1RDdjk2UWFv?=
 =?utf-8?B?VkRERjgyQkY5Qkl3RXpmb2VBMU01eGtkRjZ0OFpRbzVxYlhGV3ZxLzNVUFFk?=
 =?utf-8?B?dzkrMFRCM0o4dHM2a0Qxd1o2RFcxRGZwZnAvaTBvMTJ0aDg2eEJZa2Fybkti?=
 =?utf-8?B?cUM2SUxtTHpJa2lIbTI4VnQyZk5OQ3lUbDNzZ1k1eXBjejRvd1QrOVFPaC9m?=
 =?utf-8?B?V2JJakhMYmc0NG0vS1dZc21OSml6TFA4QTh4MFpXeENzK2FZSWtLZktmei94?=
 =?utf-8?B?NjJGdUZFUnFTVUdhd2ZJLzlQaE1rNlBMUW5iZSs4UkxrNlE1NWJ4Skt4cjNW?=
 =?utf-8?B?LzJWTG1kRnN3ZGRsdG5UVUlmYTg2Q2w3eGxpeVdPQXFFOXN1SUZGcUkva0Mx?=
 =?utf-8?B?TVVPQjFQZEQvemVLS0Y5cTRhejJBQmpVdktHcDM5U3o5WGd6VzhqYldaNW1x?=
 =?utf-8?B?VEZLaDZSOEUwL3l3UzZUcjFqdWR3R0E4MzhIbjk3YjV4UnZoUUsvUnZzdmF3?=
 =?utf-8?B?cWl3bU1PQ09PYXc3cnJrWnlZQ1MvQUc5cytwbll2Mm02QTVrbk9EdXp5Q2hX?=
 =?utf-8?B?WkNBRDhoMHNDM2g5TmtWb3JRRHNRQWZiQW43M0t6OWt3bU5uVm1qOGJjKzl2?=
 =?utf-8?B?VUVHTERvdEdqQnF0T3VnQWFOdzFBNkNFTjY4WVFuZzBrTUFTMTljb0hUb3Bk?=
 =?utf-8?B?eUI4Nlh0ZG1MYTRJNUU2TGhmSEVJeFBXKzZrNlFRcGp6dm1CT01pZ3c3T2hr?=
 =?utf-8?B?NHRpTU9IRjJEdFFBWTduOEVZeVdtZmN5Wm83aXZaNXYwS3d3QlFyRFNLYSto?=
 =?utf-8?B?V1YrVnFScWZkZDNZZC9nVVkxRE4xVzZ3WGZTOVdwZDdLeXZZNEpUbThON0or?=
 =?utf-8?B?WTRHTnlZYXdrT2pWY0dqQitGYUlIQ1BEY2I0MmF6a2Z4REgwU1p0OVAyQ2VK?=
 =?utf-8?B?Qk01aG5EYW5vUXk4ckI3RTNIVXJIeXpaV3ZSTVRON0NCL0JCM0NjWGd6UGxP?=
 =?utf-8?B?MkVkM2RFdXJGT1o0TVVQUXMvUzVRb1dIQjhxbWRmM3Q0dEdNSzFzMmxPbGhS?=
 =?utf-8?B?VVI0N2lsMnJ4dWxxemJadnNqSGVSN29qSSt6TlNmdzRRa0xZT0FFa3hYUDdy?=
 =?utf-8?B?eXIvcG56SjhPTVMwN2phbDhBSXlKSVBxbHZIdUI5QVNjelNwWVkvRWhCcEp4?=
 =?utf-8?B?ZE5tRWRTcy96VzNIRXp0OW80aWpJa3BzNndKd1VTcW41UmZNUFByakMzTnpv?=
 =?utf-8?B?TkU0WmdtV2luTXNlSEdYUFloU3A2UVNOeXdjVDQ4bnBmQ1VOd3h4YmZRRDE4?=
 =?utf-8?B?R0ZoekpDeXluclR5NVJnYUtyK0Y3WDJoUUhUcmdEODUzK2Z4WklZSXYvRk5s?=
 =?utf-8?B?bS9TZWJaL2dSeVNGNlJmMWlLamtCcWN0RDJHOE1XRGlDZ0xIQzlZQ1NTcnF2?=
 =?utf-8?B?VFEwNW05Q3FNbjQ5T0Zva0xWa2k5MWxmN1Uyb3lhN1FCY2dGbmhVVGpKbDhz?=
 =?utf-8?B?TlI2b013YVdxcm1BdFlIL3R4OWd3OGRnK0ZWOWlXc2N6bU9lNTlJM0dWQU1D?=
 =?utf-8?B?NzRFaTJ4cEN6YmVaSU5QYTJ6ZitvdllyRjQydnN0aWJyVk8zQmxtMWI5Zitm?=
 =?utf-8?B?MGtCYlV3YUUwS3paT3J1VjhvYjYvT0V3NlFINWFTdUExeDlUVHd2S0JVc2hi?=
 =?utf-8?B?KytvNUV1clpQclptcmc5MVpVeTdvR0QwZCsrTUJIMXVVRU00UzVGMUhoVm4w?=
 =?utf-8?B?QXA2aXVycXFOQnMxUHdpMHJLVEtHdEo5YVAzVjdoQWZOTzcvNGFsbnUwbHJV?=
 =?utf-8?Q?ZQMtHwzGRfogoDXIKJB9jW598?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cee206b-4d51-4357-5f62-08de0733dcee
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:00:46.7740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8k4o1UebP/+bn6nbDMY9E0sguivm/mZox1dn3MCh/vAtxYgI2FjlZGdlkyad1MdpCbGc+BkifI1qGdyESwIiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
> On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
> > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > save/restore while this sequence is being programmed, partial writes may
> > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > instruction to write the sequence atomically.
> > 
> > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > 8 dwords instead of 5 dwords.
> > 
> > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > chunks.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > 
> > ---
> > V4 -> V5:
> > - Fixed review comments. (Matt B)
> > 
> > V3 -> V4:
> > - Fixed review comments. (Wajdeczko)
> > - Fix issues reported by patchworks.
> > 
> > V2 -> V3:
> > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > 
> > V1 -> V2:
> > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> >   (Auld, Matthew)
> > - Fix issues reported by patchworks.
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
> >  1 file changed, 72 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index c39c3b423d05..b629072956ee 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -5,7 +5,9 @@
> >  
> >  #include "xe_migrate.h"
> >  
> > +#include <asm/fpu/api.h>
> >  #include <linux/bitfield.h>
> > +#include <linux/cpufeature.h>
> >  #include <linux/sizes.h>
> >  
> >  #include <drm/drm_managed.h>
> > @@ -33,6 +35,7 @@
> >  #include "xe_res_cursor.h"
> >  #include "xe_sa.h"
> >  #include "xe_sched_job.h"
> > +#include "xe_sriov_vf_ccs.h"
> >  #include "xe_sync.h"
> >  #include "xe_trace_bo.h"
> >  #include "xe_validation.h"
> > @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
> >  	}
> >  }
> >  
> > -#define EMIT_COPY_CCS_DW 5
> > +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> > +{
> > +#ifdef CONFIG_X86
> > +	kernel_fpu_begin();
> > +	if (size == SZ_128) {
> > +		asm("vmovdqu (%0), %%xmm0\n"
> > +		    "vmovups %%xmm0,   (%1)\n"
> > +		    :: "r" (src), "r" (dst) : "memory");
> > +	} else if (size == SZ_256) {
> > +		asm("vmovdqu (%0), %%ymm0\n"
> > +		    "vmovups %%ymm0,   (%1)\n"
> > +		    :: "r" (src), "r" (dst) : "memory");
> > +	}
> > +	kernel_fpu_end();
> > +#endif
> 
> Everything in this patch LGTM but I think we maintainer input to ensure
> we are breaking some rules about inlined asm code in a driver (no idea
> if this exists) or if a better place would be somewhere common. Can you
> ping Lucas, Thomas, or Rodrigo and ask them about this?

Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)

But the rule does exist:
https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly

"don’t use inline assembly gratuitously when C can do the job. You can and should
poke hardware from C when possible"

In this case here, please explain why exactly memcpy with smp_wmb barriers and
or WRITE_ONCE code combined couldn't solve it.

Also, please explain how exactly vmovdqu guarantees the atomicity promised by
the commit message. On a quick search here my take is that for this 128 or 256
bits, atomicity is not guaranteed.

So, imho this patch is introducing a unmaintainable, complex, and fragile code
that is not even doing what it is claiming to do. But I will be glad if someone
can challenge this and prove me wrong.

Thanks,
Rodrigo.

> 
> Matt 
> 
> > +}
> > +
> > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > +{
> > +	u32 instr_size = size * BITS_PER_BYTE;
> > +
> > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > +
> > +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> > +		memcpy_vmovdqu(dst, src, instr_size);
> > +	else
> > +		memcpy(dst, src, size);
> > +}
> > +
> > +#define EMIT_COPY_CCS_DW 8
> >  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> >  			  u64 dst_ofs, bool dst_is_indirect,
> >  			  u64 src_ofs, bool src_is_indirect,
> >  			  u32 size)
> >  {
> > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> >  	struct xe_device *xe = gt_to_xe(gt);
> >  	u32 *cs = bb->cs + bb->len;
> >  	u32 num_ccs_blks;
> >  	u32 num_pages;
> >  	u32 ccs_copy_size;
> >  	u32 mocs;
> > +	u32 i = 0;
> >  
> >  	if (GRAPHICS_VERx100(xe) >= 2000) {
> >  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> >  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> >  	}
> >  
> > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > -		ccs_copy_size;
> > -	*cs++ = lower_32_bits(src_ofs);
> > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > -	*cs++ = lower_32_bits(dst_ofs);
> > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > +		  ccs_copy_size;
> > +	dw[i++] = lower_32_bits(src_ofs);
> > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > +	dw[i++] = lower_32_bits(dst_ofs);
> > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> >  
> > +	/*
> > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > +	 * write the sequence atomically.
> > +	 */
> > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > +	cs += EMIT_COPY_CCS_DW;
> >  	bb->len = cs - bb->cs;
> >  }
> >  
> > @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> >  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> >  }
> >  
> > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > +/*
> > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > + * save/restore while this sequence is being issued, partial writes may
> > + * trigger page faults when saving iGPU CCS metadata. Use
> > + * emit_atomic() to write the sequence atomically.
> > + */
> > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> >  {
> >  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > +
> > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > +		      MI_FLUSH_IMM_DW | flags;
> > +	dw[j++] = lower_32_bits(addr);
> > +	dw[j++] = upper_32_bits(addr);
> > +	dw[j++] = MI_NOOP;
> >  
> > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > -		  MI_FLUSH_IMM_DW | flags;
> > -	dw[i++] = lower_32_bits(addr);
> > -	dw[i++] = upper_32_bits(addr);
> > -	dw[i++] = MI_NOOP;
> > -	dw[i++] = MI_NOOP;
> > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> >  
> > -	return i;
> > +	return i + j;
> >  }
> >  
> >  /**
> > @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  	/* Calculate Batch buffer size */
> >  	batch_size = 0;
> >  	while (size) {
> > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> >  		u64 ccs_ofs, ccs_size;
> >  		u32 ccs_pt;
> >  
> > @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  	 * sizes here again before copy command is emitted.
> >  	 */
> >  	while (size) {
> > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> >  		u32 flush_flags = 0;
> >  		u64 ccs_ofs, ccs_size;
> >  		u32 ccs_pt;
> > @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> >  
> >  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> >  
> > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> >  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> >  						  src_L0_ofs, dst_is_pltt,
> >  						  src_L0, ccs_ofs, true);
> > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> >  
> >  		size -= src_L0;
> >  	}
> > -- 
> > 2.51.0
> > 
