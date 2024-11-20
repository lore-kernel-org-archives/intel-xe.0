Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48BCD6E2B4
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 05:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE9710E0DF;
	Wed, 20 Nov 2024 05:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MP3T1IqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51ED610E0DF
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 05:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732078816; x=1763614816;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ql5RvBEkwl//OUpAj/J2HIDl7AID6aCSgWoYFhJDOdY=;
 b=MP3T1IqBVWotUSxCafS+jspSlTq8R9uK0ARBHExhza+/1ikJWpZbujzT
 pyze78n1SJutbNJbrsma28wQoQNwul81J0euSQdDSiGIs2gnZqNjxTEn7
 bRRUM/FCd9KxDFDSXXHFt2XMZQ/b1o/FNIaMzebU9bYDzO3lBon+Lwrhw
 oYnGick+u66ay39GFFxWjkmQs4gH9NezF0f9LuVFipOjeBO2Ma3zimvJM
 1WNBgbbi72x5ODbdzr89vrwwbpfaarqStO/0fDxenlbG3gCSOiU9PKpzS
 FzCm54KkWxW4w0y+IeMSJHajDBJfqFSxVeRFQaOg1Je8JIrty6TMEr7+R A==;
X-CSE-ConnectionGUID: q3RPaWiGRAaK01w0boqDMg==
X-CSE-MsgGUID: qKQQ9ljbTKW7lmkjEHFuSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49546150"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="49546150"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 21:00:16 -0800
X-CSE-ConnectionGUID: E1kbjvcySQevzYs/D7c5nQ==
X-CSE-MsgGUID: MjfCDGOqS56dotMDQ4sRLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="90171885"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 21:00:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 21:00:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 21:00:15 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 21:00:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TO+IQVGCGH8MgpNZsJfe/JOKQ5UCtMgR+L3Bv+jGMBTA7kqreCX/N1+BrPjXXcxp+I7CatgLQoDkbpa3b92isbomL7swiaBk0FLEKraWvc8VKGBemK9zSFkvlWjqG/2rp+kNqy0k/7Zd73plt64MR01qJwunhOBXVU1QWAohmUtuDeAbzREX217M0yQqb92nN9Y5y9PGN7GzyGaZ5a9qDJNGxKxUrEbn0DIPgqZwTiScw3KAinmSbh+7su5fswy45DPWZV/SmdWERHcka6FUEGBow5glnINl4Z51ZpzvjbFvXwU8540R9kfM7p8XolXh8D+ue2XEDAH4Ds55KNf1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIKD9j405v/BtLmJB0NxaB2jWybsLjnRjtp6eDoO7lo=;
 b=Nlbi+x+TBFuRScCujnAKp19Dzv7meO1ddAHa9RvtZVoqSngnQqR3oTxV1XAZ6cr+RFU9SbMvzx1i3zgD3j5vlCjDkB5ftmvCraOtj5SJQa/PkmfAaGUZgHM0/ln/p2IF92HadOvLFK3SLXjfgTJ7Fxd/Gmk1tih50W3feECIuVp97q6UMTxosQayG4khZkt45RLSV9K7iqi/OZyK2n/Xxz8E0sctmdrfaqZJQ8XhDYhnwFd8w56MemWKv/FDT3N3RN6zK6mvVJ4KJwIf8bahPwN4iVWdkU61IdMJuGbBf7oj6PL1MuuuxI0W/0ElrEANE+EKITiE50DV70Wenyc2Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 05:00:12 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 05:00:12 +0000
Date: Tue, 19 Nov 2024 20:59:57 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <jose.souza@intel.com>,
 <matias.a.cabral@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <shubham.kumar@intel.com>, <matthew.d.roper@intel.com>,
 <matthew.olson@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v5 2/7] drm/xe/eustall: Introduce API for EU stall sampling
