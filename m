Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEE6C282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 14:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EFF010E8B5;
	Thu, 13 Mar 2025 14:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZ1vhBSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DBB10E8A0;
 Thu, 13 Mar 2025 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741874589; x=1773410589;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=2EJVgOK5WNoFyNWTuR7ibGicDP3e/9rVEpO6Vf3v5B0=;
 b=EZ1vhBSC1lu67SStEGAzOPFn3P4lztk9HOhZvHthQDAkW08NkmNzrWKl
 E66bFq+n0C5ou49QtL1Ju/prfGeL1WUGtkOKi/mryfX9JdVhh/8x5aOZ2
 BDjTB/MKiaIVkKG8ehT9PWITO+1Orq1klu2rEPvNviyOuEZR0e18vHxtU
 iuEyYihmQ1rR/cQyezgrbkMR6OmDP3yHB12KfwDuqoJcVCcafAuHIS4Zg
 dclRHLbqcVzNguvtLU10qv8vHRTkYnGpdKiwVErR5dPjpAib/NVvFWNes
 OSOIbcYATCzARaX2QOWgecSj6SLqa2nGxDofqJhJWWnOacCdkY00C1Cfc w==;
X-CSE-ConnectionGUID: Lfy4yk8iSj6UOQF+m18Xdg==
X-CSE-MsgGUID: qCMrQUccS6C/pLr4BpYRWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="43192440"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="43192440"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 07:03:04 -0700
X-CSE-ConnectionGUID: OnxPOcV8Qn+UupS1zSGl3Q==
X-CSE-MsgGUID: Yd+GjLL5REmCxkUF7CyMKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="121671691"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2025 07:03:04 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 07:03:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Mar 2025 07:03:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 07:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLXDPYzY+vxmTiPJ3mv9wAzUfhsCl3EGpzHhf4xpU6AY1DUdsJ2kqXYCxKeSYIJp5b9d2TPqZWLsLNcXCJnvH+oi4owZ9crpD/gO1tF13/h8hGXdrY7/vLv70CHntzaqkQjZ49UnXpyXSQBedAcIBYfSYVlYXBInAw6rFbn3bibiIkPDKemHu57LRaTIMU77w96eByTTnxEINa3rU0PiMOoXntBab60mDB/xETbHeHoOQ52kgvHABMJ0OjPfSuQ4BwxmsAQJSmZPMtwYjfeaSTPVkDsp4bOdsTVW/Eo6ZZwR6GOnw/xpJ73+fHkLoL1+QPJV1uE4q0aMq4ncf5+nhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beUB7DP+7lHPPxu/cSv+CySn0Onj2MIuGc0xqFnPxUg=;
 b=UI2mNwab9IcpNwHB86RHVrIy7nuYFCR7Cx6ji3c3+bcCPhx7O44sE0UIDOF3AUcdZKELIfnwBC/d40/dFl8T9w2BrG32E0lDnUgyPZ6XG5UhURDKSVw9k/p+gcZ8JgptwgOKtZUXbRiesEbfMhtDoFb6zFPI2mXSjxewC8laz2YGMMCg84tBxQlgYnDAXe+vckKPxBf/NXHD06KJ3QzL+1ol9kNwOBewlVpUuKlf72cT6LOnD2pZzXziOI9TdVw72HfLB1KKPjY0qaUAWjgY7hlncEOEMKzNZP73wnIZIta7qF+aTRBU6KABdL0V0og0nUgP6e8qFrxZmhZNxKjx0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 14:02:55 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 14:02:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <174177660636.24658.2689562896236120202@18a75f3d1eae>
