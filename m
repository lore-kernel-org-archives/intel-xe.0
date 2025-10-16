Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F08DCCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 19:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E4C10E35C;
	Thu, 16 Oct 2025 19:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgSG2t0X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5B010E35C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 19:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760644686; x=1792180686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/2ge2KtmzY6Sf3tjOq2Sdzy8/fidqDpWBeZnNOvFVCU=;
 b=UgSG2t0XqAR1+CFmjmeH6gViOZ3lbE0WYbIx8NpJmOMTkppUiSDKwXli
 mZ5Kz42Zv1KJU0gIx1aKX6Xr+UYq2NnbmviSjAPoP28x9uRUjQ8MxxEBs
 lL2O3XiBITz9bj/Nmm/WyBY19cTJ9EiweLAkXjjyX/gR+ypwNwMBS1Eu+
 fRA3qEYyK7Nsjjo4LmH3qMZCPbKnURRpIDpdrI6Kcp7JPexh+ZNcuzrSj
 vJZjp0hm+M4tDb2rcD85vZ/NduUZ73pxc4EqwhsFr+SLmN602MLkXXfIz
 adFyLQevDQ83s5YbG/vHZ47euDDyaOGzpIRzxBjvDMcKuwvnJ4U8bwOc0 Q==;
X-CSE-ConnectionGUID: b/tSkYnVRfWS6DQWpXkgXg==
X-CSE-MsgGUID: 7zZnLN15SPKzse/bCaJALA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62559996"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62559996"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:58:05 -0700
X-CSE-ConnectionGUID: YvspB57lQtSNKaa5ZLRCOA==
X-CSE-MsgGUID: ZpSV6bhwSt6+mGP/pV2HIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187825405"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:58:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:58:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 12:58:04 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:58:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4iOa1J3kIp0E9FxcROuNFrZ02FVkSDJ9dZTx9m5DmxA0JWJm9WNPESDhDid6AQ/7Qnpvyt2bKjWEd/LqD4hypCTR5yEZHcwPpkiLCBdTehBU4xP6RwxzVaK8fwZnFQQkDlKQ1PF5L/3PdGDRF9zwrRLU1LJAVqFUA9x26tKhGaoPyZlRPJW5hBdO3kqysb8gzd40FC3dzoEThinq5WNzHkV0jPP9XfVCLb0cvw8bfWKcQXR1MS0xdhO9sgaoITTtZkg4wkRkVb63tXdE7HGAls7Lk+VVikXdbm6JmgDD/4hGrC3HP19qZkZih16SWkTc2i/a2iyNyXKQGEkZqtLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDCvtqZikl0dkCq03St6RP+cV1mQEuTd6qXecdTkPs8=;
 b=ZwU6s+lGPrMvHk/Q61RIu7i6e/wWxFo1y6K/CYK8P1CfHdw0N9ekUalx62DKVJS3nlLNIGEYHiJGfuChVz1++G3mCFblTS3SLNxUfm6T3D0+lPoZx11RymHby6RxlZJoEq+/lyUZGBe2us4qEl1c/V+aKTAVGmjERsFrAJNl2MMGXMUhG4FAVx5lLO6hlRtSjrvlHQDcIMZjw6Wm/WETjTPV08E6pcyZEGIwIgsetnS3HemoQXqpFZM5s01JUAE0gBDDXeimJHFCw5H+mBeE8314Ez7c9scRwEj7vGoeI/boddJkCThRXEe4qXWlXq0+egmHASF0521xt4gbaqqZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 19:58:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 19:58:02 +0000
