Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481DBC04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 06:47:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4A510E1E6;
	Tue, 14 May 2024 06:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnDw+25j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D62110E1E6;
 Tue, 14 May 2024 06:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715669224; x=1747205224;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8S6MeYS8VxikYMIRU5EC29nc3gaikxVl+R5DrPoKl6Q=;
 b=hnDw+25jp4Icpbi6vm/MR5YaOFHh1wx8iAQtvpgrr0F54Xxz5OHyvhYl
 6ramwUx8JVUey9s1hkEnNNF7tIdv+aVERWwfm1Ont1BATcPABSMFK7dSh
 D9kXqdmawHnaqxP/m4DXZt8hhRJdMZIussrOqGYdsJbcW4ip/LZi27j2c
 1eWSip6h5f6+kS+9hUAVdy8wlhKb/b0gWNGUga6/ENZcFbYpUf56MwJCg
 V3MT7Zbez9FVQWoP/4tpV9oRq1aK4fUB6r77a6yjZD/Z4Qepjy2synjv6
 v7KfyGayw5g/vwzEIdUFQVLifFmPUeCm5j95GA+Ohl7mJ4ooaZLFJWnES A==;
X-CSE-ConnectionGUID: Pauanu3DRiCIpXGNoTM4sg==
X-CSE-MsgGUID: alUmiDGLRWy5DYiBk8Anmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14578561"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="14578561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 23:47:03 -0700
X-CSE-ConnectionGUID: tuFlcanNQQWDn/qXwpphag==
X-CSE-MsgGUID: bKGnDr8kRfOP+gP8Q85IVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35278374"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 23:47:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 23:47:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 23:47:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 23:47:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHkvPuYqWZHLiwKtfbpLR4AI3pIyx2rA5cO2oqZYul3pl2amWqRYHehxDY8mGnLOlizeeF0ZKEFQDl7YGD8gsGuNWlFvK8w3i0H9KXe/KhRF6I4SSjFtpeFRSi4zbQEn8ZoDVzL5ozNHSrQ0mnsu9C4ZR2DWVY7V74A4g7AMxgkn4Yo0lf7pahwKiggMkTl57yZkpN+ec7RMaDePrf7rxs6l8HhBBvK9L7/7YjSrS1TqntfHjWhUifkd2qMc1FONCm9upew76yCkAs63jnd+dmQupLDFPujAPe1kcbceqvk9TUjBL+CtayxvBiZ7+hNBh6rSj60p038tVBPocqDq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeGUthSjTaR3n0SbP3E4/0Avc6XaQu0HRq2LRvTBvlg=;
 b=NfaXR91ayhz+h7JIrHSZpcJcaQy9mLzvJ4rZQNAiSN0xTzjljM26yffKvs2iq6wjb5gehiS5Z8HmqlDP019t+kP2rQ+4qffX1jOxyb3/wTLk8gXzf0EpH6jbTC/+cEVw2jF2nBFcn1EnJtDS7MiF8MZRV6L5Vq3zr2Unk19dcwIGqHmOd+JnHOCd5+PlSyarEyqJ5pv9FneTgCNzNH4dZ4uhTqr0IaYr4niwADapQDI/mt38SaH3sGlGkWu4UUidId5yjkpj9v2cKw+Jyw+Wrp31d0sCiHcSOWdwT6cvf18fvuu7O5nSFQXsyflwOh2qSiD9rRzwAxfVCN+BI7T6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB4821.namprd11.prod.outlook.com (2603:10b6:510:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 06:46:51 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 06:46:51 +0000
Message-ID: <f6dd61dc-a1f1-4df8-a13e-ebb807196881@intel.com>
Date: Tue, 14 May 2024 12:16:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/5] tests/intel/xe_pm: Also disable display for
 mmap_system test
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <igt-dev@lists.freedesktop.org>,
 <janga.rahul.kumar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Francois Dugast <francois.dugast@intel.com>
References: <20240513185518.772398-1-rodrigo.vivi@intel.com>
 <20240513185518.772398-3-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240513185518.772398-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::17) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB4821:EE_
