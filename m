Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4538EDE9AC
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 17:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F13910E8BD;
	Tue, 10 Sep 2024 17:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P3WUUJvX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924D710E8BD
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 17:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725990810; x=1757526810;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5nbvO+c4mQCuJc8ALyt5lqPeihg7v2bK5k0hY2Bs6qw=;
 b=P3WUUJvXXRqIPjywUJAqHI9vKwPQA8dVS/6CpWGeVgwooXhwr8It+q++
 iN+HvRFUjmlS/t75q8ayj7y5+2qyOEg2KQ2/wgsKZbnfqLxWZsMtj4PIk
 AtK1k4cCHbnCFbjEJi/dol0zjWh7YAt/khAJk6Zw03teJ317eB9ahVcCk
 lfFfasG424OlIBcPSUoUu9kFuIxmRdyK8tZpxGBZnmPq1aozygrCKmjnb
 1TyPd9hGb63d1nS0vfFzkTarx5713dVgTN47ZP+FA3EGHAB35j8jggcvI
 E1tJ8kGig5a58/40ytftCIRSmZbAd6YhacjDJSYjR5hcmdZGbLew6fBCb g==;
X-CSE-ConnectionGUID: aU18i8LhRu6MDv3UxbYe2Q==
X-CSE-MsgGUID: Ptnw4v/eQ6OrJDiNoGKjpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42275732"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="42275732"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 10:53:30 -0700
X-CSE-ConnectionGUID: cYPS8BUZR4ym9iUi4tDq1w==
X-CSE-MsgGUID: qWJ701clRQagxkQ8bWh7bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66735805"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 10:53:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 10:53:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 10:53:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 10:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaJ8MpU/1o9H6QZA9W2Ek0iWHRU28cG3sQf0outysakjBxV/m+PI6NkT4xVXbQKHNCZPVRsdXYy4tq+27VHcVs0bn3stATJMTQZNngjeAWNRZmYCCOvnMyw0/1IpyLthUzfoQWEf23AF0cd/pYwOnhlrlHlW5NV5BMh/sa8Svj8HgIeSfsZg3v7uToBW6Nm3xWRLTlTcjcxGoe+dmFkbhrY4U7WLPL+AEG6RC6ZNHrK7C7C/GS4aAn0jXJ0E7rSonY4bG7vBG5N+VerURCVbrkLs5XsFFGQ/StQtBoxd+yiWOVkkImrkxL+PgEqUX+b6KItGmKJqxAiy/vwI4Aq35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfpN9ssFuCvxdRwESypHeaD/9JGY+TrJwAvoPPbS1qM=;
 b=OQCjtQ/VRKIUoWXYUfZa4zZt2Q7IUXgrKxv7Fx1uWqXJK89NawE4/YbZjGe81p8GNsJisW49LoVvrU0XWWap36Yo27H34A3Ie9i++Nl4oARjZutFblbNDLxnpC7JvBUK8O3g+Gg1ts5w4dNkB5bPzuaxKt7/6WBo7vW8NTSgH7CfTof+YdlEQR1GcQ5/Q3alXH4YyubM/UaNT2CAuCdOM45x0NwAEJIfC8ioqyLdy/40s/IWZFgmM//HFMsyJnCDfzxFPZB+uJ1IGCh4S1nQCRGtQBkNLcAOv7TSEAO15dVI/XVpd6cz1iMsfJct4RRew1XqRUVHKwJFbPS+fT+78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 17:53:20 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 17:53:14 +0000
Message-ID: <a6ce3220-3522-4489-a875-3731bd85f9ed@intel.com>
Date: Tue, 10 Sep 2024 23:23:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 7/9] drm/xe/gt_tlb_invalidation_ggtt: Call xe_force_wake_put
 if xe_force_wake_get succeds
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-8-himal.prasad.ghimiray@intel.com>
 <ZtoIk-OUD7qkBvKn@intel.com> <9605f23a-ce16-468d-a7b3-2ea3d9be2f21@intel.com>
 <Ztst1yxHrJyHQMl6@intel.com> <43116f22-0495-44ec-9895-aad9dcd5165d@intel.com>
 <122fbba9-8174-4c91-8085-5f5cc940db17@intel.com> <ZuCEO9o3aqy4fdU0@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ZuCEO9o3aqy4fdU0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB4802:EE_