Message-ID: <8f905d60-23c0-4d49-8a94-7bc800d82baa@intel.com>
Date: Thu, 16 Oct 2025 21:57:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/vf: Helper for telling whether CCS
 migration BBs are needed
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
 <20251016120511.856792-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251016120511.856792-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: d1816036-1884-4145-8472-08de0cee5047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGNEbUVpRWx4OWVYVkpJaUcrRlk3a3BrNDR5QU1xR0R1cTJRb3BPdm5LVmVJ?=
 =?utf-8?B?c1ZxRWhvMnpwWktwVy9Bb0RGMEpWN05UbDVZRFN2SFBUajNRcmNhN3Q1NDhS?=
 =?utf-8?B?NlZnb2xUbS9kSnhuM29kTzhRSkdqcDR1N25kMXNSTzdWcklPeUhka3V5TFJn?=
 =?utf-8?B?d0k2T3FPUG5SSmNad2QyU1NKeVZZU0JwT1plaXVna3pQUXNkTGpNLzZNYlMz?=
 =?utf-8?B?L09WOTFHcDB4RlpHbE5WUVh5RTd6YnIwaUpFWWl4ODFhQmo2eFN5eFpvaWpX?=
 =?utf-8?B?dUhZbzVsY1VOOGdHWXlaOHVvdkM2Sk5JUkc3L0MvZXErRkdvYVBSZ3cyT0Yr?=
 =?utf-8?B?RHVueVVnQUVIaUZaa3ZKRXlKUWVmRDc1RGNaaUFpTGhzTk1KQzJ3TGhHMmFT?=
 =?utf-8?B?M1JvVThZNVFRL1R0ZjVOTE9RbWRiUWt0VEhIYzYxRTdoSVdDWlFsclpULzlV?=
 =?utf-8?B?WGQ0ZWZ1aGNBYW1FaE9TcVAyR2MwUUFBOGovaE5QM2FiOFdDS1dTYjk0bXNS?=
 =?utf-8?B?Sm9LZ3FDU3IrNnE5bEl2NkNHVXM1Si8rRG1LSXVtc1NoTGl6RDVOSytJZHJq?=
 =?utf-8?B?K3Zzd1dGWDc5OVc1cnRlN1R4TVRJWGdIUndBK3h5Nk1nTDVBR3Z3UVBmWXpF?=
 =?utf-8?B?R1kxb2hOQU1RdHJXaFlKbml1QXFtNWxWVFp0K3YyWHgvMFFURTVVbXRMQ2tF?=
 =?utf-8?B?TnlHQ28wdFJiZmJvQWRBQkNRYzBSb3M2Y3pxS0tjOCtONWRUQ0piaWptUUo4?=
 =?utf-8?B?ckQvTXNXR29QR2k1Zys2VDJwOUMzZWlCVk1JRjd6aWRRK3F3eGNVcWZ2YjJY?=
 =?utf-8?B?NWJWYjNQSnhyZnhwRzRyczFHMnhTWUpjVHkrczdIMmY0MXVCOWxHSnAwUERV?=
 =?utf-8?B?U0Q0c3l3MmlUdjU2a28xZkQvYURsRTRUSjVsZGx6RWFpd0pYcGRtUFNRREZ0?=
 =?utf-8?B?QThDWFJzdiszNzRiaXg5NWExQWpnb0NPdk9jSzl3NllReWRUVVpHdWNTSjZu?=
 =?utf-8?B?dytXWDFwbzdrSHNLdENZM3AyVmJ1SjRmRTRKNGFQZmRldTNGc1NVQUNRQyta?=
 =?utf-8?B?Y2RuckthNE9nUVZPc0RxVWRCcnRBZUdoeTQvQXF5a29hMEExc2llNU1NQWJT?=
 =?utf-8?B?aU5MdE5wTzFLS3BtVW83RitVT01jbnNzazNpNDBSTndaYVZNTjQ5YzdrbnQ4?=
 =?utf-8?B?eUxYRVJzSGZUcWNmVEpJMkQrMHVNMEVlcnJjNUhCV0JMYkIra0dzdEs3dy9a?=
 =?utf-8?B?VFQxV2FjeE5hSmpzRkErc2NNUFVGY3JGUHA1VTAvZkNQVGJRSkFHMElWRkVU?=
 =?utf-8?B?UE1vMUVKRkdtWUJ6ZDhqQy9JTTdmN1VCakhnV0xFMDkzVGFkQTJ4NmtNOU5E?=
 =?utf-8?B?ZnlGa2JndTMwR1hhc0sxc1FROEF3MDJ3cGRXWVRldkpHZ0tuY1JGb0w5NkV1?=
 =?utf-8?B?bE1CbkN4Z3hnbFV1ZVpaeHJsVmxsNmkxbkNJYXh3YStSK2VRTFpjcUM2VE43?=
 =?utf-8?B?bzFmNWlCdUV1NnFFRGRHNU5XT2V6eTVNKys0aGE3a0RUNHZiemhzOFVTMU1j?=
 =?utf-8?B?VGpmUXNBTUtDMjM3VVk4cFlSYVNtT1craVV3SERycHZJT2kxS2NOcGd0Tkw3?=
 =?utf-8?B?Y0U1bjdzTFg4OWw0K0hMR2VJZUdiT1NrYVBwU25iaFNnZ2JIZDRKR1lEYUdx?=
 =?utf-8?B?N0NOVG9qdjBicGVCbkFTVkZCT09ud2plT0VKMSt6RTJzZWc2WSsvSFpDeC9r?=
 =?utf-8?B?VUJ2SGtVUEhHU0tvYUdXQUw0ZS8zMlJFdE80WDdyS1I0dEdTenpwcWFnRFhW?=
 =?utf-8?B?Nzc2Y0F3VzVYd05ULzZwMEtYcFhIR0FWbXF1aXQ3OHc4Z3VvSitISWtreEpJ?=
 =?utf-8?B?R3ZOa3V4UXdEQXhWS2hOYVRzZlFWdndaUWtka2dEMm9Kbzk5ZlhTdnN6Q2VQ?=
 =?utf-8?Q?iuVNsrdRsBckVRPi/eq+/uHulyghQFgK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG1DU1Y0dDdJZVgwTEJoOE5sSmZ3NzR4cHk3cVd4SWhETDUyYWZxSDRkREdU?=
 =?utf-8?B?RXMvOWwxNjZDUDNabnUzcSttRzlhdzBPcFVTMk5nelkyYm1UWHVBVGZZbkc0?=
 =?utf-8?B?dnBWYUx5Vnh6ZkdhWFZQcXRoTGQrZTBGUU5TVFJ6a2FHYUdkalYxbzJ0bkNu?=
 =?utf-8?B?NFFZOUd3NFo5aldkSEx5cDJBdTliQWhjZCtoR0NvMmp1a1hnTy9wVlZodEdk?=
 =?utf-8?B?RTBwUFdvbFpKejQ3bXNmNldZMURTTXFrWSt6UCtPamFwNytodXh3d3d3QlQy?=
 =?utf-8?B?MzZZZ1hoNVBURGVMU3pYK1FtWjhsMWQvSnJHM2NyR1h6bVRxUzRSTFRoMnBj?=
 =?utf-8?B?aWRBYUN4RlFQQ1VEQVpUeFBiQ09DZ2NkM3VRVXh6cWxwSlNlSG5ncVM4Q0xP?=
 =?utf-8?B?MGsvNFFTdmNZa1Erczk4TFFoWmsrYkFHMWhRUXRLdlk1ZDU3QVhpVzd0anV1?=
 =?utf-8?B?M05nUWdyR0YrYVp2OGg3TUxWa29NbElISG13czIxcS9CWFpPVkVTeCtGbXhS?=
 =?utf-8?B?TGkvZHBQVWtsdVRZSVNDOThnblFqNTZuTGZ2QXpxRkdHc3JTbldSSzQ0bXZM?=
 =?utf-8?B?OHJrdkhvT0Q0Qmw4L3V3b0RyaFIxV0RXRTdRY2lIUCtGQnhKa0hianIraUtH?=
 =?utf-8?B?TGNNUlVUdDFJckRjbDlZQy9udWNkUEVxZjRnQ3Vua1Bia3hSQytjb0RycG5G?=
 =?utf-8?B?QTBGN1BMVjRDSWQvOXB0aGM4QzduNmNYTjVJZm9QdkhUZ1hLZkVLSWFXVmg2?=
 =?utf-8?B?TWYvUWp2UnBkd0lOQkpGRTF6d0NwZFQ2Nm5SRmxUb3M1cElGUUxGT2NmT0p1?=
 =?utf-8?B?Um5BeFhCYzM0UUxxUDNjRWxoVGZ5RHprdUwwaWRoSEtGVUFkeU0vZUZoYzVG?=
 =?utf-8?B?cVZzcHUyMy9lMElqU2xPZXRvMld0cVdnMWNoNmk3Vk5vcGxqUDFvb0hrcnhu?=
 =?utf-8?B?dXRDcW5zWHdrdXRET2VzTmJIa1JhS2JpUFNReEZIRHVwR0tDVnlMUisrOXhV?=
 =?utf-8?B?Q1lUYTd5Z2VsYlhVaEtsR2l4cFVVRldHOVFOZVd6SjlBb0FxRUZ4eU4rbXJv?=
 =?utf-8?B?dWh2b2IyMEJRVDZYSklDNkRXQjNjKzhQcjRRL0o5M2lpNTBCbHhweGFHZ3c5?=
 =?utf-8?B?REw1MkVVT2k1L0tYbXNDSVNSZnFSMGw0Ti9HSWpiT01udm94eUhSQms1aUJo?=
 =?utf-8?B?ekFWa2ZrNU10dnFEK2poVmRkM3lMN0pxRGxuNVpFR2EwekE0dFhJWUF4MWly?=
 =?utf-8?B?d3dqVVV4b1VlbFZ3SCtTdmp2QXNqdENhT1UvYXNKZm1VSVpnSFFkbHFEd3cv?=
 =?utf-8?B?YXRyZXNYSktOQlEzUk5tblYzZnc0TzExckdvYXc0UkhHWFlteUZwQmE2bDZR?=
 =?utf-8?B?MW5TS2hBOGEwNWo0dGtwMG0xaEdpcTcxb0pBeloyZ0I0ck9RdVliUElTRjJu?=
 =?utf-8?B?ajZ1bVFKVi9Ia2lGMEkrOW93TEltazhTci84RUlRc2xtd0VCakxjYkxQbjZL?=
 =?utf-8?B?WWR3b25XbzFyNStYaVZRdGdJSU9BMTVtaEtpRWNZYjMxbXJrYVNJK2NQK0h1?=
 =?utf-8?B?VnRlTTQ1b2Zrc0xIWGt1SmgyQXpNVkFJdWpLcWRxUzdLMDNmeElsQy80a2ZS?=
 =?utf-8?B?RjJiWXNCd0NpSmFvQTAvemdlc3FqaTNzYTlsV3ZGWHoybG1IVlNrb0lzSWdH?=
 =?utf-8?B?TmdoSFJ2dW9rR2tDRklvTnVrRGdqTlFUOUJUL2o5blBTREsyd0xIQ1MwRFRn?=
 =?utf-8?B?VUJIZFk1NUsvdlZqMWxmUlFack00aU9MS29VUjN4SUVHazRGQmxDTTRWOTVo?=
 =?utf-8?B?Z1d2d294TWlRR05YRTdRM1pYSjBieTc4VXFRclQ1Q2lWSjVhcTJ3Umh5bDNa?=
 =?utf-8?B?ZW5xdlV4aTgvRVl1SGdOM0N5U1ZrK2s0VEVYQUdKeGF1YkE2cDlYeVFkeUU2?=
 =?utf-8?B?b1FyeUEwMWdUSm84Zk5hY1p2WFVUSG54c3NCUEVYVDdQaitEWXhwd1l0NHd1?=
 =?utf-8?B?N0w0SXZqSndyZm5zTGFLSVN1QUN1K1k0ZDRpVldKNDlHODY3aVVZZ1c4eURq?=
 =?utf-8?B?SjJIUlduSFExaktpKy84bTBrZmtmaHRVMGtHODRQUkR0RmpLMnY4Vm9aRHRs?=
 =?utf-8?B?RWZoTEtNRXVkNUYvd1dxbWl1YjZRcldpNTk2Unl0cC9aNDBKK2VkdzNEbHph?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1816036-1884-4145-8472-08de0cee5047
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 19:58:02.4074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdhwFVP8RTBlieA35y3j8xxzI75dR4Y1wsfunGwWkZS/JJzu1mrRGYvXdfniDc/o5dvWsA1CtQvxBK1dh9m32mdEeyR0P3Jfyv4BbGf/qDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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



