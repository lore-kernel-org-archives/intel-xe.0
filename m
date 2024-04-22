Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9F2C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 09:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB54910E714;
	Mon, 22 Apr 2024 09:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlbkA0xY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958D610E714
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713778716; x=1745314716;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MbkZooi7Jkjwelo9WI9/7omAEKAv/E5bCwGp06J+E7k=;
 b=JlbkA0xY1LVUlpOl2RB67NhTz7eqKSeuctcT8yCsZC90pPrV6hK5iu/a
 Ba2vMop2n31hploBUK0YW0gE2dzicvSfXCdACHgCkgNapqylN4sDlRXp7
 oe4uI/d0r59d+TYIfcEHH7dQXijIHUz6JAeP/3bJBZwh3t1/9f7zK6bSU
 BvuqMIfAz9mtPOYAZblZJvDMfuZXmmf0g4TD4re0E6OHTKkk9fzU8hgtb
 oA3Fkw68zxTYoBT/XfMDxtVJBOtCdahAS8hCNDHVAFAwKSPlJ79vjVNoT
 +XsKrWKJADDDGgnk3n0voUlKr4PrgnVgXiO59J/8mGXS7jSizNwsZ79gT g==;
X-CSE-ConnectionGUID: gNINypELSOqSMqhl+RvvaQ==
X-CSE-MsgGUID: RDS9vAVkQWWUeTVl1W0ABg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20709809"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20709809"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 02:38:35 -0700
X-CSE-ConnectionGUID: Jw/8JX56RoSlHwh8pjDABQ==
X-CSE-MsgGUID: MA6ES8ovTMi8yNUuSbwiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24002560"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 02:38:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 02:38:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 02:38:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 02:38:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fS/ywOv4girbqvpVmLV0iIfu5Pqp2+gh+ru6qyXGmHAJa8oU/HfSR5MEgkliOwLIqauBRvBpfic5uzG65ySpLrYvMPtIAVL748lZX3cY4baCRkLE8yauvMf/w1ZIyYEGzCNxkVduhnn5vID/A8WIEdcQDDceOqYJrasCy0F+6hSr3IxSYs46+THwpRwMfqNyDNC76jKmomkWECV5dlglSLttT0pJJkHQqkPu7xtSoyuZxuNaTbtfQtARN7HLzH8aidPmXgTq3PzVfXeiKRCL2hSDI7gyHw0/GSxnLXl27AjlRlGlcQ0m925lgTDLcD1MuiqIBseBUZctSuVSYL0J4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ9ozjbsGJHKSQrgziEpb+LRhuF1EKnAQh42tTzhdyU=;
 b=TBW27AwsChuk3osJIJwchPXpJ+7w+O7mngBBCAtywtFLR/qoEC3V4GTceDLB+f4ZPdasuRFpfHp5hZgOx8gCFGDUaMi3tG9gkJUHn4IdZmrGG75K7lnty6N6uB6P8g0w3ggcqDnBz5H+9QsTCoe5cvwPeQsLV7emYyG5NaX1MInKLRFnHo+fFwviHz9EKDMXeC6seDR2CA594K39yZqjkYC7q8KQQSb505IY9w8jnYRbQ9vnh1ErdLPpg/33zQXwt/ntK1roA4ArMNKuukxQCEYmxnSjXAzObuOupItcnn0P3u52TaF+SpcF+xGA8038zHVdQdBXHgdYAFI7xi4JKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB6419.namprd11.prod.outlook.com (2603:10b6:208:3a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 09:38:28 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 09:38:28 +0000
Date: Mon, 22 Apr 2024 11:38:26 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe: Add few more GT register definitions
Message-ID: <20240422093826.xrpq4jr3xiilspbz@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
 <20240418152802.182-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418152802.182-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 490b453c-5e9e-49ae-6eeb-08dc62aff71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTU1UnNyYTNUMEl6ZkFMVlRJSHQvc09PNkZXTk42cXFybWxuR0x5OXhZS3Jl?=
 =?utf-8?B?eG1OSzh4S3ZTL2lMSzdQUlgzV3l4VFoweU1YWFVMUnd4R21GYkYrcDZjaHQx?=
 =?utf-8?B?Rm40TS91aWpYRWllQjBVUmVuWUxocnc5QjhTSzVZMVo2QmJMMDZ2NnRyYncy?=
 =?utf-8?B?T3ZLSUc4SElXSXhORFdqeHFHa0YrczV6VzA0UGVYZWg4QkNMOTdsSWZISGtL?=
 =?utf-8?B?RlVIRDQ0cGYzaHZnT01HcTZkTy9FN3JrZWFYWUszRmsrdmRiUisxUGs1RmJ4?=
 =?utf-8?B?YXFXZnJyRXRMS05iOVdOUVBrSXROTUxlVll0YURUa1hNMXZINW8rMSt4bEdG?=
 =?utf-8?B?UzFwQU5wbjZ2Wk9qMlRmYm9WZ1ZNZlRYMVV1SEV1YnhOZFRkZWswc2R5OGVM?=
 =?utf-8?B?cFoxRXl2Zmp4THhhMjNUMjRXejE2WFhjWEUwZXk2R3pNekl2NEs4MmlCMW9Y?=
 =?utf-8?B?bFFGWEJYYnVrckVnRGk3YU9XbWJUTGhhMW1jZkkyWEhEWmNIMlFxSkpITllC?=
 =?utf-8?B?VVpsdlB6UldEdUJjR3pQaFNtdThtbVJISytHaXpIZzhBVnJNb25BcTI5Y2dv?=
 =?utf-8?B?WTVOMHd3SkZtdjJnQjAxTVArNnpHRFRzQ2JlS2NTYWhKWEcwc2VoTmpoWXF2?=
 =?utf-8?B?a2lxSDlOTCtjREFTTTRSaFQ4cUNOaitTQTNSSlpabDVCekJ5TmRoSGJoRWR1?=
 =?utf-8?B?dEhrcFNUNzJNaFJCQzBLbmdRb2Uza0x5blpVYUhzeEtGOWhXa3E2bmFJNkFR?=
 =?utf-8?B?OHpOc2JJSm45aXlZUTE1NU1EeG9iY1BhUkZtT3BNSjdtL3kzWnhPZVdkU1lo?=
 =?utf-8?B?SWkxYy9FdkIxOVloek1YaWtVcS9lUlczWklmQytNdlhTRTZhblNkWGhGQWZT?=
 =?utf-8?B?aE4rb256aE53YjBiMERiRmNNT2FaQnhhQWlsWk1BWU9hZWsvNnVub2ZqWGVj?=
 =?utf-8?B?cXAvaitlZm5Beld0ckpZcFBVMzFTSnhTdVFNcDAwQzIveHNMR0t5V08wWExH?=
 =?utf-8?B?N09MZ1c4UnBrbHdJOGdhQks3cy9yZkl6dnZhcnQyc1paZ1phUDNvYWV2Z1Zu?=
 =?utf-8?B?V2tJekZLRWx4Yno5N25sUU41bUU5dkRWTTVDWEg4cmFDbkFZUU5IY1AwNkFt?=
 =?utf-8?B?N2ZjeDlSUXJkNkdNejV2ajhGVkF1TzYyVHVqQkxZcjlTRW1oandiMDcvbGYv?=
 =?utf-8?B?Mkc2RmN5QnI5SVhLbEtnZGxZOUV2SjFqVVYvczIxYmtTQ3kxckhuWHl1UEQx?=
 =?utf-8?B?M2VwUFprTlJyVjN2OVpZQ29kQUQ3Q1Nkd0VWbXowNUp0ek9RWUhTOExaSXlZ?=
 =?utf-8?B?RWlxMzdTRlF0SjhyeW1EUHAyOEpwUGx6OUJiVldNSkhmSkhNMHE0YndPSStu?=
 =?utf-8?B?ZHRSZ2ZQSXg4S09McTl5WGpRVHVrZWs1ajhFK3JBR2g4KzFwN3pWaXllUlRW?=
 =?utf-8?B?dmx2YTBNdHAwSVZyeTVuNitoQkFLYXpNSm82SkF5YTRWVjNITkJaZ0paaFVZ?=
 =?utf-8?B?dTd3RkhnQWNhK0pvWStNZDhmNW5qMFMySzduWmxlb2Fqd0g4VDRKWjZ2SlNN?=
 =?utf-8?B?SjhOQlNsMDZTRXIyeGZzV2oxQjFhMmNIQ01Bb29LMFVxUFZaVUpLZGs1R2hh?=
 =?utf-8?B?SUxvZ3E0MkRVeDdKNVIxVlpqbm1GV2x5QXVYRWRGaW9IelZEQ0VOTS9Pa2xQ?=
 =?utf-8?B?Y2Z0SEhPdGQveHNja0xPbTlEQnZRNnhKYTZRQ0RpWjJZdnpCR1MvL2hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWpoTGdPQnMrc2NJREQra1hUNnBSdG9reEpqVXF5cGpMTTN1VU9uZ21RN0di?=
 =?utf-8?B?RDFxWkJXaVVsdlUxMnR2cFdFb210a1ZrcTFDMGFRK2FsRFdZK3ZKQXJZL2pk?=
 =?utf-8?B?dUl4UHJkN2ptdmxQZmN5cjQ3U1pxQ0dGTXk4dVBrdnE2RE5hdGI2R3hTQ2k2?=
 =?utf-8?B?R256NG9TN1hqdVBSR3JSNkxIcHB1VkZCVEtQMStGcHp2Rm5OSEgyNFVnOXFh?=
 =?utf-8?B?alhaUXFpekt0YjVnUlFuVGkyVDdoYWRGbGNYdEhpL0YySjZQY1Q1RjZTRjE5?=
 =?utf-8?B?TGgzK2FML0xpVE5NaHUxb3FlOUNJWkZtb21zWXNvY1pSQXFFRU9UNERtMGVH?=
 =?utf-8?B?S2pxQVFwbWZlbDM2Q2FVem5vTlJVZURsRmM3SWJKb0FvVFJCaUJPellpTlNi?=
 =?utf-8?B?V2YvN0F4Z3VkQkU3SkQ1Mm0xZElEQzVSOVdoR2liVnFuZ1pLU1VHMXJXcklH?=
 =?utf-8?B?eFkzQjExdHloODFMRGhrL2lTSWt4akhFNWZXRlpkbHJUWG9NbWVXL1VwUGR1?=
 =?utf-8?B?ZnNPbW5wYW9ScnE1MU5UUVBjVVlwS2oybnI5Y1VsYXQ1N1BaOG40ay9FbDJq?=
 =?utf-8?B?MTBQTjFrSy9zM1V0U0xiZ2ZRKzdVcHdGNktTMFBYTnd6TW9BazRNQkVBT0Fo?=
 =?utf-8?B?VlA3RkpSK3kydWdXbHJBZ1ZyWGk1ZDNlUmMybWltbE95YWRaaDVrWTNrajl2?=
 =?utf-8?B?Rk1MemxDS21QelkxVzduYVBTMy9Gb0M3VVV1UGFxbzgzbTZHem9DalVMaVZu?=
 =?utf-8?B?WmkyMkh0eXpnRFJzbHhSV1VxZlpON1RqOGxvZHRhVFlqbDZlZUlVMVhTYk5Z?=
 =?utf-8?B?OU9EVmpKa2pwOVp3eEhvSEVkQnFoK3lIZ0ZyMmVkdVJCNWNPcmZreEdzd2hK?=
 =?utf-8?B?bXhmRllxdjFoU2hIU3U3bmYvb3crc2xsQjJvazRyZ1BMcWE4U0RZNVJoVFhE?=
 =?utf-8?B?RktXMlpsVkxINnpURUNkL3QyVm9IL3dCMkRHQjZ3UjM3dEVQcVdxV3hkVXBw?=
 =?utf-8?B?NVl4OFVqYjN5MDg2cFYrUlJ6MFJMZm9JQklEMFBwZ0oxZHlBR1N0WXZRMzJq?=
 =?utf-8?B?bk9BWU9WVEdocTFaUUREM3hvUW5MYkwyMlNwc29vMkVhNHQwQTJFL3lacEh1?=
 =?utf-8?B?VW54WHJ4Q0F1NUI3Q2dxL1pERytlc0RBVWlIeGRWcG5jVnRPcEtCUUQzb1NU?=
 =?utf-8?B?TEJ5U1ZzN0NHMzVoN0s2QzRmMUxQOXlMd05BRU9LSE9TNGF5Tm5kZi9aUWlR?=
 =?utf-8?B?cHhXR3RtUGQ1bE5neGptdWc1Tmx5VitxUW5yOW84RktjOGtmQktXVUEyL3Jj?=
 =?utf-8?B?VS94QWJSem5IN0UvMG00OFVzakdnNG1MazBab0xDa3FDMGVkeXN0UlNsQ2Q3?=
 =?utf-8?B?TEhpRHpIZ1VMY01iSVdUa2E2QlQ2dmRRU2NNam9uMnNad2s4Qm5XNlI1OVQw?=
 =?utf-8?B?OFpVZ0dJdDFlcE4xbW5CTjBCR0F4MEdkNkVka1hrQ1Y5MVJDWTVvZjJRMUZy?=
 =?utf-8?B?OFZ0bmg2cDJBMkQrcDk3VG5lSkg0aVk3OXVSRXFaLzFlWGhsVWpmMExyckF2?=
 =?utf-8?B?cTRhTFhYVUN6cXBlaWE0c1hMVmFLam1YVzVVK2NHWE9VR2FBTmE2bzNiY0Va?=
 =?utf-8?B?R1hhNVNmcy8xRDhJcUs1NTA2bW0wV1hrcmN5ejh2VDVpOVk1TmZRVDhNbklx?=
 =?utf-8?B?b2xyWUR5ZkdiaWZMdWFnOStEa3JZWFdMekpCSXRhR2E4bmpRMXVWRTRwSmZR?=
 =?utf-8?B?UWpQNnZUTXZ1R29xR1Ezbm5zRFZhRXA1NGFIQjVsRCsvTFlYaDhsRi9lS0xU?=
 =?utf-8?B?dVB3UE5BbDJVZW1YeEswd2lHV0trd0dqRlhlN3ZNMWI4T2pDSm1RblFCeUl4?=
 =?utf-8?B?SDFqL1h5d1dxQmNwRGt2TlhSYVNmQU0rZHd1WTl2R0FDQUViRFBBZHlmUkJu?=
 =?utf-8?B?YkQ1aUNjS2lBUGNUYzZVMEtRUVNUTXJZSTBjQiswSDg1OE9EbVluaFRUVzkw?=
 =?utf-8?B?L1AwcVlSTDJNWUV1TEhIYTVHRmdPMTZReFAycnBrdTFTKzk3aGtyaXRoT0dX?=
 =?utf-8?B?SllLMHNMZVhuK0d6TlZWYzVMNWlLVVR6TEU3OWczNmZ3ZXhZT2ZTSUlnd3VZ?=
 =?utf-8?B?S0NHS0I4UHVra2M1NTRxTXJDTmVMRkFzcmZ0NTRTeWYwdVhxcXdPTmpiejdP?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 490b453c-5e9e-49ae-6eeb-08dc62aff71c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 09:38:28.5431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cP2AeBzeg1DkloKxhM+BT/DmQBxj7CXM0gur9Im5rClSYxBUFD/l4++iyxKU6PY2EhB9mKgALzUNZZPaTEb9h+cDkZ9XQXJoPD6S0OfB+UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6419
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-18 17:28:00 +0200]:
> While we are not using these registers right now, they are part
> of some runtime register lists that PF driver share with VFs on
> some legacy platforms that we might want to support as SDV.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 94445810ccc9..6eea7a459c68 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -173,8 +173,11 @@
>  #define   MAX_MSLICES				4
>  #define   MEML3_EN_MASK				REG_GENMASK(3, 0)
>  
> +#define MIRROR_FUSE1				XE_REG(0x911c)
> +
>  #define XELP_EU_ENABLE				XE_REG(0x9134)	/* "_DISABLE" on Xe_LP */
>  #define   XELP_EU_MASK				REG_GENMASK(7, 0)
> +#define XELP_GT_SLICE_ENABLE			XE_REG(0x9138)
>  #define XELP_GT_GEOMETRY_DSS_ENABLE		XE_REG(0x913c)
>  
>  #define GT_VEBOX_VDBOX_DISABLE			XE_REG(0x9140)


Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.43.0
> 

-- 
