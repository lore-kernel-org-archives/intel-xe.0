Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7B8CDDE6E
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 11:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AEE110E13D;
	Wed, 23 Oct 2024 11:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkgOoOzn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B9C10E13D
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 11:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729683182; x=1761219182;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mMMPy7SuugFYvinsphAAAIno9a8a0CCUSp+mrR5h5Ew=;
 b=jkgOoOzn2bfk9fqGEj4C9KmdPc01btGzQlKPQtOP6Kc3i7kpVUA4L2py
 kfQmupjsUb5G27apEB06SfEZFodTQGF3r0VmrIK2igFCabqLtxqRGryb1
 353OipBaFbVTbTGkv5p7BvGndx4pT2FazfY++gw8G5RsPedBr4watjCXT
 8zbSqGB+Cwa4XtuEeCmaseQdT41qo4YJ4a4xy3hY6G0NNBHkJ30QNSUmw
 JYrz0Dh1t7EvdjChq3pBkuqiCqNxka7PkEvVmyH7UOtbw+YAw32gFyRz5
 vTrLPRo4iXLd4O+ppy2HWnv0t0LmuPMGemFFtDsIFDrgW5tWWfhNvGOxX w==;
X-CSE-ConnectionGUID: SknhGS0OSBebVXQd9F/tqA==
X-CSE-MsgGUID: hC8oWWkkT/eAdoQGTyx8JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29382324"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29382324"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 04:33:02 -0700
X-CSE-ConnectionGUID: +8GPWmCfR0SiL7cfeiQmPQ==
X-CSE-MsgGUID: 2iX9E7BSSEOCi8B33wWR4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="110964213"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 04:33:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 04:33:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 04:33:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 04:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfvR29j55B2XzuwhbIZ9MYvVHZdvNXkyhMj02DnnQj323RZZUq1ZFX7mijylTEIADbA5PvHKfqJvar7uHULgpzECCU+5Pvy8/SvBYUSiDYwIqbNhhJ6h99nJyXpQmodsHOwOLpO2b/r0OuhHXIh3DbI0NlqhwZlRlSZysziOYUmWyuQxj3s0R/EgsGfNW8bfzzmJkTyHjQdDbbf+dmqTSjJ14aJZs6CBDAPm9/1PGRwRNoJwC6SidYTCkCkTt6OVdkT0G0dDPrGzBq48pmxHg4+2DsaIEflX+hpLGHLU2lR7do+tG4zpFSOy0qJiMptbG7fq4bjeKzFhNQ8Dg2nMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fNeUHga5tajbM6iWUTCdW9zyVKkacjp0TqdtuVwxy4=;
 b=H8hUHMGcku7dNE84edAQrvpYv1hlf09svZN5G5e82RvIVDWtVAO2l4WxgwN5jcDnifD9H7640Jjo0w4W37CiQPnrqJQrh6SsO7LBAkqp0+b1qsX93emH2x8eDONRfOc1Co7MUHwy896mNBGWazBvHSHeW8lkpxgUN9ajsSVbntfPSs9xpxrEfCs8QhGGm/UIaFSH7jnmLzZGNv7bRsGi6nn4gHIejKDAnmdHu6jzQmJ7ThT+Pk7a06hs3yg6kqD0/PWtfFdb9Zk9WhlgzCzqLPiZbloGkYJ31yZwIDEyan8gavDOSlJyD+9sGDC4BVvdbNctbeoEsJPqYJotmWeyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 11:32:57 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%2]) with mapi id 15.20.8069.024; Wed, 23 Oct 2024
 11:32:57 +0000
