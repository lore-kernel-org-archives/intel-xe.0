Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F000FCCD18E
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 08:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEC010E100;
	Tue, 14 Oct 2025 08:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfTrQcNC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039D110E58A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 08:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760431007; x=1791967007;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xcwvUnS+PkVdlqmVQP0zutNM9HBC4+RdvSvJZuPOPR4=;
 b=YfTrQcNCTErhM+lF+dsWADcsiHiNrEe4y8178uwUna4ijGTReO84OJI2
 CjUUOnyMPyeXNW8tzpJ18WzNQbN0+6zmE208Hw9q1OpNb73q4X8qV43Sk
 peK0w49pWBALSr99BMygG41FDb+2545jITpuCEtTUaed79WPMgoc5bd5B
 PJdfJAhnAOA+qZjjL2rECRt7nARqbRNlNBDaljLSipty2Scpn1A/T+e+M
 dOHQm8FdL51p+cSiYtuUntJ4MeXSn2+feNv8DH0pPw2+Z+S+uTc0ZNVbx
 yC5qaZWPpcTmaQSD5PMudd4yAi9oSEp1oRCm9BQ4fzzqRRzgePXKt8hn/ w==;
X-CSE-ConnectionGUID: hZjoRtekSs6G9mBScmpAHQ==
X-CSE-MsgGUID: fd1yXYiSRnanU0nfiKaX5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="66438523"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="66438523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:36:46 -0700
X-CSE-ConnectionGUID: aZvhmIc0RCuxu1AZWUez9A==
X-CSE-MsgGUID: 9t6NWnBlQqCUeJol4B/Heg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="186080777"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:36:46 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:36:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 01:36:45 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:36:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+x0PQjqUED+t3LPvJtKzRM9s9s5uz1soVmxW7SRlwLpYq6U1nU1R1QtYmbds1QZ0F6JDGBoHeuHD7ZqphZvF5LtRh7oVB8ZrQ3LPPk/rPPB4/IL/+l1B6Fu8p73wVK7KKz8Sa76sP5M1iCz1wHTWiI05YJdU+XGJs3MYcs2QrLhLp/C1V/wqKVe+L/POZKjOdV6xW5Pb1+VxOrXJY8V15mVYMZ35XN1gaq8GGdfYNUnSZGB7FSlIG6lAMYRVfoxVv0jQA83Ru5zWlPa7j9NyjToygVXZW9S9Z9SuuAQid2Do1w9r2P03WEqV0C5dI8hGWm/EjjtF6ehiJ4eVYcULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyKOLUnBIVAqCygv8vg7SyaeLTrKLP1wzofdi8V+Kos=;
 b=TLpaWwyV5SmBI2CGPBEkHi0c/VPB559gJEda+BRLb+NJUEYDUrvVCnyYALB8bIZJ2fZg9zuxhT63NtE4NjtQBXiV62i9UKUaD/ex3yQG5k9O8WhY5H+bOPjYcvrRXgUby1FU8GJCfNYsQpyNiPJ+bdSVBYhB3suWuLs0c5vcxJdMor88OideqgvuDLw5SVdljDxDn3eNTUbAgQd39fwweRi5T/UdUdO+OVzMKfNSlTATfy7BPf2Zgfu0HRIstSWLqV4sSzje9EM2QOCOMuiKMjrvByVG5s/n5MkO34A1azepAd54mhMSNAXz5/enkpzNdsjUcVqKu160Yjb7dVHLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by CY8PR11MB7136.namprd11.prod.outlook.com
 (2603:10b6:930:60::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 08:36:43 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 08:36:43 +0000
Message-ID: <38422801-586a-49ff-b6f9-1f22ba3f5430@intel.com>
Date: Tue, 14 Oct 2025 14:06:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/uapi: Hide the madvise autoreset behind a
 VM_BIND flag
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, "Falkowski, John"
 <john.falkowski@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>
References: <20251014082756.6858-1-thomas.hellstrom@linux.intel.com>
 <20251014082756.6858-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251014082756.6858-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: c8799f29-c3c4-4785-6bbf-08de0afccd92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2ExNzVIUE1xU2JhWGMwdFY1MjBqU1AzN2Q0MUFrUlY3WklUbDZ2bUIvN0tI?=
 =?utf-8?B?Sm5YaFlCdGlvN0xTZTRTNUN4U1VObGVNejJVbFRSYkRoVUJHbStlUCt0cUx6?=
 =?utf-8?B?MlNETUZiWVNIOFI4R1dTSVg5NGFUdmt2YWkvRUtVY1l2YVdqTUx4ZnNIblc0?=
 =?utf-8?B?THRlN2h5QnpHeGZlekV6VlJ2c0xNS3hUc0NaQ3pMQ2YxYTFYSGlEZDNPKzFa?=
 =?utf-8?B?UmtQL1NzeTNaajg5MjVHT2ZtOUlGRDNMYVRwYzJ3aUtKZ3pCZFZLT05EZENP?=
 =?utf-8?B?V2lOS3Z0QmhONzRqNnRUU0VvSEVyZ3FyQ0lra0IwWjFSNnhmam56c3ZycENT?=
 =?utf-8?B?aklCQWZXWjJpb211eFVvQk01NzBMbXZzTFlNdmNWVm5HRjZuKzN5cnIzajZO?=
 =?utf-8?B?b1JBalFOYUdlM3NrWlV1bGxIcXJjWi9uc2p3cHZ3cWk4Zlk2OThCTkNGN3Vj?=
 =?utf-8?B?YktPVDkzWWZUcnB2Smp5SHA1TTdQaytrTEJZQkpZMUF3b0FTY1BSVHAvWUJ5?=
 =?utf-8?B?Sm80TUIyLytiazdzalZsRnBnNjAxN1pPb1krTlQ1OTVCY3pXMkpLWDArL29s?=
 =?utf-8?B?cm1SK1hrZ0NvU3J0bE1jMnNQcEQ2RVFzT2FKeXhRejVidDM3NWZ3L0N3cEIr?=
 =?utf-8?B?cEVwSWJrWEZCMW00OXZFM1ZncW5DQ2xBZ1p0OWpmWUh1SllRR3RWelZMUjVC?=
 =?utf-8?B?VXhwcUZCYkUyaWhSR1lLdU42dWNwVU5hTXBMTkRvdk0vaGdkSGRoRWl0WXpa?=
 =?utf-8?B?MEJMeityZ3pVM3lsL2dvUkltQTA0UGxSRTdNa0MzYTJXWWRET2g4N0lEMUNm?=
 =?utf-8?B?cVp2UVdvNHFOdU9XWS9vaTRFMmRpL1p5bC9maGVKclBocEFDck4yZFVJOEtm?=
 =?utf-8?B?VURUUUV4dFZwbHNldnJ5c2ZyNnllNk5vc29PNitqMXdlaDdIakVjVDNId09R?=
 =?utf-8?B?N2xaM3BUNFUxOStibHc4dlRrN0pRM08yWHZ6N1dlcjhvejVUakpFZ0NFWW9M?=
 =?utf-8?B?NTlTeU1ySWZ6K1hlYUg2d0g5YUJKRFBudHhGMGR3cHZqT0JOVlkyNVJBSWZw?=
 =?utf-8?B?WU5kRTdKdW9Ccy9hR0NDekRQTjlzR3dUTUJ2TEk4Tmh0MTY2UUhzcnpIQkVr?=
 =?utf-8?B?bUo3emc3bXlXNWlPMExzQXVUSVBrUHBYMXlSalVGbno4MzlCZXZmWDlIWm9r?=
 =?utf-8?B?MUZvc1h2cjJGRHdoZGtUS2RhRUJ4djh5bEd5UUJXYkFlTVNaY0NMaTh3WmlB?=
 =?utf-8?B?bG5UUnhUMzZwenRYSUdHSkhNclRCRldkSWxwK0JqTGtJVTdKRTJWZWtQdHFj?=
 =?utf-8?B?Szg2TktDUHlPUUdsQ0FkajBSUEh5V3NHZkxHcFptc254Zjd2RFBxdHpWYUd4?=
 =?utf-8?B?dStGOFZmZzRwenRRbmZzOWVobXRPazA5bkc4TE9rMXpuaXpFckx5ZzBNTXcy?=
 =?utf-8?B?TVVHTS9remlLMTJxZ0NXUm00Wi9jWUxDY1NXa3MwdUh4eGhxc0IvN0JtN1Bn?=
 =?utf-8?B?dGpMdlF3dlFCNlpqbVR3ckFjcytLbmdSb05tNzNXWGxTaFUxQWRYbWM3N2Zn?=
 =?utf-8?B?WGtHTlpERWpVQkdjK1B3b1VSU1RJRVNoSEluaTI4UDBZZEYrU0picDQyWGFE?=
 =?utf-8?B?dUVmVzUydUp3L0hmbzRDUjBqY2NwQWlIU2hWbTlQVXUyYm1mdmZGbllpYVNG?=
 =?utf-8?B?ZjFPWlhraUhWcVZPOERVTlJYdlhHRlJPS0RpRHpoUnBTWEFSTnZlVDRZbEhD?=
 =?utf-8?B?RU5JdmdGRGxjL3dpMjZ2SGpqNDJqK1FGQkp3Qk1uRDB6cDVkN05LbEhrckdD?=
 =?utf-8?B?NjZmUktaZDEyZUhPaHMrRUlSZlhlL3FycjhXSFR2bEZOQ2RBZ0tvZWVvR1Yy?=
 =?utf-8?B?RFJRbFhTQlM0cWNzZ1VWdTVYakFreGpFdExzTzVVQzJkVTlXQXU4cm4yQVhM?=
 =?utf-8?Q?JlUWoU5ueSIOfideIlp5dIfSSzkCFKvw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnhEdXdyRHlRMGo2T3prSWlFL05WUzJkbmU1dEpqQmVlQ1lEdytMMFhqVko0?=
 =?utf-8?B?VGlDWVM5MUxDTERCcHo4MHQ1NkNIcDZQRFNIbkp3SlZ6bUNrNDk4dnl4Qk1y?=
 =?utf-8?B?eVFFRkNlZlBHMThMUmtRVEpqSGRRL3puRThPaTBRV0pMemJ0SzNCcW51Q1JN?=
 =?utf-8?B?VEtWaHpyNndOa1dsNmNsK1hzYkhXQkZSdHo2UC9UOWluTUIrR2FRTEI0NldI?=
 =?utf-8?B?MWEwYmZHQnJIZnQ2eFM1emxhNm9MbFIxQzdIQXJ6K0RmUnBhMUE3QzV2NjJs?=
 =?utf-8?B?R3E3YTVLUGxCRlpEYTltVlNBRmRIY1N5M01mTzdYVmMzWml2dCtDSkhmUWZa?=
 =?utf-8?B?VkpsR1J2cmVQTWtHN0JqL2NvcWxIRmZNa0hEYXFUOVE2aFRlM0F5ejZST0hy?=
 =?utf-8?B?TDVDOWVVK2srdWxNTklHaVJLbSszSHBmRWZQWFBaVklRSUZ5ZlhNcTRoU1Zs?=
 =?utf-8?B?SW5YSDg2b1FLamJvTmN6b0owa2Zsbm5tTGtSb2o2dVIwUnNhbWRVUXhQdWM5?=
 =?utf-8?B?SHNTT0VEdDdlWVVRQjN6cjIwWHRlMlQzcXFrbHNHcndTMm8yMzVJeTNGd3Fh?=
 =?utf-8?B?UWtBd0ZVQ3kzZXRoY29Zb1VrSWlteThjRVlpbDh6bS83eTBDc0NqUnhGaDR6?=
 =?utf-8?B?UkZXVUV2bFJoVFExb2V0aWh4WWVDYk9haWZNRU9MM1dkVXJiUloxNUxtcm04?=
 =?utf-8?B?NjF0ZDZMTXpQN2Fpc3puYldmZVlEa1FXT08wS3lHN0IrVDZTb1VTdXdJWVgz?=
 =?utf-8?B?dFZqenJDdnFWVUdlYmtxMEV5SVBNZHpDMmpwM1RoaUFMZEd2bStiYll4YkxY?=
 =?utf-8?B?b3EzRllrV2hwazB6RWF1NUtuRjlTeFBSY1BUb2Q5QVpxcHhkRk1CclU1elJa?=
 =?utf-8?B?WndFZldiL1hLeEdPd1ZIZEZXZHdzbHhOTDNJYTFkVGJBbmV1NUx2V05VMDll?=
 =?utf-8?B?aDR1Mm9zbTFTZ2tSQzBOdVRoK1YxVjZCRnJBLzN2TmFVTlMxQVVDbzJLd0M2?=
 =?utf-8?B?dEM2Syt4S3QrdDB1TFQ0b3lYTk9qZ2xtdHhlN3B6MFlpV1JUQ0RNNExONTBR?=
 =?utf-8?B?eGNXaTQrU0MrTElBblVqYSs5eFdrWTlyeklWQWtPWWpSOVpmNEtRaHl6UkJO?=
 =?utf-8?B?SDFYRG9CbVZuMVE1dExCa0JINjdoMXA1eXZZdTZRODN6ekpCQUxVNmlpbWZL?=
 =?utf-8?B?NVd3OTdSakVvVy9QTTVZd1o2MjhDMnNzMDZmNjZpNHRhUEp6ZTZsSXBHcklC?=
 =?utf-8?B?S0h0MU1YSzZDT2t6K3BtLzNsQlU0bjdHelVXd2dPaXFZVWVFMFg2THNTdE5p?=
 =?utf-8?B?OG5MWlZnK0JoS3RnV29yUWN6eGZ0aW1PanczYStoVFhQVGVKUmtWTEF1Uzdy?=
 =?utf-8?B?blI5WXZvcnBIMWFYSjd3YnovakphOVRISlczbFdsemtON1NjZ2pqVnFaRHRy?=
 =?utf-8?B?dS92bmtmNjg2cm0wR3JsejJDNlZOdS93YmNNTzJ5OU9mK3RpbTd4NGU1ckFz?=
 =?utf-8?B?YUNGeE8wQ3pBaHh6NTBWTmRNaGFHejlUQndXODQ5ZnRXTE5zaFVOVHJrYTdw?=
 =?utf-8?B?eU9BejNhMHdENVhEcWxCSEJlTlhsSjlQa0hZOU0ybEZiNjFBRkFUQ1dWTUFp?=
 =?utf-8?B?SzNxbGVhdUdRVWNORm9aTTYxbmpiOWVEZGZoa0VVNW9kQkM5MVZ5VHowZXpq?=
 =?utf-8?B?T0lGSkdzb0VoZVJnTE11RDI0QUEwV2JGY01uOHphczh1S1VCSENiMG9TLzM4?=
 =?utf-8?B?bFhNbVRnY1oyaXNiUlRjZDBnQ0xjZnBTOXJEZllSNGs5MGVwTHNGT1Q1SjRY?=
 =?utf-8?B?VTdZNTVvaUhwTnV0ZTdSVFJ2VDVrTUttUFRKc01rRGlIclNSbnJqUllKSG9P?=
 =?utf-8?B?d3F5T29RRDZDYlY3bGFoTzJ4ZTBINm5FQXNxYkY2dzA1V3BqdVpTWWlFbFpR?=
 =?utf-8?B?M1Q4T2h4NExtVnB2MmJPV0JsaUg4Rjh2L2F3TXFLMFpPdWhmMGJwOVN2akJU?=
 =?utf-8?B?YUtVVFVQSjlMWXJWUDA1OThnK1VPSzdpWGFQTGNLOVd4QzlIWWxOT3k0blpw?=
 =?utf-8?B?ZitWNkk1bW1Zamx1N3hPdGxydjhYd2Q4ekdKbFdzVDF2akNDREsvOHUvWW8v?=
 =?utf-8?B?dHBmZG1hUUVLN0FjZ2VidUtZd090ZldsS2JLREhydUM5aGZ3TjZ2bVZ2OWQw?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8799f29-c3c4-4785-6bbf-08de0afccd92
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 08:36:43.4128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lm+PyYkrp1X7aroV94Tsa79nazk75KJgDrdUSWeZBPZldgocyo5tv4QHlqXNRzDsJ3sukNNdpPDt9LQ3/RuhlGaDrrnCdLLErM8hb3G6ci4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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



On 14-10-2025 13:57, Thomas Hellström wrote:
> The madvise implementation currently resets the SVM madvise if the
> underlying CPU map is unmapped. This is in an attempt to mimic the
> CPU madvice behaviour. However, it's not clear that this is a desired
> behaviour since if the end app user relies on it for malloc()ed
> objects or stack objects, it may not work as intended.
> 
> Instead of having the autoreset functionality being a direct
> application-facing implicit UAPI, make the UMD explicitly choose
> this behaviour if it wants to expose it by introducing
> DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET, and add a semantics
> description.
> 
> Fixes: a2eb8aec3ebe ("drm/xe: Reset VMA attributes to default in SVM garbage collector")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: "Falkowski, John" <john.falkowski@intel.com>
> Cc: "Mrozek, Michal" <michal.mrozek@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com

> ---
>   drivers/gpu/drm/xe/xe_svm.c      |  5 +++++
>   drivers/gpu/drm/xe/xe_vm.c       | 12 +++++++++---
>   drivers/gpu/drm/xe/xe_vm_types.h |  1 +
>   include/uapi/drm/xe_drm.h        | 15 +++++++++++++++
>   4 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index b268ee0d2271..f8773cbc2025 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -302,6 +302,11 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
>   	if (!vma)
>   		return -EINVAL;
>   
> +	if (!(vma->gpuva.flags & XE_VMA_MADV_AUTORESET)) {
> +		drm_dbg(&vm->xe->drm, "Skipping madvise reset for vma.\n");
> +		return 0;
> +	}
> +
>   	if (xe_vma_has_default_mem_attrs(vma))
>   		return 0;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9c29608aa3bc..d8a9d8090b37 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -646,7 +646,8 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask,
>   	XE_VMA_READ_ONLY |		    \
>   	XE_VMA_DUMPABLE |		    \
>   	XE_VMA_SYSTEM_ALLOCATOR |           \
> -	DRM_GPUVA_SPARSE)
> +	DRM_GPUVA_SPARSE |		    \
> +	XE_VMA_MADV_AUTORESET)
>   
>   static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
>   				  u8 tile_mask)
> @@ -2296,6 +2297,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>   				op->map.vma_flags |= XE_VMA_SYSTEM_ALLOCATOR;
>   			if (flags & DRM_XE_VM_BIND_FLAG_DUMPABLE)
>   				op->map.vma_flags |= XE_VMA_DUMPABLE;
> +			if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
> +				op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
>   			op->map.pat_index = pat_index;
>   			op->map.invalidate_on_bind =
>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
> @@ -3279,7 +3282,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>   	 DRM_XE_VM_BIND_FLAG_NULL | \
>   	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>   	 DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
> -	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR)
> +	 DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
> +	 DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
>   
>   #ifdef TEST_VM_OPS_ERROR
>   #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> @@ -3394,7 +3398,9 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
>   				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
>   		    XE_IOCTL_DBG(xe, obj &&
> -				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
> +				 op == DRM_XE_VM_BIND_OP_UNMAP) ||
> +		    XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &&
> +				 (!is_cpu_addr_mirror || op != DRM_XE_VM_BIND_OP_MAP))) {
>   			err = -EINVAL;
>   			goto free_bind_ops;
>   		}
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index a3b422b27ae8..d6e2a0fdd4b3 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -46,6 +46,7 @@ struct xe_vm_pgtable_update_op;
>   #define XE_VMA_PTE_COMPACT	(DRM_GPUVA_USERBITS << 7)
>   #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
>   #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
> +#define XE_VMA_MADV_AUTORESET	(DRM_GPUVA_USERBITS << 10)
>   
>   /**
>    * struct xe_vma_mem_attr - memory attributes associated with vma
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 40ff19f52a8d..98bc8858e4bd 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1013,6 +1013,20 @@ struct drm_xe_vm_destroy {
>    *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
>    *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>    *    handle MBZ, and the BO offset MBZ.
> + *  - %DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET - Can be used in combination with
> + *    %DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR to reset madvises when the underlying
> + *    CPU address space range is unmapped (typically with munmap(2) or brk(2)).
> + *    The madvise values set with %DRM_IOCTL_XE_MADVISE are reset to the values
> + *    that were present immediately after the %DRM_IOCTL_XE_VM_BIND.
> + *    The reset GPU virtual address range is the intersection of the range bound
> + *    using %DRM_IOCTL_XE_VM_BIND and the virtual CPU address space range
> + *    unmapped.
> + *    This functionality is present to mimic the behaviour of CPU address space
> + *    madvises set using madvise(2), which are typically reset on unmap.
> + *    Note: free(3) may or may not call munmap(2) and/or brk(2), and may thus
> + *    not invoke autoreset. Neither will stack variables going out of scope.
> + *    Therefore it's recommended to always explicitly reset the madvises when
> + *    freeing the memory backing a region used in a %DRM_IOCTL_XE_MADVISE call.
>    *
>    * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
>    *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
> @@ -1119,6 +1133,7 @@ struct drm_xe_vm_bind_op {
>   #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>   #define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>   #define DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR	(1 << 5)
> +#define DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET	(1 << 6)
>   	/** @flags: Bind flags */
>   	__u32 flags;
>   

