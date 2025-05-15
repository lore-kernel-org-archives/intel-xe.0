Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A321C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 22:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00D610E971;
	Thu, 15 May 2025 22:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kErFuK8k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A52B10E970
 for <intel-xe@lists.freedesktop.org>; Thu, 15 May 2025 22:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747346900; x=1778882900;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=JA/82NHmKu6RThP/OuR5plmtuCrryc4dOJfNOAjR52s=;
 b=kErFuK8kKpE+RkdWZFhKkU6J4hFhDs0r1C8rVLBGNg+ePswExtvaN1Wc
 Uq4iEktp6Ozzc7LmYEpGVXuGj43qHU5egNdehd7VIvBP7fCLd+hkSjwVQ
 ltN7Wwpt8HSpmZDiUBfl5PbpMZ5pDz/ZtbGiH21pDFSqg094+MjKN3aDd
 fhWmnjIpYJeykF0my8YNpRINizJdoHGxDj9JWIEcFyetW6qQcVl4g3/Nt
 rXYyxNUmNTMgKOj4M0VZB8+t6jGizHA5dFZiHKdaRw1TgmRnv7c5TJxkk
 am1z6+AV1QY7H8VpS/8jNdza0bUj90otvXxG5PQr8aCNa6ZwgGMAFkqn6 A==;
X-CSE-ConnectionGUID: uVR2hJ2OR/2nAjk88k1Obg==
X-CSE-MsgGUID: OraRBHQjSmi+JhN8xNcgSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53109881"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; d="scan'208,217";a="53109881"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:08:17 -0700
X-CSE-ConnectionGUID: a9ef9M6ISp+avuRP1DOxNw==
X-CSE-MsgGUID: H7pCXyviSX69W9Av2ZPOZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
 d="scan'208,217";a="169573525"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 15:08:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 15:08:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 15:08:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 15:08:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYrHwH0cU5GnzIvmM4RFe2eAaMmXSOehzd27mANuWjNzhlvmUrS9EozOeKZwSWqKgfpyzl9zS6Igz/7liRvKXlzathNhNp4Fg3erJtggHNXxyB2WQ/CpKOb0G+5G+aOj+jVlX+NytlK2DtmkvCJQwFKMUHTcA4cEH9CJECzH4J5hkiwqKi3ugpU1SN1ms1PyoAAlRvt3D0n/3VWExgIra+Mn+PU6yIeYH/dXq8WC2qxC9FfLwLBQ7CDG+T0DnZ0Ymp6Wq/tYkciGUi/qeh7TpTbLbds1h5eM1XHYKIAhBT8WAeh9ScVp1O0WTedIKv9rgzVQdSjEofyyEkUTQDyp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeTcpVFCHGYsqIRV+5ekAWANSqyI0EqCUJQlCiqcOXU=;
 b=eDOA8q84Cu4Z+1j/1/FlzpX3h+BxpfE5xvm4/20toJyeM0g10iCKciYA4A0A6VBDdM/9aDUTkLpxBtHq/fRWySb30gxWkuPGnN3c+rBer3zPucyHXnvJesJHjh/BMpSNqjO2xeLDj7DJvP+Q54e0d6IWJxtb+bH8MPSgC/QagclsC+OJx7TJjBnLGXLYAGdLxnyrC9omSufqjUmp4QFbEybD9Nrk5Gr7HkKuwS2IPqmVZ6LVvjgq8wSDksOM/5UVgVkY2ZqzsV+bc0PZA4+7ztEWp8AjbSC8tn+FfVT3ojyjmrfLoHYyYMzCIQI7J55wH3IfLpw6Gu7TKIVHK/YWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Thu, 15 May
 2025 22:07:53 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 22:07:53 +0000
Content-Type: multipart/alternative;
 boundary="------------0Cs4Z1452n0uPrlZPPpKnqqK"
Message-ID: <64e6641d-7b0d-41a5-87f5-54a03d6bece1@intel.com>
Date: Fri, 16 May 2025 00:07:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/7] drm/xe/vf: Rebase MEMIRQ structures for all
 contexts after migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-7-tomasz.lis@intel.com>
 <689654c7-b47c-445d-be19-76671fda4a4a@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <689654c7-b47c-445d-be19-76671fda4a4a@intel.com>