X-MS-Office365-Filtering-Correlation-Id: ba180fba-30ed-4e3a-7366-08dcd1c17155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajQ1eGJoYXpmdXdZbjg2a2JpclZKdW5ORkI0aGs3S1Rnb0w0cXhTY2ZVYkV6?=
 =?utf-8?B?RVp0SW4xNkcyWmZFKzFINm5neWxCUjN0U3JVVUZYRU14dEdMTTd5NHlmcElj?=
 =?utf-8?B?MHl0dVBONi9XN0xHSWlCb1N3UDNIMkw5YzZGTjY5bkZHdWJZOEZFSVNSRitM?=
 =?utf-8?B?eS9rclF2b0h2Y0tNYWFTYmJCckdEMFd6ckhVQURrNDJnZDZ5Vm5CUE5YZkgx?=
 =?utf-8?B?M3NrN1dDMWJDdGZYNFBQQ2xBK0sxVUtscVlHQkQzM09odStEalBIQzRpMXNH?=
 =?utf-8?B?dkR3Z3h2cmRwYXNNNkplLzZocW9jOTNDdkFaS242UUNITTJHZSsyWVlnTm5x?=
 =?utf-8?B?WXdNQTNRWjZhL0ZUWW1jRUlUa2E0N1JDaUltelkvanZhcnZJMG9UMmttZjI3?=
 =?utf-8?B?aVpQK0xaMjE3ZGwyb1lDQzM1cktMV2dwOGJMSGFTR2Q1RVB3ZS9UVk1HOVRr?=
 =?utf-8?B?NUxua1R6c2pzOXdFZ2lkZTI1eElSMlRxOTJ6SGVCZUV6ckJmQ0F3NlEwWmha?=
 =?utf-8?B?blZpMkkxU2VEYlY2d1ZYSTdGM1BNaGFWL2VpdWpxZmIyeTE1RWdtdXJIOEJj?=
 =?utf-8?B?Q0F5K1VCMkx2UkJ0Uzc2aWE5MWdNejkrZW5EZUx6WDk3OC9kcUtkbFBpMjlM?=
 =?utf-8?B?OXVVOFhxckN1MDk5dk1tSDJKeVJqOVpGN0hjdW9Zc0hCZTJMVlk0Zzhlays2?=
 =?utf-8?B?K2x1M2lHeThRRFZlZk9aSU4wSGN6UTFWbmJSRm41VUh0THJ5UlhyaytFU0Np?=
 =?utf-8?B?RjNtK1RZU1NuRHQ2ZHl2aWswYVptT01rSi9Hd2htMUcraHZ5SU52RzBPaE5H?=
 =?utf-8?B?K0pxR3NVblMvNXVDdVJkZEkvbjlIQjNwbmhjYTFjbGY2RlN1TmI0NDdoR0dV?=
 =?utf-8?B?RDcrbHRyNVRRQzN5cFRnUTVlbEowRmtXMkVsbnJFTTZoMUJOQ2s0OEdpdkZJ?=
 =?utf-8?B?VUFwb1AyOGkvWWxlM1RQZEcvYi9GZjR3WUQ4bVZuMWdTakl6ZUpSM205MTFH?=
 =?utf-8?B?R1NpS2F4U0c5enJqNDR3cVJ2czZkSlNkaXoramUzcXIvcG85MTYxWmhyQy9s?=
 =?utf-8?B?MlVVUkd3YVFNZkJpZmh6QmJWS0VoclpkMGhySmVTeEVCNktTRGp3aG8rZGFC?=
 =?utf-8?B?VWsvY04zWmtWb00ybW5mZHpGeXpQQUhLeWtuSlM4NmJJYlJhWFlSY0NFL0tQ?=
 =?utf-8?B?emtSOUtVanMvWTRsNVpXTFNmbkJxeW85YUo3K3crWURVNUdnKzVZZ2xEaTVi?=
 =?utf-8?B?eWJBa0RLVkRlMm9VOTNlb21lQmtKQmxZeUFCV1V5bGo3QStWZmhnVnFVdk9x?=
 =?utf-8?B?aUpOV29PMW8yNlNOc2VqN0RPRmVZTFBlV0dFUTAvRmFHU2tETVc2VXprN0M5?=
 =?utf-8?B?TkpFWkpnSDJXWGNOc242cTNoOGs4dGZCOHBsQkVPdXduSmNwbzV6dGV5bFBL?=
 =?utf-8?B?M2dIemV6a2NJRjFqZ2xRWTFwYnU5SytqS3luWkM1clpDckk0YVBkeFNaQjN1?=
 =?utf-8?B?ZGRVdWQwZ2pjVEFHUS9qUE9nWGtERlZKbWZFclhOQ3FvdkVYdnNqaEVFNDJ3?=
 =?utf-8?B?RVcyWXBBUndSbDlNR1RMWk04eDl4Nk80MmprVTlzSlFkWGIvN3pZazZ6cmJX?=
 =?utf-8?B?SkF0b1JuTjZyZzd4aFdZUHB6Zlc2SkZwd0F1eWpOT2ZuNGhWNitURE9LelBT?=
 =?utf-8?B?YmVmT3QyRVppVm9NaGVOb21Bdy9ldzBManhManBRUGllSmxvM2xadTRRMFJm?=
 =?utf-8?B?Wm1vcFZBNWgzR1lReU1jTXZ5VzV0NkhSWE1tZ2oxU1Yvd0hVbHFEdFFXeDZx?=
 =?utf-8?B?UStGOVdTaDBjM1JyOG1VZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEhPbWpsakJra01zM2FETlA5ZytJTVhIMlNnaGpMNzFYVEpDa3oxVkJRbWs1?=
 =?utf-8?B?MUptY09UdER4M1RVaUpEdWJDSVpSWTFDZmEyU3ZlSm1Va2dMN2Q3dXRwc3pC?=
 =?utf-8?B?V1lNS0VxZ1NXVnVST1BmUHo0RVhMbS9vNDhpQzIwWmV0eVhMTGZiakpoYUJT?=
 =?utf-8?B?UER4RXRralFzZy81WUx4WnpIUGduNWVUSnlla2I1L296VTdxUXRNcVVzdCtH?=
 =?utf-8?B?Ym5YQnoyR2hUcmNuVVN5amVoRjNuSWV3bHMvVGVTTTBJVzdyd2FabUQ1NWRU?=
 =?utf-8?B?SEdmZ1JENUloWGZQcVNGZ2xUWk9DdVI4Smo4OThKQ2pCZ2JldlpWNWJBQzYz?=
 =?utf-8?B?SzVpUGt6bzFTeHZHVjEzSkNGV2dBN2k2WjRpdXU4eTZQUFE4NG5uTkprVUhK?=
 =?utf-8?B?QkQxUUFhMjFZcGN5MEJxckkyajFwM0MzZjFwaFNlN3FWdm42SlFVV3RUWTQ0?=
 =?utf-8?B?cis4dTJHMFVNUkt5Qk90MlBwLzUvbUMwS0c4Z3NWUEsrK05CeHJsRUczbUIv?=
 =?utf-8?B?NWJEYXFhUWlRQjYraE02SmFxMWRWanU4ZC9aNVV6eS81NHN4STBaWlFLT2Z3?=
 =?utf-8?B?WUd6WFI4NldrNmJJMkxsNTdWek05NTNsdFBleHdWdzUvajFQdzA3cDRRcTEw?=
 =?utf-8?B?SVQzZlhueHFBWmd1MExtYUY5UndvWGFxUmdLTFMydEF0eGlOM2JoWU5Na2I1?=
 =?utf-8?B?VmhMRDAzNlBXMVl5NjdSZUhidDgzYmQxM0lneUFpUFBUMWxwUjQvYzRSRnJE?=
 =?utf-8?B?Mlgyc1k1aHdncWhGTG5vclhvbTVsSTZNM3dsUk5oQVpwUWhMOUFRSDFyblgr?=
 =?utf-8?B?a0lKSHRKWVhROG5lS2R4MVVzSHRiZnMyY2NzbkNJc0llRDB6bVRSTU43OUpM?=
 =?utf-8?B?d3pYalJBU2tCUWZCS2xNWXk2OVRUUjg3MTdUNkdFMmgwQ3d1SkhSeC9IMG9D?=
 =?utf-8?B?ZnNDNzBWbzBBWE1Ielg3NmpwRWQ3cVVTSnd4bitNdU5sd1dhTEJmdEowd2E1?=
 =?utf-8?B?dFVTYnFqTkhQdmRUYjJoQnFrSWNRUDNSWUY2RXMxWi9VdWRHQkRwMEZqTFBM?=
 =?utf-8?B?TCtuSTJIVk50YzZaV3E4M2FaYmZnUEhSbTNjNjVucE1nbi96S0ZNbHZ5NTh5?=
 =?utf-8?B?OXdzSXBIZHh5UW1kL0RjZDNMRkcyYnBhaUwwTXFvSFlRQjFzclNNZHdiRHBG?=
 =?utf-8?B?YzI5ejRqRDdqYUl3U1U1Rm9BUDdtV1VLZXdNblp5REZnY3BWUVQ1YzJpd0tw?=
 =?utf-8?B?NDZxd2h0V2ZCU3pKeStPaFRsbFgvTHZzLzV2QzNqb2sxRlloTEhGaE1COHFk?=
 =?utf-8?B?ZlBLNURhYm16aDRwc1RaYmRtWEtSM1JTQnQyME1yRkt0MU85MmxtSzdWczZn?=
 =?utf-8?B?TDNySlU2ZFh1aW8vV053M1JHamtjNnEwbk44M21RbEJaenRIZ2ZoZzUwcVJ5?=
 =?utf-8?B?OFFaenJLRzY4RmFjYUJrcyt3QXE5ZmNkdE9iQWJYQUVJYzlDTWxQWEQrMXV4?=
 =?utf-8?B?cjZ4RTRMb1M4YWtSbFJhcWpoVUhrdUptbkFDL0pHekR3a0NLdDRJWUhRSzhZ?=
 =?utf-8?B?SnoydGdncHFnVmdTYU5mazVEWWx2K01kNFpINWgxaGRtaFhwZi9jaFpFcHFl?=
 =?utf-8?B?YURSb25hN21XdFFFK0M1bmNWNEsrQlRGcTBnVXFZVXZET053YVF1ckltYTFy?=
 =?utf-8?B?Z01weDMvS0Q0STZBL3VwZmgwT3RWTDh0ZzE1ZUlkcm1LS0dvY0JkLy9RWmh6?=
 =?utf-8?B?UGpPMjB1dzJVb2NrS1lTTC9pZ2VJNy9hOVdMd3NJRGVxbTBtUS80anVqTzdz?=
 =?utf-8?B?SUdHVXpXTWx5c2Fqa0NXRitHK3V2V2l6VUxHa3ZKWkxRQTByTUZYaS9HSzBP?=
 =?utf-8?B?WVp5VmI5em1zQTlBQVFjRmNncUxvZ0tHckEydGZ2MTJ5K2ptQXR2VE9LcFE4?=
 =?utf-8?B?dDVnc0N1OW1keWFtcW1HRk1OV2toUEp4Sm9wRGhHOE1MODlielV4MmFXbEVQ?=
 =?utf-8?B?K3A0MFo3ZTFhOTRVL01EWEZrelY0QnVCUHpPRFA1VDg1Nnd1d0d1MFQzdUds?=
 =?utf-8?B?MFI0WU9OTjVLZnhuTVB1NGw4OWZxajZnSWZSRmRReTcvNStuQ2JXdWs4Mlpt?=
 =?utf-8?B?Y1JQTzFtU0dWYzF4ZjZPVFV1U3NMQjZrY280ZWZ4OHFTcklES3N5UUErRVRI?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba180fba-30ed-4e3a-7366-08dcd1c17155
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 17:53:14.3481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8ua167HG5PudnUbe15ADRasjj2eHcTK74Jzlm2yvV+hH5itMBwzzA5l+VjAxuOOTA1nI9H9654f3jYzdSLWpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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