X-MS-Office365-Filtering-Correlation-Id: cf527eee-ff4a-4e06-b014-08dc73e1a255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEVSNWdua1h5Qk43QTRPSUgyQWRrbUVtK2NzZkxQTUVrYzlZSHd4TzczR3VX?=
 =?utf-8?B?SGliT0lRNWdOZWROclQ4KzlZUUZXNUxKWkthdGE5OFFIckYwdEdiRzhQOUlN?=
 =?utf-8?B?cTVQTGV6TWhISk5lcFp4SmgraXc4OUhpRmM1ek05eFdob2N2RTQ5bDhQcHNl?=
 =?utf-8?B?bHRCcVhmNU5vNXZYRmRFUG9FR0JZak5LdE5MTEo2ZWEyQmVoNEdyVkJCTk5q?=
 =?utf-8?B?MEMrcmd6dnNoam5JOHZneEkvTVlWUk0wOStyRG9IQ2FsbWxqY0hON3RvNXRr?=
 =?utf-8?B?K0hvakh2dlVXSUp5d1RWTUN3WjNCdjhBOEVCQ2tWcVRCaDNBRDZWY2s5ZG5q?=
 =?utf-8?B?Z1JVSlZiVUtsdmNVbkVoQ0F3dzJodGJEc3psaCtQQ2RseDBjajJiaEluUlRV?=
 =?utf-8?B?UWNNdXhDMnk3K3N1bnp3NHJmNTcrUXU1L0krWUNqekVUMENkWGFBRTNsWWVp?=
 =?utf-8?B?elYxSlZ1VmlUNXNCelA4RTRPRCtIem1OZTNVcm9iQ2M5N0pMeDBDWlBROEtr?=
 =?utf-8?B?cnEvTWFqS3VLNGdjbjk0VGEwdXp4eWlTSVl2MlZ0SjJpZXVrNHlCU0RUcjZR?=
 =?utf-8?B?M3c2ZUg1OHFMc0ZOYUNOVCthRk04aWg0cDVXelRMNHFoMzg5WVdFMlhFT0dC?=
 =?utf-8?B?Zys1MUdodEhHNWpmc0gxWnI0bytCZ1Jwa2lBdiszeXQzZXQzcm1tc2lNcFgy?=
 =?utf-8?B?SVZucVd2UzlQU0dHUVU5VzgxSHZrUTl6aElxNDJyMGN0elZpUEFKK0NFUG5m?=
 =?utf-8?B?b1VmYTkvRGxSRFNJVC9YaEhYTkYrQzNTcEtiT0RmaXBwL3Z1YUpmM0tJdnZ6?=
 =?utf-8?B?RWE2SGw5SFlkZmhwTytsQlo5eDYzMzRSUG0zaVgrOGJ1dlYwbjIxVkFTanNX?=
 =?utf-8?B?Ylpoem5lUk93aHhVZVpWWGg3bTBKVWhxdzFDcVBmSkdOVGJCN0thcnkrTTdt?=
 =?utf-8?B?ODhINXBTbTZsN1I0WFVkbFlQV2dwMk95Uzg1Z2M4L1FTOFFKT1gyR0ltRiti?=
 =?utf-8?B?cmpHQTU1ZjNrVGpyaEFDeklFc2REczFHZ2EyWGFNeENiUDRkRndVLzlhRk1Z?=
 =?utf-8?B?TUtySzVBYkgyMEpPSDBnTDFDdnJkVHZiZkJ6YWFZSWlzTDBBbXU1QWliUmJU?=
 =?utf-8?B?bUdMTXVYRmJGamNMZkphN29IWUVsbHdES3BvN2lLSmVJQndrZDRzanJMejZV?=
 =?utf-8?B?NGQ4NzNwK3NqVE5WY1VaSjZscUgrNUh4UTNINHZVL3FTbkgzZlEza0hra0cy?=
 =?utf-8?B?aHRGNmxmQnBFOSsrUlVRMi9haUFKWlJ1VkV0SWNhR1VBN09BRG9lRnFZWjk2?=
 =?utf-8?B?VmdCUklnZzRWd01EYXBCSmhMR1VGRXpTSU93TzRiczVUbXpmUDNRVUEyTVpZ?=
 =?utf-8?B?dU9SeWc5ZGgyaDBmdXVlQ1lBekJKVHRqZEl0YllQb01BaHRBZUtMQWVISUs0?=
 =?utf-8?B?MFZBTldpbVRGekVBNmNJSWFNYVpMM3pERWhJNURIa0pvSGpiZnpaQ2I0V3Nz?=
 =?utf-8?B?L1Vhd3Z0OUlVTkxzOEF6TGQ5TWFPbVZpSGZuVnpNcXN5eDR5UXd1WXM5T3pk?=
 =?utf-8?B?NHdORmIya3hJc3ZrdWZwaUZoVVAwb2ZnaE9nTTZpMHZXR1E0WmV5c2RsVFY3?=
 =?utf-8?B?MzVyekZObTlZT2NyRjRTa1BGOXg2OWxLNGlBblJWSFUyMTAzVFZ6dUxxbVZx?=
 =?utf-8?B?dW42T1ZzVWh6MXhWM2Y4QXlKeVdUYmkrUkJiWmdUc2xFMnBEbmgxUFpnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGVqWUpVQ3I3V2JpcERGQVJnM251MDFYVzcrY0lrbHBOQVRCRjRjNEloQkFF?=
 =?utf-8?B?U3lubDFSM056T0Z0NUVhMDJGdUwxQW8xZ1pzZUgvbWIvbmtlT3Zsa1NmYi9m?=
 =?utf-8?B?U2xtN2NtSDF6SFBBK0gyUUdWSFMyeVB2VzJtMTFxNVdFNFl2Qkl5TVVTejAr?=
 =?utf-8?B?N003Mko2OEE0b2h4UDRDYjA4SFBxRDM5SDI4d1h2VGl3eTdPTXFXektJMG44?=
 =?utf-8?B?TG9Pa21xb1BlZTZPd3VkQW1LblpGTDk0U2pPQWNoWEhFdHBxK3VOOUJzaW9F?=
 =?utf-8?B?QjVDVGZIUzlIL1ZpWmM2djFQcHY0NjhsT3k0azUyeHRMYTNRMUhKU3BtSG8w?=
 =?utf-8?B?eXpPbnV6dTVkaHJYNGtnNzZoVDErMmk4NEV5b3AvRVBzMm5PbzNNaXY4aTJO?=
 =?utf-8?B?Y1k5Vlp5UVI0WFptazFxTW5mV25veldwTFFVSCtqL3lzekxqQUZrdE84UjN5?=
 =?utf-8?B?ZDR2K3R0YkpVdkdoUDB0ZUhBY24reVpnVzZoY3hncUs0ZEpmL2dtTlAyenYw?=
 =?utf-8?B?QUozbXRDczBQN3FST3N1T0ZZZlRpV2ZqTWdXak85UlN4ejZGcDROSnJvT0pu?=
 =?utf-8?B?UmFzaEd3WTVMdWxVODV0aFhGbkMrTmhKUmM5cXNGd1UyTUFNVzBMQTN3ZzhX?=
 =?utf-8?B?bldFOHIzcnpEWGxXSkZhQk15ZHVFcjRJd0lyUUViS2tGMXNyRndxSUdMOVBQ?=
 =?utf-8?B?UFYvaDRwaTNpYWh0Nnp1cTVXRzlyWUlsanBWcHUyazdpZmV0dVU3OEJhMW9y?=
 =?utf-8?B?N1EvNisxekNXbkhyNXRsVVZHVVhzVkFSYkZUZHJoaXBadFlYdS9RcjJqb3BM?=
 =?utf-8?B?aHpLSHY4KzlGRGI0NFJUL21ieUxTS3BoK09lSDE0VHgrNE1TMHNyMFRGVlph?=
 =?utf-8?B?RWJpNUdyeXVpbDBXelZZL1ZoUitEazVnK24rRE1rZEllMTJib0lEN0NBNi8r?=
 =?utf-8?B?MEp5c2F6S2wrYTlkZEg4RGJUbWlhYWRGTE9MTU5xWlNsbmZNSnYvZGtWTUJJ?=
 =?utf-8?B?RGVNSU5BV2E1ZkNPZkljOURId0JBODZFWkQ4WWJmbEIrM2h3dUJzaUdnWlFp?=
 =?utf-8?B?N0h0SXVzZXFnZXFHdHRpNDVSekJaQjlDOXJPR0ozVmtJcVRRNlh0MWE2aUox?=
 =?utf-8?B?ZnRTT0pBMWFTYms5M0JEcHZOTUlWLzgrRThqVlhqTURTM2JwYlZrMEJqVGQ3?=
 =?utf-8?B?MGNRSE1TOHhPK2FTWitYcHBGU0N0WGFUQ21ST1JJSlE0aFI5QzdIcm9sZzJj?=
 =?utf-8?B?Z2lHY2JobEdPNjhrS05MbitaYkFCZ3ZBYkJvWkZtdTByem9haVlXQUFidkg0?=
 =?utf-8?B?ZmVmQ3g0QUNEY29qMFdhOVZYSU9qSEIxeDkwVkVjaThtMzR6R2VDSkN1enht?=
 =?utf-8?B?VUZ6YVlSSDk2cXVyOERuTE5uRW90VW1YeG5NanUyalRCdXlqMVF5U1BKNExP?=
 =?utf-8?B?WGxieml1VDJHUC84M2lhUm10amtqUm5QM2h3TFdiN3k5Yk5WcEJKcnUzT3Q0?=
 =?utf-8?B?a3pCblFXcEdqclhMYys1SkJyckx3SnlzbE1wdHRqT3VIRHVSZzEzdlAzS0da?=
 =?utf-8?B?dWVJTkRmalI1MDNGYkRBejZGWk04WFNkaDhHVFFzdGNjaVBzQU0ySy9aM1ps?=
 =?utf-8?B?c0g3Zk1BMThvV0lMT0FoNnRwN1RhMDdPa1h1NlJnUGJ6SXBVRjNGZGNtZVZq?=
 =?utf-8?B?dVVwempCRndweVQ0RlVacmNuUUIxTE92QmZjb2ZFb0EvSG9DbkFIbmd2Q0Vm?=
 =?utf-8?B?R1VmZENQQjFVclV6NEFGM3Raa1VWOGo1dDFnV0p2V0FpUHVnZkRJeXNRZDU5?=
 =?utf-8?B?R3UzTW9xMHV5d3V2KzE0NldzdUtnT08vdHh0b3NQS2VGMFY5dG5IOXcveUhH?=
 =?utf-8?B?Z0pxNzRJUlpqKy9aTzIzamlGamZpdnE5R2JrVlhWaTIxWVVVLzdQTGJiSmUz?=
 =?utf-8?B?ZWQ4di94c1NON0NJY2tTSEpveDZQeVlWK2pUa2p3ckU3YVpPdUJ0Q0hiTitM?=
 =?utf-8?B?VjIwMzkvNVdjYWgvaE5MNWxGV2gwV1NHbmJYcVNNWnM2bG1SV0h3QnNhd0t2?=
 =?utf-8?B?bjZtWHRvZnFFWU9VYy9BQnpiYVVNUFNkRFU2N0xFQlpWRzlNMVAwZmNmam9w?=
 =?utf-8?B?NEx6cGRsRzNVN0hVM0tpSWE3WG8xKzAyc1gvcldFSDJqZExBbHR0QUdEUWNI?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf527eee-ff4a-4e06-b014-08dc73e1a255
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 06:46:51.1206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/oAb1V3GhN+HrD3jczL4LWLRaFaQc1x5xkYj8jTts8tQa1DfcqntQB0f4OkiESztGJJdrBV4psd+FylygG8eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4821
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



On 14-05-2024 00:25, Rodrigo Vivi wrote:
> If display is enabled, the always-on components will always
> keeps runtime pm references, unless you put DPMS_OFF.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   tests/intel/xe_pm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 3f963bd9b..72d484163 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -780,7 +780,9 @@ igt_main
>   		igt_describe("Validate mmap memory mappings with system region,"
>   			     "when device along with parent bridge in d3");
>   		igt_subtest("d3-mmap-system") {
> +			dpms_on_off(device, DRM_MODE_DPMS_OFF);
>   			test_mmap(device, system_memory(device.fd_xe), 0);
> +			dpms_on_off(device, DRM_MODE_DPMS_ON);
Rahul, please consider this change for mocs tests you added recently in 
xe_pm.c.

Meanwhile this is
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal Nilawar
>   		}
>   
>   		igt_describe("Validate mmap memory mappings with vram region,"