X-ClientProxiedBy: VI1PR0202CA0025.eurprd02.prod.outlook.com
 (2603:10a6:803:14::38) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SJ2PR11MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b28ef50-6882-48df-39ca-08dd93fcf074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amRhZlYybE1DaUZuYUU2R0NucGpBVEwzWDJnMlp5ZWlnbllVQmxMbzRpMk5Y?=
 =?utf-8?B?ODhDanFaNXZRbVVkR3cwbDV5WTc1bXNYRGF5WEswczBQb1p0UGREQUFOWSt2?=
 =?utf-8?B?L2hIQ3VMbE1rZTdsU0FqMFVDSGdxdTdRQ3VUVUp5OW9uT1dKQUw3RXRrV2k0?=
 =?utf-8?B?c2prT2RmcWFiWjluZVNROVRrRDdLUGxVOGRMYXdYNVRubHFTZ2RldFBEbU1z?=
 =?utf-8?B?RW55VEoxTlJmVXZBVzcza1RuQ3hLeG0wemR3elZYZXI2eG5oaDk5ZDBTU1pv?=
 =?utf-8?B?Rkh2dklYK01XNXlNUjNrL1RyS1BWZDNEKzZvRCt3NURQaFBMMnlWcGJOVTFC?=
 =?utf-8?B?NmMyajVOaGxsT3NSNGVsY1h4UXZoUkNTc08ydTQvZWgvcjY5cXVnbS9pbDIx?=
 =?utf-8?B?VWpXNlBIb3JRdVYrTWpCV2xrUU1uc280dHNmSkJzQlBrVFd0UzIrWDRLWkdI?=
 =?utf-8?B?R3d5c1RiT0dyWkwrN25pS2RzU3J2OVdtSHM5YkpSUDZyUDNhWU04bjlNeXN0?=
 =?utf-8?B?OC9DRGN6amZJVk85N29jdk9ZSUx2eURSalRWWU52eld3amtiWldvV2xJTFZM?=
 =?utf-8?B?WkZxZFZzSlBaajdaU3NieENtck9hVVJNNVdXQVhEVDdGVk05Vjlkc3ZEMy9G?=
 =?utf-8?B?aEZBU2Q5R21xa0IxcWtPcVZOLytIM2FibkxRcVlKaCtJQVpSVVM4ZTVyZGMx?=
 =?utf-8?B?am9xVitvMVdNTjhRdWk4MWdTUVEvblJKY1JzV3dUUjVsUTNOZ3lUZzN0ZVQr?=
 =?utf-8?B?YjhkM3JrVjVGZU5oYXNXdm40MmdzMUYrWWxiVFFKV21WV2N1aEYrUmFJVWhq?=
 =?utf-8?B?ZE1uOGNQYU8rMWp2Nnc1OHFuL3gvQWtIOFhBYUkydVZxSWFCTDBUckxFcmNw?=
 =?utf-8?B?eUZRdmlILzRzcERheElTWC9FTy96dncvYXZLbUpjMncyMTdac3ZldTlsT1V2?=
 =?utf-8?B?QnlRaWFJZkpaV24rSnltL2VQVVFIcEpJMTdpaGNmNzNkR3Ixaldad0tON3lB?=
 =?utf-8?B?dmxPRnJ4dVNWYWlEWTd3eTNLamM3eDg3ZS9vL3FQNHZ5dTJhR2dBd000MTNC?=
 =?utf-8?B?YlE3SDZlblZocUFES3BJL05WMnhoOHJSbDNwSStWNFRmNUR6dlJmOUh3Ulhh?=
 =?utf-8?B?OEYvQXhrdlpKRGJZL2Y3bmx4R21YL2VmbmV2VFJTWmxmVjlNazN6Mkg4b3RR?=
 =?utf-8?B?aUhFWndFYW1POEtWVjZLdFF2cEJlUXRvSFVNRC9FbkdlK0xaWnpJQVBkTlNa?=
 =?utf-8?B?dm9lTTlzTDlWVXd1a2lJZmxCczJXMUpucjhUdm9SQWRLak85WS9oQVpBOXpG?=
 =?utf-8?B?bUhhbDl6Ly8vbG53cHgvbE5TaFBNZ3Q2SWJ3ZHFUMmJWUC92UExVQVVGaFdO?=
 =?utf-8?B?L3Rvbll3K1Zwa3BFZk4wbzNFamFEamNBc0pYRDFQZmQzZEd5VGhVNC8xMFNW?=
 =?utf-8?B?TVRNWUZyRE9oeWdnQzdha2EySGhwelVrTW9JRUwxaU9uYnJsOXJCRWNIOEFu?=
 =?utf-8?B?MU9qNkVVc1ZNSTlFMDh4eXZ4ZHFXWFJDL0p2WER2bDBHKzhBNVg5RVJpZHB4?=
 =?utf-8?B?TG01SlByOWdkMkd1WDBWV1JQV1hqK1lhSDYvRkM2eGJLaDZWTWxhUnVUdkxT?=
 =?utf-8?B?Skk1eWQxOSttVEc4M2p2TFJEemRLblNlQmxMbnpzbWFHZ0VwN3NTMTlVSDhG?=
 =?utf-8?B?ZmhPVzFHZEFobE9LZ2t5Z1RnMDMxbGFLZXZKZTdhMHdRZVBzRm9GWkkyc2Ro?=
 =?utf-8?B?WFAzak02dTIwWlcyc1ZIanpzd01WeWhtUnlWVmd2ak1WZ0RFUDVxeEpYVzVY?=
 =?utf-8?B?N1pGcVZ5dFZlVWNaSVh0VDd2SUg1eUxOTVJCRTV0dmgwa1dnSElqb0VxbnhU?=
 =?utf-8?B?dmVhWDJjWTdKc2tmVnNzdTc0U3gzT2UvazhqNmd0WXlyNUE4ME9wTHZYUGNE?=
 =?utf-8?Q?wFgRPIC5GE8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE15Z3VoMWtNek5lSVBmUHdVbm5BdkZBVjNtN1hLQTJsbDlMSHBuVW1hNHFl?=
 =?utf-8?B?RkRBNkRsQVRyTmJPQjk1a05YRytqb3pCYWU3eFE1YjFxNUM5TXJtbnlLelcy?=
 =?utf-8?B?ckpqbnJEK2hiK0VibGZ1bnRDN2RKRHFFMWtWTUttTVptamZyWllmUDBwTjda?=
 =?utf-8?B?R2Uxakl2SXNQd3QrMG9ZQ3JmQzdqQ1JCV3gzb2VMcGlkdXAvRlR2aTNBREwr?=
 =?utf-8?B?aVlETWlZdTExOHJJTGdJeEFuOWV2VVpXcC82NHdvVG5rU21NTDBxY0o4a2hM?=
 =?utf-8?B?RFBLaFFWdW1ka0JKSnVGRmVYbEpRU3p6d2VjQUMyRkt2dnpKK3p4bUUxL0VF?=
 =?utf-8?B?TC9Hbk83RU9NTm5LMFhaL0dCN0hWZU5uQWtNdlNnYjNmM2R3MFZGbzRKT0Nz?=
 =?utf-8?B?Z2pnUHBraHhvcC9KeW1SLytmalcwWGYzdGNCVU5kZWxNMi9wQUp5TlR6R2Vk?=
 =?utf-8?B?L0ljMzVSQlkxY1lLbEVsMU1EQzdYOHJvSGZCaEw5YUUxZitzUHBsekx0UVZK?=
 =?utf-8?B?bDl2RGZQemh2Wi9SWmdSRmMwa2Z0QkJTY2VmRnNPblNxN0ZQTWNGMWtaQVpP?=
 =?utf-8?B?YjJlektWeWdCblVpRDdYaDJEOGo3MTJDNFhYKzJrNUtxazdEWEY4TGFDT3cz?=
 =?utf-8?B?K3QzSklYcmZFbzBLK0sxRHpuU0IyN3J1bHNKMk1vR0hxOEsyT2ZoeEdROGhv?=
 =?utf-8?B?WU9VVXI0bklNUUw1VTJzTGphNGc4NGxxSzl6TGNOcURUb21OenRYd29oM1gr?=
 =?utf-8?B?WkpSZGRTbElhSHFMenVYUWNCRVQ1NGR5eWdJT3czN2V3ck1pS0lYWUlMNEJU?=
 =?utf-8?B?TnUrMndUNFNvZWVLa3ZnTE9CdFJJRmZWUmZoK0lZc04xR2cwdHR4dHZJZERw?=
 =?utf-8?B?WjdFR1FZajhmMCtISWlvaTErYllkTVBwR2RUWEMyYVVBdEtWOUsvZ0g3OFRr?=
 =?utf-8?B?RDJvcTFzQjV1SFJhSU8zNU9MNzFPaSs5UkJudWVzN2FaVlg3eEIzNUc3WlJH?=
 =?utf-8?B?d2VkYzdMZ1ZXL051T3BzM3RzNnVVNjVQK3hHNGc2N1hzek81V2VwQXl6UFp5?=
 =?utf-8?B?czBLUmR6WW1ZWXJuVGJ0bDIyRjZzcGhrSGhaWkd2eUMxdHVHM3NoOWtwYlR5?=
 =?utf-8?B?WitVQXNidldDMnIyUGZCSmoxc0FLZWlHRmpDTHJzY1BlZjhMRjlmUmVtMHNk?=
 =?utf-8?B?QUdUOHVTaFNFeTdGeEpKbk15R2x1NDFrN2JTdE16MTB3K0tDMVZDNDlzOE0y?=
 =?utf-8?B?Q2ZvRmlSZnVQL2FGcFBwZU1VT2l0WUtLRmJtWHZtUzdkQTZFSjZWd0dCNXE0?=
 =?utf-8?B?S05SUzZYKzV5TDVLZVBUbUpEMllUcXdHYmhJNW4wVlFidDJlVE83WXo5NWZS?=
 =?utf-8?B?R1ZjR05VYVJ6L1pvQlI3a2g4L3BGYjg0cXRqL2Q3YkxoVnRaUXl5K25wbnNj?=
 =?utf-8?B?WVk5OGRqaG9keHVid1VLVHlnM3lPMnZPYm9mTW8zNFlDZHBQTWdiSnR2emN2?=
 =?utf-8?B?c29Pb0kvNEpIYzJCR3Jzb1M1M3V6U1Mzak9EbXJxaWl1aVpINWk0VjNtUURF?=
 =?utf-8?B?K0c1YmNMWkRPeWxoWmNxeEJCcjR2VHZKTnNHR2MzeFZUSjVLc0JDWElqZlBR?=
 =?utf-8?B?Q2xYeHVSeWF6bXA2NlhrYUlGckluUG5SdmFHZlFkZGJSRkVVbWZPOEVReTFD?=
 =?utf-8?B?R0ZwSVVWZVNRdTY2V3VUMDRvcngwazNLbGJhR3RoWURHSVljdkdZdFR2V0NC?=
 =?utf-8?B?NXJSUmozOTFVcWZxSzNpeUZCNU95MWFib05XUEV0WDJZNlBBd3hoY2ZtWlM2?=
 =?utf-8?B?cXMvWTJZS3pSb2M0Uk9FVkdaT0kvRjBSSjg4VHVWRDNydmlJQWxjZzJRSzIr?=
 =?utf-8?B?dFdUb2k0RUN1cUNseGNCNkJERWJQL01tMUx4Nng2VmtFL2IzSy9EN00yN3Vy?=
 =?utf-8?B?VHdmNlhDYm01dFVKVk40eHFGL0NyajNLdzBHRHJQSzNWVkN2eW1EWkc5MkMz?=
 =?utf-8?B?anFicDFZQXNZajREaTA4RE9CajdhREFSdWU0dlhZQ3ZUbSt1YTJaTDE4STNh?=
 =?utf-8?B?OVdhQ0xHYWExMlN2d05OZjNMLzN4WGZhZWUyL3RWdHovRFBQT2p6NisxNUFX?=
 =?utf-8?Q?qDoc17JFErGrEDbQpg2o66bu5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b28ef50-6882-48df-39ca-08dd93fcf074
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 22:07:53.5518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXUulh7fkOYnL2EzofGl8gs7DhmK2uN4B9JN4Y4ysxBfT2MLx4OFWtANiOxbtiVkVOvTEm/0NanOgdapsnVvOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
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

