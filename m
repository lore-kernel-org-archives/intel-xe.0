Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BCCD339A1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Oct 2024 17:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DBF10E520;
	Mon, 28 Oct 2024 17:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aM4ykHbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0E110E520
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Oct 2024 17:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730135035; x=1761671035;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XLah0z8iecczCFprtDHTYVwmsazyooGouG4HvGq8Z54=;
 b=aM4ykHbU7IxgpqbeF3Xht0PJDgE/472oF3etDnRFNvVA1RkszQfezgEE
 fYLnhPJztq7IF3mBSRTC/y+n8Yt+3G+beLRYreJVpO1h/oj82bZMHTDin
 ZNHUkMeF7CDOp/e7zE7dJC1utNIOaunoWIb6Grrxr7uVLMMnaDHhWsXKW
 0PUQuvu/euUYPlpeeLHV1NqufuOk/8XCQdOH3gT8dQierWOnQPOd9WmSV
 h4GYqWe055EKVrWNAtN9oZIUNC6pcJGprgfvIqexF4wpAsJSnwSutjRE4
 geHtpWJxReVVoRROFTY1aJ+ti/UNtStbjZJTgfh1ssDrIhSuNGWXMP8xl Q==;
X-CSE-ConnectionGUID: eSKLL4wESMSGc0thGa6ToQ==
X-CSE-MsgGUID: y5Gnld+lS2+r9pOaQ3HiWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="17376405"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="17376405"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 10:03:54 -0700
X-CSE-ConnectionGUID: nePO9mO/SXieNb6xxdG0LQ==
X-CSE-MsgGUID: BZraXyaqTVu15R4vddtwlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="112494405"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Oct 2024 10:03:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 10:03:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 10:03:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 10:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aipn4eS8lo5gaqDo2psAIap0msJmApjCIBCkamrYOWYpa/o35Ufab67sMvhEYBc49034lfYgtranOWU+Lu0CqpHy0T6N6bEex1a99t5tjIj4JeeQz9ZBa6WluJUqrmIWNr7suEt2HoZJRsvNoITPbfPkzkgs3pmWmODS8e7hG9yvD2yP7m8Zm6TuD/A8M+pYRxMwP6DEYEcbO2jzrL0kMAtezOsu0K7uiH/N3srz1fyvUicG8BQ6xctDsEGILL+o782e0tREzREWC7CVT9geujTdMwJYlKxcM9+ylNMX8Nx1C73EhzLe+EuOgvThnccM9cXAjIG7+ttAvAUBIPjOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msyzd5t3Jgmzdlir4VM25A7rZEP/6BGuobu/ohWR7ts=;
 b=LQTdNxRI8XI3IqBMyy350NT5ulhmB9kiMzjFRR3evM+cu6ZZ766q1lvYn5gsy0ICMIAVVgeXoZ8JyxswpWLiE5RHn3/vac2z4Q3e85DE8IcMQTZhpeiV/PPoQacJrnfrKeTVEYFORVOLrLnTFLUlxxDfVLE8GckwAcI3FFS/LqrmzYyVDqqWyCJ3mByQT95JBDmF0ZHRAYKnFgEi8msrkX05aoX/L41Ce1lFLzjhx7CLH8nMPrbeJgmyQK97/ygejbbkDSqffIw8hoatABhXeMVeXO/ou7jv2xz5oPMzhkR1CSEjhyo5t+08XfP1Ocp73QowcILF0BNkMLNJQlODCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA0PR11MB7792.namprd11.prod.outlook.com (2603:10b6:208:409::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 17:03:46 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 17:03:44 +0000
Message-ID: <d9befc74-b9b5-48c6-851f-8163b356edc7@intel.com>
Date: Mon, 28 Oct 2024 10:03:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, <stable@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
References: <20241028114956.2184923-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241028114956.2184923-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:303:2b::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA0PR11MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 206876db-c656-4490-2704-08dcf7727af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTFhSlFHUzhYK0ltUzBrUGZBTDJzbENkVGJFUndhL2k5SEV5WEd5WElrRS8x?=
 =?utf-8?B?MmNmQ1l4WktyTTJMUlBVTkpBbjRHcDBPREVaaXVHdHo1OWIxT25aN2kyNFRU?=
 =?utf-8?B?d1NVRERjZUN3dkpEUnI3WVlVb1E4SXlmazdZVUJwOGlCZExoelZBOUliWFdo?=
 =?utf-8?B?UDdyUWpWUTJzUUJmbCtGcnNjU20yNHQxZlVtZHVsRXVPSzNYREZWNTZwNHZY?=
 =?utf-8?B?WXhQVkwyWG05MzFlYmcvMUUxbG1yaFFFQ1lQTysybDZkV2pDQXJjeFFkaExw?=
 =?utf-8?B?UmNVM2liZ2tOL0Q2NWFoVkszK1RJWktONWczcGsvTkR2R216ZE96RjVOSTIw?=
 =?utf-8?B?ZkZKRDMvSFYyQXVOSWdvQzVpQzVQRG9nempNVXA2c2RzSDFBalZZaEVxRXBP?=
 =?utf-8?B?UGkyLzg0dVZjZGM1WW1XNWhGeDQ4cDF1VGhCemlPYjhHRWJpTGNBSDRnUmhV?=
 =?utf-8?B?aHlrMmovSHFJVHVGcHJHSG9xdmdTQzJheFBWOW5BSDB4TFZRREhSUUxlYnpD?=
 =?utf-8?B?UTZmbCswdU9TdXZ1RTAwVnJEdU1DK09PWDFzUzJFbUVWYyt6UmdpdStSdUwz?=
 =?utf-8?B?Sy96TFFZYUo4WktnRlVYN2s3MWU5T2FuRytsVnhNbkRDVWN3b2Y3MlZsaC8w?=
 =?utf-8?B?VmVFaVp5cmZyckExTWN4eVR5d2U2dGozeEtzTXFCSk9lOHgvU0xMTzVyNVNC?=
 =?utf-8?B?VlBuRnp1VTR1cWY4cTNFa3E1ZUhvc01tTFJsUG8vbUFzMnlpM1dpYkhlUFhI?=
 =?utf-8?B?RXhMNkQ0U2IvNk9vZUxpcG1WenZUajBDUStBYVV3MHR4djJLOEJzb09lbW1X?=
 =?utf-8?B?aXZxSExMS0pkSEJZc0ZpZXRDb0Jhdjdxc3dRdWRIeFBMOHRlcXdnRjdKd1hS?=
 =?utf-8?B?YXc0Um9xalN2RHdJb0UvZlF3eklmMUhCVlZJWi9vZXRPTkZ5YTlhWWwzeURq?=
 =?utf-8?B?ck4zblF6RkJRaDlza0JxK3QxQ1QxR0NMVUFoV3Q2aVJxRkpha2hMcVlGUHlo?=
 =?utf-8?B?SGlDYllOWDQ3TVV5aFNmajZsVW9BODc1MHY0ZlQrVXdCbklEUiswTDYvWklB?=
 =?utf-8?B?cm5Ob1MzQjcyZnFjN2VhR2ZXakxHUytyUlJ2eEV6eTB2cWJlTjd2eEpGRW51?=
 =?utf-8?B?UW9KQ2p4ZWgydGgwWkM5SkY0akgrY1FzUXlGYTZxbXBOaEZneE9QbmpBKy93?=
 =?utf-8?B?MUdUbmR0YjN2Sko0Z1gzQUp6bTU0TVA5Z2pyR09yREoyckw5aTA4UVNDdTIw?=
 =?utf-8?B?SVZiVFVobFhTWlZoQk5pdGpDcE04TFFWU3VtRXcxeG12UVpGbEl6cTduSG5R?=
 =?utf-8?B?Vk5kM1gvMEZ1bXQzNTAzaFpVK0tSSnJxRWRaQTNXMERvYTVlMjV3QWl1QXVE?=
 =?utf-8?B?TFhIU21WblAzTTBscTlEKzluRm9BTXBlRlQ1NlJiZGlUZjNkTFg1SHZxNkxS?=
 =?utf-8?B?bTRQOWtDazRNYk9nc2hkR1J1VmVPSHBqWjFFYkdRN0NzckZWeE0wL1lDQUhv?=
 =?utf-8?B?OHBzQ3p2T1lDT29SZDVQRkpiYW9nd3RpNnJxYTFGb3RSbnQ1dXliTjA1T3VT?=
 =?utf-8?B?ZnVabFQ4a0Q2enVHNnFvQTcrUENPUEcrWktUZXZzTThIZ2lJQkswQTVqN3Nl?=
 =?utf-8?B?TjlhdXpUTERmUlNIdWxaU1ExUHZXLytaY1JYTHM2L1BKcU92QUpOVDF4YkFs?=
 =?utf-8?Q?YSfkSBXbkZeBSmRhOPFm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVJxVWdlQjFyUGZVaERQb2luQXZUd3YveGJmK0xTN093QjYrUlA5Tnd2YjNW?=
 =?utf-8?B?My9oSmdvRXFIelRTWTJhWEZwUGNoL0loSHdNeXFSMHhkU2ZXU2x3SFpYd2g2?=
 =?utf-8?B?Mi93YkplVnEwUkh1MUdDVmkvSlU4dGI1alpkL2RoMFdFSFZlREhVc0VvbTRQ?=
 =?utf-8?B?M3NxVzBENURQOG1mUmNBV1Nhd0ZIemQxbGp1Rkd2c0Z0NWdsVXNWUU5ydHlU?=
 =?utf-8?B?aURDd3pGY0dNd0EvcmhleFNPamY1OUN2TWlOeFlIOXRIeE9GR2I4ZW9IOVJU?=
 =?utf-8?B?NmxjSzJuYkFHajVwb01Oam9iMkRnYkprZGthZTVYRWdjMURWK0MxVUNIWnh2?=
 =?utf-8?B?SXh3OGplWWVoTHNLbDY0TUgxckN2Q1c5dTRWdGFBREFQbFVJNzgyVWFsbEN5?=
 =?utf-8?B?MjlxMjlyM0w4VjFpR0tkTjVvRVlyS2sxd2dVK0FqMWRIQ3FLZ3FpdnQ5TU5o?=
 =?utf-8?B?SVI0RWJnRnlOb2E5R0tpMkdoVGdJYjdBYy90clpsVVZhdWlKZjluRDliL1Fl?=
 =?utf-8?B?d21rTTd1S2dwRVRrRzZHZXRKd3pXQnp1dEkrYjdRL0dqUjJNQzFVbGRGU042?=
 =?utf-8?B?cytaVXFQbERFZlRRb2dnZy9yTW1TWWIvczNBZ2d4WGtyeDNleDM2ZUlCb1Zn?=
 =?utf-8?B?M0ZqM1YvUEorc1hGWVdMWU14THZubHNVMzkxekhVWFJ5M0FlWC9GckNabXJ0?=
 =?utf-8?B?dzBNSUp4Mys0LzZwb0UwN0grQjVla2hLWjJ0VXg2M0tHVGJnK25UREkrTGls?=
 =?utf-8?B?WHI3cVZBeEtMWTJad0RMWktObHdQbmlxaTc2bVdMS01jRWtVa1cvemozTm03?=
 =?utf-8?B?eFg1eHloQlFhd2k0L28zTFNMbGc1OVpzd3pJc1ZjUW5mOTQ0bktBNGhMMHho?=
 =?utf-8?B?UGlseDY2dVlMTGpDK3JqYVZEcHN3TG0zQWxaM0MrSUxKQ3FRdTQvVVQ5V09z?=
 =?utf-8?B?K2FKSzNoeld0YlBGbVZOMHozc01WcUQxODZWLzdSRDdxakpsbGhrUUlqMTJz?=
 =?utf-8?B?aGYycFgxWUdtSUF5NktzakhwYzZubCtYVUlwQkJzN2ZUZm9KOUY5eFNSYXAv?=
 =?utf-8?B?NVd2bSsyK2FZRlFXVHA2Z1dENGRkZ1lvcUVmNjRsK0RPNi9wcG1NeHpXL3Nw?=
 =?utf-8?B?Z0lOUGs3d1hxYVJMREoxNjFKeW13VENpZ1hGMHNpSG9TdGtWeTVnckNUNkFZ?=
 =?utf-8?B?VEtiOEFoaFczTHdHL3dRRkV6c0hJRDlGdFZvRkxOcWpLUHJPdCtDdjk3Zm9s?=
 =?utf-8?B?RG9mYW11QjZ6QnI3THROQnUzYzgrTTUrSG50aElWRGVXMzFnSUlOVVZtUS9D?=
 =?utf-8?B?eDRucTRybW15b3dOeWJJVFhtOHRsOFlySlFpYi9DNStWS3lxOUpqWG0vNHpE?=
 =?utf-8?B?LzlEa3cxK0IraUt2d3lVeCtQTHlleEZuVU9PcHo1ZEd4eGtZOWtvbkQ5YzRr?=
 =?utf-8?B?Tnpka1FWMUlOOVVYM21VaXFCMWRJUGYwK3NHUlREQTdMRTRHZ2tuL1pPZlps?=
 =?utf-8?B?cW5wUUJzUUVJdXhNNFh0eG5zWkxMMytienJFdTM0aWl1d1NmazhNUWE4TW9a?=
 =?utf-8?B?N29iTklPakxsR1RSRHpsK3MwUDdDbTYwcFQ1OTBDc09BdmJ5eS9iNGlra3Ix?=
 =?utf-8?B?eWJ5ZEN2emtZMTRWT2hkRTBMUGtOa0ViTytJNDdJZzQ2MnRaMUFQdlcrSWRW?=
 =?utf-8?B?bnhBM1M1Mk1NR09hSi9TcVIxYXRQaGVZVWRhS0RnNEJ5ZkN3cE9uVitSNzhr?=
 =?utf-8?B?MTVQVFoyU3V1WGFlQkp3ZmQyUFd6aGFqd21RMWx2ZlVZYXBjcE12cUdtWFZI?=
 =?utf-8?B?cXBmTFQ4cjdBVzFwQndWNURmK1dkNktibFJ5RGdWalZENFRyQ0xkZnFZZVdQ?=
 =?utf-8?B?N21UZHRqc2FyQ0czYXNWdDZBaWtaTjJ2OENrUG13Zm9xMWFzWEI5eWpGTldD?=
 =?utf-8?B?bGsvYVdlTUpHZGN6Tys5WmhCSDlLamc0bmN5a2doVjhHcGUwMzBwZjhaZ0hB?=
 =?utf-8?B?aDlybjlTdy9SbzlxL24wZEwvR1Z3anI2REJUMXNISlpRQTQwTk1qaThnd3ZW?=
 =?utf-8?B?V0ppYStEK1NmN3RScmtzbjU1VHE1eVYwZEF1M1ZtUjNvQlFFb1NBOXlSVXhv?=
 =?utf-8?B?UzAzdXNGOG5HQ0oyVE03YThwY21JbTArVWpjdFJ4UHJvQWdTTE5yNXpKZWxs?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 206876db-c656-4490-2704-08dcf7727af2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 17:03:44.2822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ks0LrM7rDLYSYdjhmbs1F6wB4SN0E2OAG1M4sKcBJyWYRhoyn2cUb3hDojyMlJNnVKXrruAgcafL8E5L4z8lK1PfpDMrVCuYWhJPleRiXiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7792
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

On 10/28/2024 04:49, Nirmoy Das wrote:
> Flush xe ordered_wq in case of ufence timeout which is observed
> on LNL and that points to recent scheduling issue with E-cores.
>
> This is similar to the recent fix:
> commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
> response timeout") and should be removed once there is a E-core
> scheduling fix for LNL.
>
> v2: Add platform check(Himal)
>      s/__flush_workqueue/flush_workqueue(Jani)
> v3: Remove gfx platform check as the issue related to cpu
>      platform(John)
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wait_user_fence.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index f5deb81eba01..886c9862d89c 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -155,6 +155,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>   		}
>   
>   		if (!timeout) {
> +			/*
> +			 * This is analogous to e51527233804 ("drm/xe/guc/ct: Flush g2h worker
> +			 * in case of g2h response timeout")
> +			 *
> +			 * TODO: Drop this change once workqueue scheduling delay issue is
> +			 * fixed on LNL Hybrid CPU.
> +			 */
> +			flush_workqueue(xe->ordered_wq);
I thought the plan was to make this a trackable macro used by all 
instances of this w/a - LNL_FLUSH_WORK|WORKQUEUE()? With a single, 
complete description of the problem attached to the macro rather than 
'this is similar to' comments scattered through the code.

There was also a request to add a dmesg print if the failing condition 
was met after doing the flush.

John.

> +			err = do_compare(addr, args->value, args->mask, args->op);
> +			if (err <= 0)
> +				break;
>   			err = -ETIME;
>   			break;
>   		}