On 10/16/2025 2:05 PM, Tomasz Lis wrote:
> To avoid having duplicated checks, and also provide clear
> documentation of what are we checking for, the conditions
> for initing CCS BBs for VF migration are closed into a function.

I would drop "BBs" from title and commit message, as this is
just an implementation detail of the "VF CCS migration" feature
that doesn't need to be exposed right now.

> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 15 ++++++++++++++-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 ++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 790249801364..7688d1baf42f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -260,6 +260,19 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>  	return err;
>  }
>  
> +/**
> + * xe_sriov_vf_ccs_migration_bb_needed - Whether GuC requires CCS copy BBs for VF migration.

all functions in xe_sriov_vf_ccs.c are related to "migration"
but only this one mention it in its name, either rename other
functions to match this one, or name this one simply as:

      xe_sriov_vf_ccs_is_needed()

> + * @xe: the &xe_device instance.
> + *
> + * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
> + *
> + * Return: true if the BBs are needed, false otherwise.

"true if VF driver must participate in the CCS migration"

> + */
> +bool xe_sriov_vf_ccs_migration_bb_needed(struct xe_device *xe)
> +{

this should be always called from VF code, so even if not strictly required:

	xe_assert(xe, IS_SRIOV(xe))

> +	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
> +}
> +
>  static void xe_sriov_vf_ccs_fini(void *arg)
>  {
>  	struct xe_sriov_vf_ccs_ctx *ctx = arg;
> @@ -294,7 +307,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	xe_assert(xe, IS_SRIOV_VF(xe));
>  	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
>  
> -	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
> +	if (!xe_sriov_vf_ccs_migration_bb_needed(xe))
>  		return 0;
>  
>  	for_each_ccs_rw_ctx(ctx_id) {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index f8ca6efce9ee..dcba4173c712 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -14,6 +14,8 @@ struct drm_printer;
>  struct xe_device;
>  struct xe_bo;
>  
> +bool xe_sriov_vf_ccs_migration_bb_needed(struct xe_device *xe);
> +
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
>  int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);