--------------0Cs4Z1452n0uPrlZPPpKnqqK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 14.05.2025 22:03, Michal Wajdeczko wrote:
>
> On 14.05.2025 00:49, Tomasz Lis wrote:
>> All contexts require an update of state data, as the data includes
>> GGTT references to memirq-related buffers.
>>
>> Default contexts need these references updated as well, because they
>> are not refreshed when a new context is created from them.
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_lrc.c      | 41 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_lrc.h      |  2 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c | 17 +++++++++++--
>>   3 files changed, 58 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 43e1c18e1769..5a7f0077ef31 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -898,6 +898,47 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
>>   	return data;
>>   }
>>   
>> +/**
>> + * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
>> + *   of given engine.
>> + * @hwe: the &xe_hw_engine struct instance
>> + */
>> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
>> +{
>> +	struct xe_gt *gt = hwe->gt;
>> +	u32 *regs;
>> +
>> +	if (!gt->default_lrc[hwe->class])
>> +		return;
>> +
>> +	regs = gt->default_lrc[hwe->class] + LRC_PPHWSP_SIZE;
>> +	set_memory_based_intr(regs, hwe);
>> +}
>> +
>> +/**
>> + * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
>> + *   for given LRC.
>> + * @hwe: the &xe_hw_engine struct instance
>> + * @lrc: the &xe_lrc struct instance
>> + */
>> +void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc)
>> +{
>> +	struct xe_gt *gt = hwe->gt;
>> +	struct iosys_map map;
>> +	size_t regs_len;
>> +	u32 *regs;
>> +
>> +	map = __xe_lrc_regs_map(lrc);
>> +	regs_len = lrc_reg_size(gt_to_xe(gt));
>> +	regs = kzalloc(regs_len, GFP_ATOMIC);
>> +	if (!regs)
>> +		return;
> no error ? but recovery will be now broken, no?

If there is a problem with allocating even 300 bytes, then something 
definitely will be broken.

We used `|GFP_ATOMIC`allocation, which in case of quick way failing has 
an expensive callback capable of using reserves. If that is failing then 
the system must have encountered something really bad. GFX recovery 
won't be the only effect.
|

>> +	xe_map_memcpy_from(gt_to_xe(gt), regs, &map, 0, regs_len);
>> +	set_memory_based_intr(regs, hwe);
>> +	xe_map_memcpy_to(gt_to_xe(gt), &map, 0, regs, regs_len);
>> +	kfree(regs);
> maybe instead of this alloc + RMW + free just update:
>
> 	[CTX_INT_MASK_ENABLE_PTR]
> 	[CTX_INT_STATUS_REPORT_PTR]
> 	[CTX_INT_SRC_REPORT_PTR]
>
> using 3x xe_lrc_write_ctx_reg() like it was done in patch 5/7 ?

Ok, we have a precedence for that in `xe_lrc_init()` (so we're setting 
the values twice there). Avoiding this unnecessary allocation and copy 
makes up for slight duplication, plus the final code should still be 
shorter. Good suggestion.

-Tomasz

>> +}
>> +
>>   static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
>>   {
>>   	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc->gt));
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index e7a99cfd0abe..3f0ae3affafe 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>>   u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>>   u32 *xe_lrc_regs(struct xe_lrc *lrc);
>>   void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
>> +void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
>> +void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc);
>>   
>>   u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>>   void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 016faa29cddd..c08c44dbd383 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -225,12 +225,23 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>> +{
>> +	struct xe_hw_engine *hwe;
>> +	enum xe_hw_engine_id id;
>> +
>> +	for_each_hw_engine(hwe, gt, id)
>> +		xe_default_lrc_update_memirq_regs_with_address(hwe);
>> +}
>> +
>>   static void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)
>>   {
>>   	int i;
>>   
>> -	for (i = 0; i < eq->width; ++i)
>> +	for (i = 0; i < eq->width; ++i) {
>> +		xe_lrc_update_memirq_regs_with_address(eq->hwe, eq->lrc[i]);
>>   		xe_lrc_update_hwctx_regs_with_address(eq->lrc[i]);
>> +	}
>>   }
>>   
>>   static void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
>> @@ -249,8 +260,10 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
>>   	struct xe_gt *gt;
>>   	unsigned int id;
>>   
>> -	for_each_gt(gt, xe, id)
>> +	for_each_gt(gt, xe, id) {
>> +		xe_gt_default_lrcs_hwsp_rebase(gt);
>>   		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
>> +	}
>>   }
>>   
>>   static void vf_post_migration_fixup_ctb(struct xe_device *xe)
--------------0Cs4Z1452n0uPrlZPPpKnqqK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 14.05.2025 22:03, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:689654c7-b47c-445d-be19-76671fda4a4a@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 14.05.2025 00:49, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">All contexts require an update of state data, as the data includes
GGTT references to memirq-related buffers.