References: <20250311-xe3lpd-bandwidth-update-v5-0-a95a9d90ad71@intel.com>
 <174177660636.24658.2689562896236120202@18a75f3d1eae>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/i915/xe3lpd: Update
 bandwidth parameters (rev5)
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Mar 2025 11:02:50 -0300
Message-ID: <174187457091.91144.6629895789320365427@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0098.namprd04.prod.outlook.com
 (2603:10b6:303:83::13) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 23422375-e65e-46c2-ad54-08dd6237c05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTUvMStoRi9La0xxemNZRWZuelJZYVZKM2RPeUNTU2RHWitqOHBBR0JsK3lW?=
 =?utf-8?B?NlNneStXbnVUT0o0a3B4TUF3bHdJenFPb003N3cwQ3FwMFh6R08yc3RWOHQr?=
 =?utf-8?B?a2R2Z2JRT29MM0t5V1I4alM5MjkvZmF6SnVYbURZR3lzYm0reURjZkl0Y09k?=
 =?utf-8?B?bFB5ZmtNZHRaT253NHk4L0lmcVhLQ1lmVjk2Ymc3WFlBRzRsVnBNdVQrVlJO?=
 =?utf-8?B?WGJydEtEcDd5Z0xORXRESEJzdEczbC9GOUZWd09xMTM4dEVpVjUzR2pwZm90?=
 =?utf-8?B?YmNvRXhBdTNuUlg3cDZBNklxcGhienVvNmNvek9iejNnOUNlcUF6TWVuUzJn?=
 =?utf-8?B?V0xHbWdRWDczempQWHl3OXB0NThaMXFKMWhyR3dWK3B3QVlSOEplQlMvWkhS?=
 =?utf-8?B?SG9RQmR2QmJFbk1mNDU2R0IwZUthek51TTRjTmYrcmtyU0Rlc2FnY3E0N2hv?=
 =?utf-8?B?VXl5YUc4NHNlbG4xajdTZDI2WUNpMEFXUm5XaTRJTHQxY0x0TW93UnFoWWFD?=
 =?utf-8?B?Mmc5d0Y3T1dsUFJDd0E1a3dRVFF0R0F4Z3c1TStPZVNSMWJIQ3BjZzV1TGdQ?=
 =?utf-8?B?MnJNa2thOWEyZ0kxMDZYSGZIcG1vL0xkc0xLTkFpK0Z0M013TnJoTTJyZ20v?=
 =?utf-8?B?bmI5bmRTSnpYc0FpMVUwOWdSZ2RKeityK2IxQTFnZ1ZDQTRvdFZ0RmlNWFZH?=
 =?utf-8?B?UjlUY1o1d1FVR1NzdVFkalRUT2U0Zy9WaFFBSElJVHRUMlZyNEVSYUNVVDJW?=
 =?utf-8?B?REI2K0tSUmNBeFphazZ2QlU3bi9QTTNqQTZ3STBBV3hSNU9vUzlRMlJISWZ4?=
 =?utf-8?B?aG9oUHB0L0sxTlNoZlFTcmZxT2FZbXcxK3U1SjdxNTljWG5VeWlNSEhMbmpM?=
 =?utf-8?B?TGx2NEQvbEpwRllTQ3BpTmhUNHhIb1d3U0p3YzlkdG5aVjFrUGZUU0kvbGox?=
 =?utf-8?B?M2ZFeXV1TzNFNTdjT0VrOU55K3NaRkU1K2dYSmsxZ2Y5N1hjSE42M1NCYWdD?=
 =?utf-8?B?VTlHcCtjOTlUVk1CRjVmTlEycnYraWxQWGhVQlhTbmF4UjNBMWkvb3ErZVJi?=
 =?utf-8?B?SVczclBQS1V2M3ZXM3orTkVZczhkVG5hZkVmaHYyRU9RVk1leGV6SnAwZGxr?=
 =?utf-8?B?NGZMOUxVVnRHaUo0NUsyR1N6MWhVMGZMN3Ayazl1MzdOR2x1YmwvUTRRYjIr?=
 =?utf-8?B?RVFhWFZoWXZUTXBEcjhraE0yakgwRjJUTDVGbGpYR3A2dDZVQ3Z6SnRVVmlk?=
 =?utf-8?B?K05abmlnSGVDVDJtUXBUdnBQcW12aFRrK2hpSzBGNHh5MGtQOUpOeTQ2SGpJ?=
 =?utf-8?B?eG5EUFZKZklyZ3dldklrRDh2Q25kWDFxU2lmNjlDaFYxL1EzdWJWK2k1dWRu?=
 =?utf-8?B?RmVUSHJ5c05zZytnekY0QjRKVkFKcUJTVmhEdUFTTGREdHlLb1BrRU5JNndM?=
 =?utf-8?B?a25lUFNSVENvWmNWSmhVZDFJZGQ3SW80ZXdxemNDRWp5cUFlZDk3bTM0dW5a?=
 =?utf-8?B?L0dVa3JDRC9sUDVVdm9WV1oyZ2pDbmQyVmtaSjBIdDQwTEVKRzVsM2RaM3FR?=
 =?utf-8?B?MEdSY0xKc1lXWnVsZDRKVVVFa01XSjZCdkFpbnFiNkM1eHllMlVDTVpNRVZL?=
 =?utf-8?B?VERYMCs3cDREaWJYVmZ6ZzVSWnl0aTFaRnJHbTl1RENibDRlRjdUUVhUUUho?=
 =?utf-8?B?cHM0UWg4YnVreENOdUxmaFdYYmFnckRHVWI2bkp3TU9qMWM0ckF5dFJUWGxv?=
 =?utf-8?B?bGNCVFR2aGhWaHlIL1RZQU5ic05Eb3dtQ1RsRkljQzRSK1JRRHlFQW9laTJD?=
 =?utf-8?B?YW9KaFJGYUNYMU40YU1rUVVnbDJJZmRzWXI1YW1SSzh2bTl2dUVQVEppTG1G?=
 =?utf-8?B?eE1XRXhSVlRhRVJGY1lhOUw3aFd5bHhlajVUd3hycHZuRlE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZVVUh1NnBBQzBFWVFaQ1VObFYyQXczQnF4M1JHeUs4eG92bitGT0gwTVdj?=
 =?utf-8?B?UkdKc1Z3OU1MMXM2MVllTEV6VzcwNndQVGhUUmxlNzdESEE0bnFBL1ZNVHJz?=
 =?utf-8?B?M25hZnBRUzMvTmV4d25QakkzSlY4T3dnOUdtSHlGZGdBZXR0TmUwa0ZsaG5M?=
 =?utf-8?B?Z3kwTmlMWWJpSWdpc0p5aDdCMjNacDlydTVlbmhTb0o5QnBlMk1RNUhrTkhB?=
 =?utf-8?B?ekdSQncveVFoR3l1UEh6Q2lrcDlPWDd4dzQxYkVGNXlyREhmbGh1VWFQVFZF?=
 =?utf-8?B?YU5ScFgyVVR2dDFDSEVRSTN0ZnJDNzUyK2MzR0xlemFPMGNpRVN6V0gwZnVl?=
 =?utf-8?B?eUZtajhBWDdtSFRTb1JsV1g5d0E5NDh1K05PeTFXVkxXMjY5c3lCWHI0UUJ3?=
 =?utf-8?B?Ny9PVG55eDhFNHZSTWZoZGNuWlFBc0o0cElHSWRJNmcvQ1kyM3JOL0dQbEhq?=
 =?utf-8?B?d0pieEZuQks0bDlUbTBacGZzb29LZUpPWXcrYjU1ZUF6dkxpL25kdzFpVkg4?=
 =?utf-8?B?bWZOMXpWbUZnNkFjck1GeTc1b3JvNXVWMU9RN1JmTUZFektLTE83dUZNWk1M?=
 =?utf-8?B?VUlTQmdpT1ltWEpFTXVCdjgxNDd3NjVuemg4YkFjN1crRUUwV243MWJmaGtP?=
 =?utf-8?B?TW9OVWNtZXRiMGxIK0ZOMjNZRmczb2ViWE9vSzlHemFrZTZiQ1J2MWxiQmVh?=
 =?utf-8?B?bVpISmtYZ0JxQitaU2xvR3pMSXBTMGQvMWN0R0N5eEFxNFh2L3pCOGk5Nkp3?=
 =?utf-8?B?SmN3NjlhcXRVZHpaY0k3YXgzb2JDT3pJdGc0MTZ4ZDZ0RVU1a01GUlVrZkpp?=
 =?utf-8?B?amsxRUlxOG5NTnhESmt4Qk9zN1ZNRXU2M1VONTBmRnZYR1ZtalNkdE0yZjN0?=
 =?utf-8?B?MXJUeDZOaHpuSW9EaUtCTGF4Qmx2c0JZOVdjWS95ZFJiUEc3eUNGYUtxQXE3?=
 =?utf-8?B?TDNHaE1UNXVjUEpGTXVxeXAyc1lsYVlIczMvQVhBaXlUeHFhSVovZTRVejQw?=
 =?utf-8?B?VC93RlF1czJjZEU4Nm5oMUdaMTNYSmU1VlYvd1dIMjVCdzNoZGdUaXo3Q24w?=
 =?utf-8?B?WE80M05zaTQ5K2lUVSthOVlya1Z4N0xjZkFpb0J6RnkyZytkcHNsWGVKdmcy?=
 =?utf-8?B?Y2dESWp5OXI5aWZmSm9UQS9ZMGZSVGthTTJlZEJtOWIrSGVyamlMTGk4V2tK?=
 =?utf-8?B?dVZ3emJ1NkJqWlRjSVpqbVo5YUFxYlZmaTlZMEpVQUpHRVQ5Zkc3VTdTYnBF?=
 =?utf-8?B?d0U5L2ZPdGh2WU9yM3UzMXdGQ1Z2emhhakVwT0hPVWV4OFdTb0tKNzYrY092?=
 =?utf-8?B?MlYyanhBeHlNQ2xEb0lNZnorVnh1Um9ZYlNhZEtCMk1XbFdGeENWVGVqNTNy?=
 =?utf-8?B?clM4aWFtSmhmN25PUi9FVmJzL1RLRzFFWklTSlBLS1MxWnFjQ1hhZ2w5TzhV?=
 =?utf-8?B?VHhlNmF3dTc3Y202alBiTXRYZm1uVnErMEpBZmtNdzYrYURLQlFMbTFXV2tj?=
 =?utf-8?B?LzhqZzRiSjkyaUJHam1TbVBhZ3lCd2hxa3JxUUhrSnE2ci9pd2tPeXcxais0?=
 =?utf-8?B?ZnV3b01ZTkhxM1BJL2tXRWE2UGc0WWFtdW1ZRDRKbDV4a2hRMkIya0ZPN3Z0?=
 =?utf-8?B?Q1FPSThZZmQrVGVMZTlxOVhGRElDbEVYWmQxSnA1dHhSRTFXMFFkQ2t5OHYy?=
 =?utf-8?B?dysvZUpNQlFLeU9XWmdxc3NVald5RXdpczZpcUZWVlJFK2FCWVdrUGJpRVd1?=
 =?utf-8?B?THdPbjJYRFcrYk51cGgxTENFa0VyRGZhVEZQRXc5OS8ySUF6RnExRDRVZE1u?=
 =?utf-8?B?Ti9YUXBWTXkwOGtxbUIxV2dmLzJSemoxQTRDdkN1bXBySDZUQ1VOUVRBc3Vz?=
 =?utf-8?B?MERzR2txSmYzVjhwTEZjMmhrdHFzTDExZ0tJcXVDcWdUaXNzUlJHQnBqZXRV?=
 =?utf-8?B?bCtDVnhsNXJiQ1N5SExRWnJSeENkUnlKdml3UGVIb1BXV1VyMHNmWWtUNldJ?=
 =?utf-8?B?OXBZTFJpcTFGQ2RURnVHZnJoeHVGYmNNVWYybXZpQkYyK0dFNFN5djhmQ3dY?=
 =?utf-8?B?Y3loWXR1R290VzBJakVpNjZaS0l1bFpQaFR1NmdoYmw2UVpwSTZMNDBRM0RT?=
 =?utf-8?B?ZHo2SHZBeDZJZVBtdkpTNy9GcW4vT2cxVEJQYjV5NmpzRjd4RUN5bnhXNHk1?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23422375-e65e-46c2-ad54-08dd6237c05f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 14:02:54.9827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSy1iu4xv/jS6V69oMd3sHxGyJ0tu0L9LCHOr95gMJaim+ZtxEmMUMjyzkfdgaKYoaZGHVStSdGvfM2tdnBg4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
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