Message-ID: <Zz1szeXBrZfqzQKg@intel.com>
References: <cover.1731919693.git.harish.chegondi@intel.com>
 <12a7988ff01a7b32a9705abd121f0b20a551673b.1731919693.git.harish.chegondi@intel.com>
 <85zflwwer2.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <85zflwwer2.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0313.namprd03.prod.outlook.com
 (2603:10b6:303:dd::18) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA1PR11MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: d5248ad5-4147-4b49-3389-08dd092036d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SElwKzdVYW5kSk03SXFPdlVvUXpzL0JjU3NMMm51VERNcU13ZWZkbGxtSnNa?=
 =?utf-8?B?Q3BNVytzNUtzbFN6TkRaWjh6aXZaSE53dVV5SFpnNTd4enM3VnU2SVFlSkto?=
 =?utf-8?B?QnJDaThqYVp1MHpoaXV2TjNLclVMTGpEZFdMQVdYN0hiNkFIK1VJd29wb0pp?=
 =?utf-8?B?dThwV3B0TUFSS0JEUWhMRGw3azd4b2k0SE01MWpPNUt5TUpFYkErMjc5M1Vh?=
 =?utf-8?B?L1REUHRnTkdMU1UwL0ZhNE1oaVJPejRQVkV2cUlnODBWaFNOZElHejlNTWNG?=
 =?utf-8?B?U3FIbmo5ak5mS3dvVjd1d3BtK1BUaDhUZFpWbE9vREJVc3Z5U0d1M2ZmSmRY?=
 =?utf-8?B?cHl1NEdUQTl3b0wwOWZOdCs3bDAra0RvbjV0cmNjTGJBWEZRRG1hTG1DNysr?=
 =?utf-8?B?T3NnWTRTTkF6Q0RURW4yQXpxczlORUVETWJremgrdDFpcDBUVEJWZVJ3UVdo?=
 =?utf-8?B?dEkzbUxHa3BFNXpYSVdIdjlva3VlczVIUUNuU2lydWxzZ2FzNHArdElrQmZq?=
 =?utf-8?B?S1JuSStGTkFRR1J4cXpNaDJFM3JSRjJVajlKcVg5bDBPNTlhdVlmWHNCWnhj?=
 =?utf-8?B?RDcxWTFnSGZEYnF3SVhhS1lnWmpSbUFsTFRiT01CcmVpa1B6WjdIWjFxNEE5?=
 =?utf-8?B?bDMzV1owV2Nya2tDbkJJR3NWK1BVOWQ0SWdUbDA5Q3V5SkUrKytNTzNhQUpt?=
 =?utf-8?B?UGlrQ0JiK2ZTeGhzUkZjWHdodnVBdlJ6OG9wWWV6VGpSR1NWSk1Ec1p2Vk1B?=
 =?utf-8?B?bEtwcFV2RjVPOHR0dUVLOEtrVDRNY2sxcEoyc0pmUFZVRnByVGdJNUtWbUwv?=
 =?utf-8?B?a08ycEF1ckxqV2RadUs4bHhWSUZTdHNZeFlXeFA0YXpZN0djNSt5M1pJNGh6?=
 =?utf-8?B?eXU0UjF0RExRWkdURE4yeS9pd2lKSWZYWUtmZmt6dWNXb0I1T0YrNERBY2pT?=
 =?utf-8?B?bm1QOWhDdG9TMUNISnBGalEvZGhhSzMrNjVqNGc5bzFQT2RTS2Y1bnhQdzFY?=
 =?utf-8?B?UEpDWDdRNHNoZGE2VzVuMHRlRVFWdldDdG5LaHgwTm52OEtLM2pIWG1BOTlT?=
 =?utf-8?B?YlIyTStKeG01QjdJbzc0SmV3d29iMDhTdmhEODdmM2QyYWhzRFVMWm5HcTVL?=
 =?utf-8?B?bUZFSnJCeUJEcEpEc1hlOG1YM1I5UUdkYkI0eUo0c1phVGNROGo1NUpKOHFN?=
 =?utf-8?B?dll0cUVOSkZMVmdRdVY3eklSQmNMZ0h6cTRMS0VzZDJBVktHWG5HWmVWNlZN?=
 =?utf-8?B?WEZGZjRsYmdPMDJ1Ti9mdDhNNzZ5MWVRSVR0TithU08xVkxrM3FKQWcyRTZx?=
 =?utf-8?B?NDFUK3dVQ2hPdktLUkZxMnpjU1pvUlk5NldsbXJMVEszcUFDTmZJdEtmc0Yr?=
 =?utf-8?B?QisvdEZEL3dDTVNDbzMxNE80Y1pySlU2WTZuTjlaUFVsZjBsMWF0ZEwxTCtI?=
 =?utf-8?B?MTlmT1VnYUU1WnRBamxQVGNjaVVLWXJ5ajY2UE5rbVlDTmdpV2QvV3VNVFhu?=
 =?utf-8?B?c2xYZE9DMVpyWUJ4UXVzZjhDOElhM0RVNEU3S3NGSnhnVzZENWszbGpMbVBX?=
 =?utf-8?B?d2JFVWlOTTRBZkcyaGJpaTBscFVlSkxjbnR4MlgxVis2cjVLNlYrMkRVWFNC?=
 =?utf-8?B?dXJVd2VxOHJEcURLLzRiSzh5SW03VUdDbE5VMUViR2IyMjc1cjRNZ2h2RnlG?=
 =?utf-8?B?QTV3ck5FNjVZR3pBVDJpVFpWVncrWjlXMmNTckhBazgwRVRwbnFHanR3UDNC?=
 =?utf-8?Q?bBFFkcpmKZqO/DBdr8h3AeM8ECt7QBvFUqJK0sQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzFOeVNISUhHaitCVG1oNXdjQ242dG16Uk5sK2RzRGMyWGJTWXVqU3RvU1U5?=
 =?utf-8?B?YUZwcXBPN0FDVGZUT2JSOWtkWlQ3dEloNUg4OHdWVkVwelR6UUN5RmdoSWRj?=
 =?utf-8?B?aGxDcjNmeDBiTlltVGNkSjFDR2Vmc0dvMzg2TmRuanhYZktFZGdCdzhCODRT?=
 =?utf-8?B?eXJOd0xlVzkrU1FaZW9DRjI0V2RUdEV6bkRjMEFjRklaZ1Nza1JHUnEzYzVY?=
 =?utf-8?B?WE51L2lZWTd0cG9CMURESzA5d29jWGlhWERiRzRkb2hYdnZrc3daQzVaOXFa?=
 =?utf-8?B?K1VDbzl1OWFOVmJteDFTMGFlSDRjNHVDYzI3czhxdFlNa0N4UW9TWE50UTcw?=
 =?utf-8?B?KzRkMGxHNDhrK1dScVRsdFJIcTVBS2RnUjkrTFlGSTNQZWcrRkpIbDRtb3Jn?=
 =?utf-8?B?TmpDMWcxNWliSUxIc3Zmek96Qi9TRzAzUG1SMzJlZTB2eitEdFNGeWRscFo0?=
 =?utf-8?B?YXhvSDdLRUxFMzA1QUp4V0JKQXhmSDkvOEJBZU1lZjI1M3ZXS1lERXdTL1Js?=
 =?utf-8?B?ZGlTempsT09SQmFzL3k0OE9nVTJHaVh4M2hqdGVFbjc0TFNockJvd2dwS3dY?=
 =?utf-8?B?Qy9oVUdxdFpZbXkwZk43QXNUb1NLRXdCdkdBRER2UHpITDBLTVhreFRoUUpr?=
 =?utf-8?B?MlpkeDUvNlROS2NhU0hpb3dicVd0SFBVaTdhamRDWWdsZDNvNnNDTVJZTU9s?=
 =?utf-8?B?MVFWbDRsTUZ4UXFsaS8rTFhCUnBkT0VsR2FCZmhSNXVQNVRZUzVrbXhSU2RT?=
 =?utf-8?B?OENaQmg4Sjc0Ylp3QW9LVkdtNkNYNkxPQ0l3SHBVTmMxNlJUUmlna1docXk1?=
 =?utf-8?B?ZmVuL0s1cjZkNTRvY1poMThMdVg3L1h2dUFNQ2h5ZE5vTktuay9CRENQeUZ0?=
 =?utf-8?B?eEh1TDl5SmQra3pNN2doaFU1aTBXZDZrMW1tTXJqRktFTU1PUmlRTjlBeUtI?=
 =?utf-8?B?UlJKckdRLzZUVDQ1K1V1MW9GSUdSUStRRWVMU05IbTRHY3NONGN1aGhkbGpL?=
 =?utf-8?B?Szhxb3lvWi9TWGtCMjRTQWFhNC9LY2dYRlBjQ0l4M3pIaEZhMVJTcE4rUS9l?=
 =?utf-8?B?MkExS3ltQzEwWWhBK29GRUM5ak1hTkY5T2hzR3VHUkRVOVZBU3pHVll0cDJW?=
 =?utf-8?B?NytFUkhUSUhIbUdqaFVLd1U4MVo0dzlnckQzQ2pyY01QN05kNVRLTXgxL3pC?=
 =?utf-8?B?K3FJUmdQOWdYbEdNVm51ZDN6ZTR2QXYzaGk4UUlRUUpiRE9vWXhpUU1iMVpG?=
 =?utf-8?B?TEJKSUhqTXJaL2g2WVJnK0orT1ZzQlRPbms0bUIwWmEzaGY2OHp2czZRUFdW?=
 =?utf-8?B?VFlDUS9zV2l5L2pGRlQyN01RMWlkSkFtS3hPenlIa21qSlR0VVM2OTgxL0t5?=
 =?utf-8?B?MWNuWVJ6aUhnTFErblYxWmJSL0tLVURFaitxREdMV29KU3ZmTnFiR0NXZXpB?=
 =?utf-8?B?ak5nbFozb2RJbFozNnpzZlFGVXlhR3JxUUZqZGVTUVhxVlQ3KzFhRDFoeDlM?=
 =?utf-8?B?cHNjNys3MjNxeTJmZUFObGhPNjBYZUlVMXRPcURHWm1aNk9WNEVWVWtvSm1z?=
 =?utf-8?B?N1lHS0hhc0sremVPVUlNaVdvOFNFcVh2MnlRYm5GaWFGdXJWYlpPOXVsTy9R?=
 =?utf-8?B?SUIvajB2dGxtbnZncjBnLzJqY2YvSE1QdnpxV21xU1NUMnkxMlg2Zkp4NWoz?=
 =?utf-8?B?QTlGMThId01QSW42VXBjQkpRK0djWmJPemxWZXI4NnY3STZyUFBKNlhoZXBk?=
 =?utf-8?B?UDJkdW5wS1BFelRKSlRJVExkSGNyclFweURId3l2cUw1ekZIS1Q5NmpNUkZM?=
 =?utf-8?B?YlNCUE1UQkUxczJkKzl1bVRGTEZkSGd0TUNEWTE5ZHpsSm05ZkEvMFRBUFhu?=
 =?utf-8?B?NnFFNkVFbkhhYmZzNVdaRnh2bnZZVjhocmtWeXlHS1dBcGl1WjdkSDFSSWtS?=
 =?utf-8?B?MXFTSkRJL3ZDazF3cktWdnlIczlKelFpR0pRL01UVFhvN2ZwZ0RHQVB5WGVS?=
 =?utf-8?B?ZWFmc0tPeVd4TjFIelBlSHAxRk0xTGNhOVVRT0tyeVowM1ZldFFUeTY4ZEpE?=
 =?utf-8?B?dFlyV1IyR3pVNnlyalEzdk1PWit3TlAyejBUZ2tDMWtMcUdJTGdxNFcrMGhJ?=
 =?utf-8?B?Nk1XallFOUNoUTIvOFh6d1JIS1lsVG5TVys2Si9PeEVwS0xlTytPYlV1cXUy?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5248ad5-4147-4b49-3389-08dd092036d0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 05:00:12.1090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFWdBz6EFkN33reYWg6yJZRxUDlfVX7oeT4CZNjiOURyXWNG0aC/W+meMSzD86mZ2FXbs2z5oIeS5R2SyWbmcRYXG9ZDJNYLbGw0sU7P2rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
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