Default contexts need these references updated as well, because they
are not refreshed when a new context is created from them.

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_lrc.c      | 41 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h      |  2 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c | 17 +++++++++++--
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 43e1c18e1769..5a7f0077ef31 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -898,6 +898,47 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 	return data;
 }
 
+/**
+ * xe_default_lrc_update_memirq_regs_with_address - Re-compute GGTT references in default LRC
+ *   of given engine.
+ * @hwe: the &amp;xe_hw_engine struct instance
+ */
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe-&gt;gt;
+	u32 *regs;
+
+	if (!gt-&gt;default_lrc[hwe-&gt;class])
+		return;
+
+	regs = gt-&gt;default_lrc[hwe-&gt;class] + LRC_PPHWSP_SIZE;
+	set_memory_based_intr(regs, hwe);
+}
+
+/**
+ * xe_lrc_update_memirq_regs_with_address - Re-compute GGTT references in mem interrupt data
+ *   for given LRC.
+ * @hwe: the &amp;xe_hw_engine struct instance
+ * @lrc: the &amp;xe_lrc struct instance
+ */
+void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc)
+{
+	struct xe_gt *gt = hwe-&gt;gt;
+	struct iosys_map map;
+	size_t regs_len;
+	u32 *regs;
+
+	map = __xe_lrc_regs_map(lrc);
+	regs_len = lrc_reg_size(gt_to_xe(gt));
+	regs = kzalloc(regs_len, GFP_ATOMIC);
+	if (!regs)
+		return;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
no error ? but recovery will be now broken, no?</pre>
    </blockquote>
    <p>If there is a problem with allocating even 300 bytes, then
      something definitely will be broken.</p>
    <p>We used `<code class="docutils literal notranslate"><span class="pre">GFP_ATOMIC`allocation, which in case of quick way
          failing has an expensive callback capable of using reserves.
          If that is failing then the system must have encountered
          something really bad. GFX recovery won't be the only effect.<br>
        </span></code></p>
    <blockquote type="cite" cite="mid:689654c7-b47c-445d-be19-76671fda4a4a@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	xe_map_memcpy_from(gt_to_xe(gt), regs, &amp;map, 0, regs_len);
+	set_memory_based_intr(regs, hwe);
+	xe_map_memcpy_to(gt_to_xe(gt), &amp;map, 0, regs, regs_len);
+	kfree(regs);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
maybe instead of this alloc + RMW + free just update:

	[CTX_INT_MASK_ENABLE_PTR]
	[CTX_INT_STATUS_REPORT_PTR]
	[CTX_INT_SRC_REPORT_PTR]

using 3x xe_lrc_write_ctx_reg() like it was done in patch 5/7 ?</pre>
    </blockquote>
    <p>Ok, we have a precedence for that in `xe_lrc_init()` (so we're
      setting the values twice there). Avoiding this unnecessary
      allocation and copy makes up for slight duplication, plus the
      final code should still be shorter. Good suggestion.</p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:689654c7-b47c-445d-be19-76671fda4a4a@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+}