Message-ID: <3afce3a1-5ae1-4c87-9bb1-838be1c8d951@intel.com>
Date: Wed, 23 Oct 2024 13:32:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
To: Matthew Brost <matthew.brost@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
 <ZxVI8IpkcgAq7PRx@DUT025-TGLU.fm.intel.com>
 <e50c5fdd-2872-4d92-a60f-d1db53fd1b79@intel.com>
 <ZxbW+3+hZtcSuWn8@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZxbW+3+hZtcSuWn8@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e95a6e4-cd35-4a1a-10c6-08dcf3567154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUpwN2wzSzh4ZkJyMkg4QVAxeWMyK25jTGQ0d2xCZHVUNC90a3BpUXBUMU0r?=
 =?utf-8?B?M2tTbHhKWFFSU2RaeW5oay9IQUlWMndHM1lBMzRucUxhUnlCOVRZNFhZSmZV?=
 =?utf-8?B?RzdVVEk1UFYzU2tpeU9TT2pQWXV3SjlPVWx4YzNCSVZlRnoyY2ZFTC96RUJ1?=
 =?utf-8?B?K3dZMnk3OEE4K1hJQTY2VVJFOURQMENBWTNDOVpiMFExc0pCZHN4LzE1LzM5?=
 =?utf-8?B?YkhnZ0g3WmVHbWhoalQyZ09EbFNvMGRKdUNhVTM3SzlJZUp6ZTI3d1dhU24v?=
 =?utf-8?B?M1NDTHB1eklZMVA3czV4OExaZkhDU1VxK0dROXJuZUNkaDlXNkQwdVd1SUdt?=
 =?utf-8?B?cmViZEtiQTExZHBBaEQ3MWg5eExDL2tPeStRSTVTQ2QzZ0ZBY2htNXZSYXRa?=
 =?utf-8?B?N0ozVllLVHFQdGVURlNZUkxadFVaN0p1RzVqS21DcitEalo4Q1VObGV4SXVy?=
 =?utf-8?B?S1MxSTJ5anM1YXBncDhVY2I0UGt3czcvOUlmWkx1RFplaU95MXdza0xzdkUz?=
 =?utf-8?B?MGRIWGxQNkJYK0Z3MVFJb0xRMjZrL1pMbjRVMlo2bzRiUHg3M0oxZW1JSGZZ?=
 =?utf-8?B?UU1VOW1nOTExR0F6c3drb1ZGTnJoejZCV1o1S3c2YjBuV1B4T1BkRWNRL1ph?=
 =?utf-8?B?ZStleTB3bW1DKzZYeFNEcngrUUVpNUNHOTFDMlBnNVhGUzRaN2ZqODRYTUlS?=
 =?utf-8?B?T0U2QVBPNmw1V0hCNUMyeEh3N2lpLzJUT1FvdkR0b3JNVjBKeHNiWEQrYmtl?=
 =?utf-8?B?VGZpVnRPZ0F4cjJ4SCthRjB5TjRMRWU5VlJnbCtNTVkrVEhaV0hkMUFoTGFS?=
 =?utf-8?B?UjVTZXVaaG01ajFDa1FRaDR0UWRlNm1SNXNPUG55YTVkeGw0WXBDd25YVlFE?=
 =?utf-8?B?OGM0bWo5N0Q5aWtOM1g5YS9UV1U2VEZDSXptMUZKdENHOVdiS3Y4ZTdJK0gy?=
 =?utf-8?B?R0JCZXFNMUovMFk0VnZmbC8vUnRGZzRjam1RQk1wT1dXamVDaStPTk9ucDFv?=
 =?utf-8?B?dkljN3NnQ09KUjVRSVM1V1RFYkZKbHpJTE84OGM5dFZKZUNzYUJHcm93QmFx?=
 =?utf-8?B?cGc4YUZLTjd3bldkS2ZGck9PZFpHSjFReVd3UkdVdkF0bkZscHJZalRVeWt6?=
 =?utf-8?B?UTJqM1NjN2Y5RmVDL0pSazgxNXlqQnhtbGRoUTQ3bml0bC9TamJEb0pzcFhi?=
 =?utf-8?B?dXd1ZVNmVjllOEVRSVlPaHRwb1l2aXlvYjcyeGIvSDlHbS9keUdJdFdjVjFn?=
 =?utf-8?B?ZTdIb3pVVHZ1NkNwT1JqU3NFRnNqcVBrUXY1Zkd6dVJObkEzc0dXYzN1OXBC?=
 =?utf-8?B?ZDZaV1RJZDlFdlpiTVdsZmJiNFdMRnZWdXdoRjRFcDNsZGZGRlgzUXVXRzRK?=
 =?utf-8?B?RC9xNWFHRjFCS0V0cUZRMmV5a0JBSVJvYklKWlpkWE0raEZJSmU2OTh6TWM3?=
 =?utf-8?B?MlBJcUx4MnhuRmMvRXh4eURIY0kwVUFpUjJCaVNzOXd3UzI0RkJpakhJR1dE?=
 =?utf-8?B?b0pURWZQb2dZZlYxL0oxekQ4OUJPQVNTaFNYamZaRGNIcStubDJVUjJQckMr?=
 =?utf-8?B?Y0JieVh3dE5wZ0NiRTd3R3hZRzJ4bGloSUE0M1owWUxYcXpaSUlWd3FwcGEr?=
 =?utf-8?B?TlduNzBMWjF3V0ZCd1p3TzNrR2tmeGxZbDNSTyt1WHg0ZjBYL2hKWlljQXo3?=
 =?utf-8?B?UUFXVjdleHJqTUViLzRncGFsaEtaa2g1K0lGeTJ6bjlLc0JtOWRJaDJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3ZaSHozSmxxTTZVU1dmd3NMT0pOSHNUS2pjeWRXeWhWZnlOOUJDOWxONEMr?=
 =?utf-8?B?TFI2R3FnMmRPN3pVdTE0dTdYRDl2aXdSYXFlNC9IWGJjZTZQRTRrZWt0REgv?=
 =?utf-8?B?c1d1VVZ6VnN0clMySTAyODZpNHNQTlBPYS9LeGgyWmlKRmlLaTAweWZjbDVj?=
 =?utf-8?B?VGFMS2VKN1ZENnAwSWh6NVlGOVU4QlBGbUdTNldyYUJ5Z1hmRzJEYlIvODh2?=
 =?utf-8?B?cVV3cTNueEJ0QU5zQUc0bVpEdVZOVHltd2crUlhJbG82MHI0dDdQb3B6L1lI?=
 =?utf-8?B?RFZjN0Jna3lvanZXWVAwQWFsZGRkVHNMNXJ6bVJxL2NpV2N4RTVzKytCbm5W?=
 =?utf-8?B?T2U3NkNOMjE4UzlSODBXM01QZ0tpQXRzZENQR2M4c2o3YXpPWWJndzA1dHVs?=
 =?utf-8?B?TzRJRXlBQ1hMb0dTaGJicUZJSXdYTFluMEViSWVrb1lsZjBrUWRkbjEzM2xv?=
 =?utf-8?B?Z1J4c05ZUzNBY0NGNGVRb0g1RkJQOFhRcjhDUjlFSnBKWG9FUjFRaFBZMkxh?=
 =?utf-8?B?a0wzUnNCRlRyQ0JnZ0VVQVIrdlpra2RXWmp6d2xFWHhrUzU5KzRYRThOMFIv?=
 =?utf-8?B?emVTZjJrRk1OZlRpNTZlQ1IrZ3kvKzUxNnN3L1FTVkdMM21wZ3RUT3kwaTc4?=
 =?utf-8?B?QzB5MnRoQ2FyR1JpNU9FdDk5YVRsclhMSnhIYkwzWHI1Y0p2cm80Z01uYVor?=
 =?utf-8?B?YzFKWmVlTjFrZXMyWU5aamZuSHhEWjlTcFhnK2M0b29yWHpDTnozbUU2dWpp?=
 =?utf-8?B?T1UybXFoWlVmd0NzdWFqdm5UWWYwRnFpNFB4T1RZZWxTVERCSlpoU0dWZnhV?=
 =?utf-8?B?NjVPdmxITHBOOXczbk5Wd1oyL1QxUFd5NGd5enhTN1RDc0tZTG4waGdWZGtO?=
 =?utf-8?B?bEh3K01seTV2MnlRSWgxSyt6R1N3RXNHOGtyZElNQnFSRTRQYU9LSkNVRjNH?=
 =?utf-8?B?dVR2UDBEZFlvbkNieGNyaWRoQy9RQmpYUVhjOFRPSjQ1T2lxY243eWJYSkhk?=
 =?utf-8?B?aytTaWtZNTRpYzVVWjl5S2xxajFRRUYwdG05djkrQmFDWDJBeURZUW9jNVRh?=
 =?utf-8?B?MnhmRGlnbnFJR3ZWcWRZakV0WjhDNVQ1dDdYUHBad1RaVVlqSmVoc0dzUm44?=
 =?utf-8?B?Znh3aDdpQXdOZU1SVWlYc0tJUWFSMGVjblhKRjhET05UTGNJZW1tMTdvczBU?=
 =?utf-8?B?eklGK0I2dUlvYlp2N1R3V3NLMGJIYStBRkVhVm1GbHI4Y3A5NjRGQ3B3TDRw?=
 =?utf-8?B?MHhoeVJkTnpvellUZVloeVNMNTJVKzFVUTRvb1FvVTcvYWxSTUFSY3gvTmNQ?=
 =?utf-8?B?cUhBM1hDNjNWQ2ZTZWRzUVV6dGU5R3ZEdUhlQUFCSzZoVThqemRxZ1ZOWGpl?=
 =?utf-8?B?TnBZdkpFcGc3R1YyVHJKOWxvenE1OEFJMGN6WkY5WUFKdWZ1WXg0dTBNczRw?=
 =?utf-8?B?SzEyakZ1QjRJUGQ3SDJoQldYbndrWEtGVjRqMmNqTFFVOG5rdmw3NmYyZmpn?=
 =?utf-8?B?U3AwMHp3MWNpQTNkN1pqbXd3LzIzV09takplamZOaVdXeTkwS0Fmc0RQNWE5?=
 =?utf-8?B?YkVULzNHMFNRWVFZTERob1dFQjFlcEF3TDBWaVZXVUxQSUJFUENudDJmbVRS?=
 =?utf-8?B?cVg2Z09vNEdmSFUyMDdGMHY3VEZhckNjNWpWQlgzcExlWTBQQUtGNWY1Smtt?=
 =?utf-8?B?UGF4dCtvM29IQjVQV3NxM2pCRGVOOEoyS1lKT3o4QmhOS05kMytqcGkrdlFO?=
 =?utf-8?B?MSs0Nkl3bkNqZ1lqZzhncG5WRy9JbWRWSkRhQmZpVXh1N2lHbjFrRFFXUVZ3?=
 =?utf-8?B?L3M5YkdBWVczcitlYUlQVXFjdG8yTFB4blRhdXZyZ210b1BXQVAwRStoMTlr?=
 =?utf-8?B?WGkrNmQxNkVQclB3Z0NKeFlJNHFSaEt2REcwcWUvbjVTaWNlYjVXNmN2clFV?=
 =?utf-8?B?YmZ1RFpHVVhVQUxLdGtiVTl6aFdpWG4yT2NMMGpiSnhUWjhmVHloSEN4dEd0?=
 =?utf-8?B?TTJPeWJZcU82Ym9oeS9USjFOL1VHSkhGUnJZdERUcmEvS3dGT1dZbzBPQ3ZD?=
 =?utf-8?B?UmZIZVRuK2xtWXpzRnJsOXRhOXZQc3VDSGYzS2g0cHI0cG5aNFdabWFLVDJT?=
 =?utf-8?B?eGtPK0h4ZE05aWttTmpsdzdNUjVEWlkrSWhIWTZvT1ZGRVlzcFRLNTlkV1Q4?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e95a6e4-cd35-4a1a-10c6-08dcf3567154
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 11:32:57.6229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlNtCvKq7ferYdml2zVXg954ovK9cBtIjdBK2rJcJMZ3ob4DxeepgbBrePWYsYuFVom+4C+ru1OcDxOXGYyKiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
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