On Mon, Nov 18, 2024 at 10:58:25AM -0800, Dixit, Ashutosh wrote:
> On Mon, 18 Nov 2024 01:07:14 -0800, Harish Chegondi wrote:
> 
Hi Ashutosh,
> Hi Harish,
> 
> Once again reviewing only the uapi for now.
> 
> The patch title should contain uapi in it, so drm/xe/uapi, or
> drm/xe/eustall/uapi.
Will change the title in the next version of the patch series.
> 
> Also, you are not recording version log for the patches. That needs to be
> added too.
I have been documenting the changes in the cover letter. In the next
patch series, I will move the change log to the individual patches.
> 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 4a8a4a63e99c..80aaa5b50c8a 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1397,6 +1397,8 @@ struct drm_xe_wait_user_fence {
> >  enum drm_xe_observation_type {
> >	/** @DRM_XE_OBSERVATION_TYPE_OA: OA observation stream type */
> >	DRM_XE_OBSERVATION_TYPE_OA,
> > +	/** @DRM_XE_OBSERVATION_TYPE_EU_STALL: EU stall sampling observation stream type */
> > +	DRM_XE_OBSERVATION_TYPE_EU_STALL,
> >  };
> >
> >  /**
> > @@ -1713,6 +1715,43 @@ struct drm_xe_oa_stream_info {
> >	__u64 reserved[3];
> >  };
> >
> > +/**
> > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
> > + *
> > + * These properties are passed to the driver at open as a chain of
> > + * @drm_xe_ext_set_property structures with @property set to these
> > + * properties' enums and @value set to the corresponding values of these
> > + * properties. @drm_xe_user_extension base.name should be set to
> > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > + *
> > + * With the file descriptor obtained from open, user space must enable
> > + * the EU stall stream fd with @DRM_XE_OBSERVATION_IOCTL_ENABLE before
> > + * calling read.
> 
> Good to add this. Maybe also add "EIO return from read() indicates buffer
> overflow" since EIO return is part of uapi.
Can I add a comment block on EU stall sampling above the comment block
for this structure? While it is important to document read() returning
-EIO for buffer overflow, I am wondering if this is the correct place to
add the comment since it is unrelated to the below structure?
> 
> > + */
> > +enum drm_xe_eu_stall_property_id {
> > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > +	 * in multiples of 251 cycles. Valid values are 1 to 7.
> > +	 * If the value is 1, sampling interval is 251 cycles.
> > +	 * If the value is 7, sampling interval is 7 x 251 cycles.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE = 1,
> 
> There is an unaddressed comment from Umesh about this (on the previous
> version), we need to address it.
I am still working on the comment from Umesh and seeking feedback from
others including the user space folks. I think having this input as it
is in terms of cycles is more generic and more future proof as the clock
frequency can vary from GPU to GPU and even for a GPU it can vary from
time to time due to performance and power reasons? 
> 
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
> > +	 * EU stall data rows to be present in the kernel buffer for
> > +	 * poll() to set POLLIN (data present).
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> > +
> > +	/**
> > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
> > +	 * EU stall data will be captured.
> > +	 */
> > +	DRM_XE_EU_STALL_PROP_GT_ID,
> 
> Maybe a nit, but I would make this the first property.
> 
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
> > --
> > 2.45.1
> >
> 
> Thanks.
> --
> Ashutosh


Thank You
Harish.