Quoting Patchwork (2025-03-12 07:50:06-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/xe3lpd: Update bandwidth parameters (rev5)
>URL   : https://patchwork.freedesktop.org/series/144440/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2795-f8df428b3850ed87a1e2f3b12b6025328d8a6373=
_full -> xe-pw-144440v5_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-144440v5_full absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-144440v5_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1444=
40v5_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_hdr@static-toggle-suspend:
>    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2795-f8df428b3850ed87=
a1e2f3b12b6025328d8a6373/shard-dg2-464/igt@kms_hdr@static-toggle-suspend.ht=
ml
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v5/shard-dg2=
-432/igt@kms_hdr@static-toggle-suspend.html
>
>  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2:
>    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3]
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v5/shard-dg2=
-432/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2.html

We do not seem to have much useful information from the logs for this
result. Furthermore, we have seen multiple INCOMPLETE results for tests
that exercise suspend in DG2.

This series, which only effectively changes behavior for Xe3_LPD, should
not be related to this failure.

>
>  * igt@xe_oa@buffer-size:
>    - shard-bmg:          [PASS][4] -> [FAIL][5]
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2795-f8df428b3850ed87=
a1e2f3b12b6025328d8a6373/shard-bmg-7/igt@xe_oa@buffer-size.html
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144440v5/shard-bmg=
-8/igt@xe_oa@buffer-size.html

This maps to https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541.

--
Gustavo Sousa