W dniu 22.10.2024 o 00:34, Matthew Brost pisze:
> On Mon, Oct 21, 2024 at 11:54:30AM +0200, Hajda, Andrzej wrote:
>> W dniu 20.10.2024 o 20:16, Matthew Brost pisze:
>>> On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
>>>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> 
>>>> Debugger needs to read/write program's vmas including 
>>>> userptr_vma. Since hmm_range_fault is used to pin userptr 
>>>> vmas, it is possible to map those vmas from debugger context.
>>>> 
>>>> v2: pin pages vs notifier, move to vm.c (Matthew)
>>>> 
>>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> Signed- off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>>>> Signed- off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com> 
>>>> Reviewed- by: Jonathan Cavitt <jonathan.cavitt@intel.com> --- 
>>>> drivers/ gpu/drm/xe/xe_eudebug.c |  2 +- drivers/gpu/drm/xe/ 
>>>> xe_vm.c      | 47 +++++++++++++++++++++++++++++++++ drivers/ 
>>>> gpu/drm/xe/xe_vm.h      |  3 +++ 3 files changed, 51 
>>>> insertions(+), 1 deletion(-)
>>>> 
>>>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/ 
>>>> drm/ xe/xe_eudebug.c index edad6d533d0b..b09d7414cfe3 100644 
>>>> --- a/ drivers/gpu/drm/xe/xe_eudebug.c +++ b/drivers/gpu/drm/ 
>>>> xe/ xe_eudebug.c @@ -3023,7 +3023,7 @@ static int 
>>>> xe_eudebug_vma_access(struct xe_vma *vma, u64 offset, return 
>>>> ret; } -	return -EINVAL; +	return 
>>>> xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, 
>>>> write); } static int xe_eudebug_vm_access(struct xe_vm *vm, 
>>>> u64 offset, diff --git a/drivers/gpu/drm/xe/xe_vm.c b/
>>>> drivers/ gpu/drm/xe/xe_vm.c index a836dfc5a86f..5f891e76993b
>>>> 100644 --- a/drivers/gpu/drm/xe/xe_vm.c +++ b/drivers/gpu/drm/
>>>> xe/xe_vm.c @@ -3421,3 +3421,50 @@ void
>>>> xe_vm_snapshot_free(struct xe_vm_snapshot *snap) }
>>>> kvfree(snap); } + +int xe_uvma_access(struct xe_userptr_vma
>>>> *uvma, u64 offset, + void *buf, u64 len, bool write) +{
>>> 
>>> Maybe dump question but are we overthinking this here?
>>> 
>>> Can we just use kthread_use_mm, copy_to_user, copy_from_user?
>>> 
>>> If not then my previous comments still apply here.
>> 
>> This function is called from debugger process context and 
>> kthread_use_mm is allowed only from kthread. Spawning kthread
>> just for this is an option but looks odd and suboptimal, could be
>> kind of last resort, or not?
>> 
>> Another options: 1. Keep reference to remote task in xe_userptr 
>> and use access_process_vm(up->task, ...).
>> 
> 
> I think remote refs are generally a bad idea but admittedly don't 
> fully understand what this would look like.
> 
>> 2. Pass xe_eudebug.target_task reference down from eudebug 
>> framework to this helper and use access_process_vm. Current call 
>> chain is: __xe_eudebug_vm_access - has access to 
>> xe_eudebug.target_task ->__vm_read_write --->xe_eudebug_vm_access 
>> ---->xe_eudebug_vm_access ----->xe_eudebug_vma_access ------
>>> xe_vm_userptr_access So to achieve this multiple changes are
>> required, but maybe it is valid path to go? One potential issue 
>> with 1 and 2 is that multiple UMD tests were failing when 
>> access_process_vm/access_remote_vm were used, they were not 
>> investigated as this approach was dropped due to different 
>> reasons.
>> 
>> 3. Continue approach from this patch, but with corrected page 
>> iterator of up->sg sg list[1]. This was nacked by you(?) [2] but
>> I have problem understanding why? I see lot of code in kernel 
>> mapping sg pages: linux$ git grep ' kmap.*sg' | wc -l
> 
> I looked here every example I found has mapping and accessing 1
> page at time not mapping 1 page and accessing many.
> 
>> 61 Is it incorrect? Or our case is different?
>> 
> 
> A sglist segments are dma-addresses (virtual address), thus every
> 4k in the segment can be a different physical page.

sglist is also list of pages and their lengths (in case of consecutive
pages, they are glued together), i.e. exactly what we need. And this is
done in xe_build_sg: it calls sg_alloc_table_from_pages_segment which
is documented as follows:
...
* Allocate and initialize an sg table from a list of pages. Contiguous
* ranges of the pages are squashed into a single scatterlist node up to the
* maximum size specified in @max_segment. A user may provide an offset at a
* start and a size of valid data in a buffer specified by the page array.
...
So sglist contains the same information as hmm_range->hmm_pfns[i] and 
little more.

So my concern is if mapping operation can destroy this info, but looking 
at the code this does not seems to be the case. For example 
iommu_dma_map_sg docs explicitly says about "preserve the original 
offsets and sizes for the caller".


> 
> i.e., look at this snippet:
> 
> +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start; + + 
> cur_len = min(cur.size, cur.remaining); +		if (write) + memcpy(ptr, 
> buf, cur_len); +		else +			memcpy(buf, ptr, cur_len); + 
> kunmap_local(ptr);
> 
> If 'cur.start' > 4k, then you are potentially pointing to an 
> incorrect page and corrupting memory.

With added possibility to iterate over sgl pages in xe_res_cursor[1] it 
does not seems to be true.
Why? cur.start is limited by length of the segment (cur.sgl->length), if 
it happens to be more than 4k, it means sg_page(cur.sgl) points to 
consecutive pages and cur.start is correct.

> 
> Likewise if 'cur_len' > 4k, then you are potentially pointing to an 
> incorrect page and corrupting memory.

Again, in case of consecutive pages it should be in range.

Anyway if there is an issue with consecutive pages, which I am not aware 
of, we can always build sg list with segments pointing to 4K pages by
modyfing xe_build_sg to call sg_alloc_table_from_pages_segment with 4K 
max segment size.

[1]: 
https://lore.kernel.org/intel-xe/20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/

Regards
Andrzej

> 
> This loop would have to be changed to something like below which 
> kmaps and accesses 1 page at a time...  for (xe_res_first_sg(up-
> >sg, offset, len, &cur); cur.remaining; xe_res_next(&cur, cur_len))
> { int segment_len; int remain;
> 
> cur_len = min(cur.size, cur.remaining); remain = cur_len;
> 
> for (i = 0; i < cur_len; i += segment_len) { phys_addr_t phys = 
> iommu_iova_to_phys(sg_dma_address(cur.sgl) + i + cur.start); struct 
> page *page = phys_to_page(phys); void *ptr = kmap_local_page(page); 
> int ptr_offset = offset & ~PAGE_MASK;
> 
> segment_len = min(remain, PAGE_SIZE - ptr_offset);
> 
> if (write) memcpy(ptr + ptr_offset, buf + i, segment_len); else 
> memcpy(buf + i, ptr + ptr_offset, segment_len); kunmap_local(ptr);
> 
> offset += segment_len; remain -= segment_len; }  buf += cur_len; }
> 
>> 4. As you suggested in [3](?), modify 
>> xe_hmm_userptr_populate_range to keep hmm_range.hmm_pfns(or sth 
>> similar) in xe_userptr and use it later (instead of up->sg) to 
>> iterate over pages.
>> 
> 
> Or just call hmm_range_fault directly here and operate on returned 
> pages directly.
> 
> BTW eventually all the userptr stuff is going to change and be
> based on GPU SVM [4]. Calling hmm_range_fault directly will always
> work though and likely the safest option.
> 
> Matt
> 
> [4] https://patchwork.freedesktop.org/patch/619809/? 
> series=137870&rev=2
> 
>> [1]: https://lore.kernel.org/intel-xe/20241011- 
>> xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/ [2]: 
>> https://lore.kernel.org/intel-xe/Zw32fauoUmB6Iojk@DUT025- 
>> TGLU.fm.intel.com/ [3]: https://patchwork.freedesktop.org/ 
>> patch/617481/?series=136572&rev=2#comment_1126527
>> 
>> Regards Andrzej
>> 
>>> 
>>> Matt
>>> 
>>>> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma); +	struct 
>>>> xe_userptr *up = &uvma->userptr; +	struct xe_res_cursor cur = 
>>>> {}; +	int cur_len, ret = 0; + +	while (true) { +
>>>> down_read(&vm-
>>>>> userptr.notifier_lock); +		if (!
>>>> xe_vma_userptr_check_repin(uvma)) +			break; + +
>>>> spin_lock(&vm-
>>>>> userptr.invalidated_lock); + list_del_init(&uvma- 
>>>>> userptr.invalidate_link); + spin_unlock(&vm- 
>>>>> userptr.invalidated_lock); + +		up_read(&vm- 
>>>>> userptr.notifier_lock); +		ret =
>>>> xe_vma_userptr_pin_pages(uvma); +		if (ret) +			return ret; 
>>>> +	} + +	if (!up->sg) { +		ret = -EINVAL; +		goto 
>>>> out_unlock_notifier; +	} + +	for (xe_res_first_sg(up->sg, 
>>>> offset, len, &cur); cur.remaining; +	     xe_res_next(&cur, 
>>>> cur_len)) { +		void *ptr = kmap_local_page(sg_page(cur.sgl))
>>>> + cur.start; + +		cur_len = min(cur.size, cur.remaining); +
>>>> if (write) +			memcpy(ptr, buf, cur_len); +		else +
>>>> memcpy(buf, ptr, cur_len); +		kunmap_local(ptr); +		buf +=
>>>> cur_len; +	} + ret = len; + +out_unlock_notifier: +
>>>> up_read(&vm-
>>>>> userptr.notifier_lock); +	return ret; +} diff --git a/ 
>>>>> drivers/
>>>> gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h index 
>>>> c864dba35e1d..99b9a9b011de 100644 --- a/drivers/gpu/drm/xe/ 
>>>> xe_vm.h +++ b/drivers/gpu/drm/xe/xe_vm.h @@ -281,3 +281,6 @@ 
>>>> struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm 
>>>> *vm); void xe_vm_snapshot_capture_delayed(struct 
>>>> xe_vm_snapshot *snap); void xe_vm_snapshot_print(struct 
>>>> xe_vm_snapshot *snap, struct drm_printer *p); void 
>>>> xe_vm_snapshot_free(struct xe_vm_snapshot *snap); + +int 
>>>> xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset, + void 
>>>> *buf, u64 len, bool write); -- 2.34.1
>>>> 
>> 