On 10-09-2024 23:09, Rodrigo Vivi wrote:
> On Tue, Sep 10, 2024 at 08:07:01PM +0530, Nilawar, Badal wrote:
>>
>>
>> On 09-09-2024 14:59, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 06-09-2024 21:59, Rodrigo Vivi wrote:
>>>> On Fri, Sep 06, 2024 at 01:21:41AM +0530, Ghimiray, Himal Prasad wrote:
>>>>>
>>>>>
>>>>> On 06-09-2024 01:07, Rodrigo Vivi wrote:
>>>>>> On Fri, Aug 30, 2024 at 10:53:24AM +0530, Himal Prasad Ghimiray wrote:
>>>>>>> A failure in xe_force_wake_get() no longer increments the domain's
>>>>>>> refcount, so xe_force_wake_put() should not be called in such cases
>>>>>>>
>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 9 ++++++---
>>>>>>>     1 file changed, 6 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>>>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>>>> index cca9cf536f76..3f86ab704c4f 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>>>>>> @@ -259,11 +259,11 @@ static int
>>>>>>> xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
>>>>>>>     int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>>>>>>     {
>>>>>>>         struct xe_device *xe = gt_to_xe(gt);
>>>>>>> +    int ret;
>>>>>>>         if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
>>>>>>>             gt->uc.guc.submission_state.enabled) {
>>>>>>>             struct xe_gt_tlb_invalidation_fence fence;
>>>>>>> -        int ret;
>>>>>>>             xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
>>>>>>>             ret = xe_gt_tlb_invalidation_guc(gt, &fence);
>>>>>>> @@ -277,7 +277,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>>>>>>             if (IS_SRIOV_VF(xe))
>>>>>>>                 return 0;
>>>>>>> -        xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>>>>>>> +        ret =  xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>>> +        xe_gt_WARN_ON(gt, ret);
>>>>>>> +
>>>>>>>             if (xe->info.platform == XE_PVC ||
>>>>>>> GRAPHICS_VER(xe) >= 20) {
>>>>>>>                 xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>>>>>>>                         PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>>>>>>> @@ -287,7 +289,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>>>>>>                 xe_mmio_write32(gt, GUC_TLB_INV_CR,
>>>>>>>                         GUC_TLB_INV_CR_INVALIDATE);
>>>>>>>             }
>>>>>>> -        xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>>>> +        if (!ret)
>>>>>>> +            xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>>>>
>>>>>> looking all these cases now I honestly prefer the other way around.
>>>>>>
>>>>>> If we called the get, we call the put.
>>>>>> get always increase the reference and put does the clean-up.
>>>>>>
>>>>>> fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>>>>
>>>>>> xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>>>>>
>>>>>> so, the fw_ref is a mask of the woken up cases which require
>>>>>> the ref drop and sleep call.
>>>>>
>>>>> Hi Rodrigo,
>>>>>
>>>>> Thanks for the input. AFAIU using this approach creates issue in the
>>>>> subsequent force_wake_get/put in callee function. Which I have tried to
>>>>> explain in cover letter.
>>>>>
>>>>> [1] subsequent forcewake call by callee function assumes domains are
>>>>> already awake, which might not be true. This shows perfectly balanced
>>>>> xe_force_wake_get/_put can also cause problem.
>>>>>
>>>>> [1] func_a() {
>>>>>      XE_WARN(xe_force_wake_get()) <---> fails but increments refcount
>>>>>
>>>>>      func_b();
>>>>>
>>>>>      XE_WARN(xe_force_wake_put());<---> decrements refcounts
>>>>>    }
>>>>>
>>>>>       func_b() {
>>>>>      if(xe_force_wake_get()) <---> succeeds due to refcount of caller
>>>>>          return;
>>>>>
>>>>>      does mmio_operations(); <---> Domain might not be awake
>>>>>
>>>>>      xe_force_wake_put(); <---> decrement refcount
>>>>>    }
>>>>
>>>> Well, to be honest, this is what bugs me in this whole series.
>>>>
>>>> If func_a failed, why would function b succeed? It that's the
>>>> case should we include more redundancy and retries so the
>>>> func_a would succeed like the func_b is expected in your
>>>> scenario?
>>>
>>>
>>> Hi Rodrigo,
>>>
>>> This is current behavior, which patch [1] resolves. I misunderstood your
>>> comment as dropping of that patch and simply balancing all _gets with
>>> respective _puts.
>>>
>>>
>>>>
>>>> But other then that, I'm afraid that you didn't fully understand
>>>> my idea. Sorry for not being clear.
>>>>
>>>> My thought is, you do what you are doing in this series.
>>>> If the get doesn't succeed you drop the ref count and call the
>>>> disable.
>>>
>>>
>>> OK. IMO, just reducing refcount is better for failing domain and not to
>>> disable it explicitly
>>>
>>>
>>>>
>>>> The return of the get is just for the domains that have succeeded.
>>>> then the put returns only the ones that had succeeded.
>>>> The function B will then try to wake-up whatever had failed in
>>>> func_a.
>>>
>>> I assumw with this, the return of xe_force_wake_get will return the
>>> mask, hence the caller will need to verify whether the returned mask is
>>> correct or failed.
>>>
>>>
>>>>
>>>> Something like:
>>>>
>>>>
>>>> func_a() {
>>>>      fw_ref = xe_force_wake_get(ALL_DOMAINS) <---> fails GT-domain
>>>> but return a mask with all the domains except GT.
>>>>
>>>>      XE_WARN(!fw_ref);
>>>
>>>
>>> XE_WARN(!fw_ref); will work for all individual domains but not  ALL_DOMAINS
>>>
>>> XE_WARN(fw_ref != ALL_DOMAINS); <-- If user wants to continue -->
>>>
>>> if (fw_ref != ALL_DOMAINS)  <--If user wants to return on failure -->
>>>       xe_force_wake_put(fw_ref); <-- ensure to put awake domain -->
>>>
>>>       return;
>>> }
>>>
>>>
>>>>
>>>>      func_b();
>>>>
>>>>      XE_WARN(xe_force_wake_put(fw_ref));<---> decrements refcounts of
>>>> the domains which were actually woken up.
>>>
>>> Makes sense.
>>>
>>>> }
>>>>
>>>>      func_b() {
>>>>           fw_ref = xe_force_wake_get(GT_DOMAIN);
>>>>      if(fw_ref & GT_DOMAIN) <---> likely fail anyway since func_a has
>>>> failed, but it at least tries it out because you have handled it in
>>>> your series...
>>>>          return;
>>>>
>>>>      does mmio_operations(); <---> Domain might not be awake
>>>>
>>>>      xe_force_wake_put(fw_ref); <---> decrement refcount of the
>>>> domains you woked up.
>>>> }
>>>>
>>>> does it make sense now?
>>>
>>>
>>> Yes, this is indeed a much better approach for FORCEWAKE_ALL. Thank you
>>> for the suggestion. To summarize, rather than disabling the successfully
>>> awakened domain in the event of a failure, we will use forcewake_put to
>>> handle the disabling of them and user will decide when to call it.
>>
>> This way of implementing looks ok to me. Only concern is what if the
>> func_b() calls xe_force_wake_assert_held(), this will raise the assert as it
>> will not find expected domain awake. This doesn't align the idea of
>> continuing in case of ack failure. IMO user decide to continue even after
>> set ack failure by assuming domain woken up but ack didn't arrive in  time.
> 
> yeap, and then we fix this case.
> If the assert is in place is because the _get wasn't properly handled.
Ok. Should we just use xe_force_wake_get/put, or let the user decide?
We should also document guidelines on when to use each option.

Regards,
Badal
> 
>>
>> Regards,
>> Badal
>>>
>>>
>>>>
>>>>>
>>>>> BR
>>>>> Himal
>>>>>
>>>>>>
>>>>>>>         }
>>>>>>>         return 0;
>>>>>>> -- 
>>>>>>> 2.34.1
>>>>>>>