+
 static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 {
 	u64 desc = xe_vm_pdp4_descriptor(vm, gt_to_tile(lrc-&gt;gt));
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index e7a99cfd0abe..3f0ae3affafe 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -89,6 +89,8 @@ u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
 void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
+void xe_default_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe);
+void xe_lrc_update_memirq_regs_with_address(struct xe_hw_engine *hwe, struct xe_lrc *lrc);
 
 u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
 void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 016faa29cddd..c08c44dbd383 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -225,12 +225,23 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void xe_gt_default_lrcs_hwsp_rebase(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id)
+		xe_default_lrc_update_memirq_regs_with_address(hwe);
+}
+
 static void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *eq)
 {
 	int i;
 
-	for (i = 0; i &lt; eq-&gt;width; ++i)
+	for (i = 0; i &lt; eq-&gt;width; ++i) {
+		xe_lrc_update_memirq_regs_with_address(eq-&gt;hwe, eq-&gt;lrc[i]);
 		xe_lrc_update_hwctx_regs_with_address(eq-&gt;lrc[i]);
+	}
 }
 
 static void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
@@ -249,8 +260,10 @@ static void vf_post_migration_fixup_contexts(struct xe_device *xe)
 	struct xe_gt *gt;
 	unsigned int id;
 
-	for_each_gt(gt, xe, id)
+	for_each_gt(gt, xe, id) {
+		xe_gt_default_lrcs_hwsp_rebase(gt);
 		xe_guc_contexts_hwsp_rebase(&amp;gt-&gt;uc.guc);
+	}
 }
 
 static void vf_post_migration_fixup_ctb(struct xe_device *xe)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------0Cs4Z1452n0uPrlZPPpKnqqK--
