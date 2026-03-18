Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7C3103E174
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 13:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5575110E21A;
	Wed, 18 Mar 2026 13:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5kWKO2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0410810E21A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773839011; x=1805375011;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YGGg55fqidDTCYBp7HsoFCr3omZHBNkeu8IMvleOrUY=;
 b=Z5kWKO2BsnKRFfvekecdojFYD1Xc2mFO0Ipibt7EaviuQ4BzG19KoW0l
 ai77s/GFzoDKm0YJ35MO7kD8qDEkggErIxiQ6vxBs2Rp1+72cQItYkEZe
 9FHHYxcfyJ3pYQf5GljpfHQecKWdzQAfWmSi/JiNTb8+m7fPX9yMjekR5
 mz5QtdhD2tBf9VHJ4W2O0Yao/1WKhrxWCq8CCivmYzojLfvJ0fZ48jPsw
 lCnr2GV3Mb2GJLRvkUy6Q8Rc/L/qyDFUGxn5DAgqkbVFhxlNXpBIC62An
 +Cayxe1KGgNcP+Spm/H5Q0i4IHw+CxC2CBX5iC0m1JCp44td/2bq0M+02 w==;
X-CSE-ConnectionGUID: eXcV273uTyyWpgkcIoAnWw==
X-CSE-MsgGUID: BqhMv7hrSQOUbMAURvuPWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="86247079"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="86247079"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 06:03:30 -0700
X-CSE-ConnectionGUID: aylL7DQHT8StYRPe0UyUxA==
X-CSE-MsgGUID: XbC6DQFtSsicFT2i4/Pn+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="222676764"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 06:03:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 06:03:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 06:03:29 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 06:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BCwpZxQpKjnsC9D7/Ja9I5BpbM9KeF/lnMFAxnXdeZ+oBz6b/E/1NbjkFezyt3r3fxPLq37lynX4w0raM3kUdiWeoWRFINGx1v5sQ6sP0jPz6q5FbxlUcWx1WjzMrPP1/UyKTWFVug5PgsD9p5eqvW4ADarRg8MmR/CT2lWKTrpxhuMJSL4M0D988NohNZSdQQQRjCiMp779bt6o4PFGsBf82LxpJlGQ/Izhu0nAth/MwYov5t/6H2MesyDd5ETzRtsItvm3CxNn34FepbIF+wpmRf8MwKMZ8hqhdoQFj7pGkjN6USb4YqdWWpP0vF39MhU3k58oDm6vLHgtLPu2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eYaRFbjyv7Va8gtf1uQhv8Pnn67W2GnfF9vzJWwHEU=;
 b=jnN1ju7kqNUUJPl1hwrJ/KrsT2bgs7UEIWoSezinfJjB5oo8iRTCav72OMEiP5CUBw2nR/xJPzTXqL7JWqCQ/zTnhzFHYRuQkrc5wBir8ve1sVYH8bfLoeJZcGs330J7jdNAehn38MbAunX6tUqqQX5uW4I8x8Gbt+2m/Ya8PFqkCzW5whBfipOwmPw7SU2D4u2z/+2rTyelcPg13Xygg8u4M8+Wpa5Hnu6w6rmCzi1nb4lW3xdW3+zEsLGSt1JlWbh243McFa3zD/c7AeK7YkkN7MsfgpDnJcHd9QfvEY1DAW1z/m6g/CeEUhX1rg0WtI1uA0bgJZDH11Xvv4RZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6)
 by PH0PR11MB5832.namprd11.prod.outlook.com (2603:10b6:510:141::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Wed, 18 Mar
 2026 13:03:27 +0000
Received: from CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f]) by CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 13:03:27 +0000
Message-ID: <9da26866-ad1b-4889-b050-6384cc68e3da@intel.com>
Date: Wed, 18 Mar 2026 18:33:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/12] drm/xe/bo: Block mmap of DONTNEED/purged BOs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-9-arvind.yadav@intel.com>
 <2b12e3a06e3fefd2c3574c996c040be8a0bc76ee.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <2b12e3a06e3fefd2c3574c996c040be8a0bc76ee.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5706:EE_|PH0PR11MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: f94ba681-bdc1-4f25-469c-08de84eebe61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: k9eOPRGbCBk+Tj5gxv+ky+O9YSdrKkuy3hrUQfvGm7DuiGHA9taGQMNdJx0KLo59s4LsbfX1XlZPwFavHWQeF2vAJqF7q9lvcLBVlDCDE8EMRzrHxE5d4Qzg+MJa9jgpbrrlDzhv4/0NQT2qa7kqjgGs+YqlVkzvBL7zGwTSbDPE/3X8AJejKSrGcb3gGgMZ7xJMHj+30IgM3u0CM/AceZ1QTIljY6rNjzhbRkFTrvqyc/70oN5rAyRjSdzFRs8fHQz0dJdSSZOevYmbqai4goLYq5ViQGI3yhHyAbaDeAHOWtDeQyJGloM3mqhZPkcYQGTtsaY6xsDby8xk/UeiSHUqRk1ZOfqWa003SW8Vv/S4PvwF2rMQniOnU9zl36NYy0B2y2lPe0xhThnPZB29lR7bMeoi/Dht7ClVkK1/DNEZrhpj1pmz3UHfmLiV7mEUl7UiVv6cnkcxZuW3wBsAF8TbNENvU0J019QskEwggsR9I/vypp5XKC5Eyxdhwz7gZg91zRthJCl0eDEEKmJAWJFb2I/8ZyjLq+7ZHFE6NcusMCRdFsL8Cn4E04DUxziPGCkdN8azejuKKNpQIkyP39j10TqapT979+10PmCMLTGrXJaZzCHsLu0xD2hVIvqY7smp7F17dN4f0+qCrWH1l8OUQwOB5HOpTf/7lHGWzcmsvAMUki2o3JO5LqNlo98MK426mLpxG+5HJdRBJC2ZEPRGSz/ksuQhip6KdYNxdyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUwyWEJuSTNEUUhuWCtKZjhPalJyZ21nQ3RIcDg1d3ZmRTU3cVJtZFFWSGNk?=
 =?utf-8?B?bVFSd3VXT1JKdjNJSmRtaDJmMS9BK3dES2dQTUZicmNXRjNWS0pjZDlaalY2?=
 =?utf-8?B?YXBHTko4Y3V1Z2Q1WWUzTVNLaDA5cTZBYWNocXM0OGw2NmpaZWF4RTA5YUpi?=
 =?utf-8?B?MjlCVi9BRGNoL2FUOUkyWjdwa2l4RExsNGcwMDFyUFFSMzFDZEUrWUlPaU1z?=
 =?utf-8?B?MHJ1T3pKVWswZDhSYTZ2V3VPK3A5ZWovV3RycUoxSmZQOTNIRVNVbTRJOUNM?=
 =?utf-8?B?dWsrNXFEaWc3NlcraGNmekM3bldZWldhelVrQXdGREpVaitYNzBxVDVWZHJt?=
 =?utf-8?B?aHRPYnQwK0tLRkNOVGkwLytJT1NPSk5yOTlWdFp1M2N3MUVNQXJMSE00TjB5?=
 =?utf-8?B?VDliM3IwM1I0V25zcHUyazBjc3Nkb2tkTisxbUxtWFJaWndFRk9HbjRNRjQx?=
 =?utf-8?B?ZC9BY2RiYWd6ZWE1Tk53c1pSL1NKTzBjYmVyVldLVHRjTmo3TmNNZi9XblJp?=
 =?utf-8?B?YzZ0NmJrRnQ2Ynh6c1FncmVIYzFKSGdOd3BJOFhWZU9MVjF2b1JhMTJOM1I1?=
 =?utf-8?B?T2ovTUJXckdkNlpuaUpjSWtaM0p0NGRBWHgxTDhTME9KRk5KMkQ1eVRIZXVn?=
 =?utf-8?B?VTJGN2RUUUVrb2dZcmpzMDJFVGpDbXY3NWJDTFc5Zld2ZkdjRjQrQm0vaW0w?=
 =?utf-8?B?WllVZDdnd1J1QzdVZCtROHo5dzkzRHpLRWZ4Y25tTTZMODhXUkdhdTZ0NzZi?=
 =?utf-8?B?WU4wVTBIUFB5NnFLK1hMaE96NytNYmNvVStycDUvMjg0U1FiNXJvdFRmamdl?=
 =?utf-8?B?eHMwdWl3ZTdRd1FJWWNUVmpYQVFvVEFrMlIvZEpvK3krMThERU5oK2RZNHJM?=
 =?utf-8?B?OThxNHd2Z2hmTElMYWN5ZVZ1b1lNdFo1bWdZK29UaGdNTzJ4RVFSMlRKQTlj?=
 =?utf-8?B?Rnc3NndlOXBCVDV6VGE0TXJrZTVFY2NkOVA3OENReTdrZHFRZE52aUl4OWkx?=
 =?utf-8?B?TzBDSW5QRzhFc0hkWGhNMmZIK0VHS2pLczhZaGxuNnJLQXhyTHRhWWR0a05Z?=
 =?utf-8?B?bDlZd3JwaHJNbFJONlNZL0JvN1A2czJtTnNJaHVVWWkzRFhzbi9sV3c5RjlS?=
 =?utf-8?B?U3gwTDZHbzJIbkQyTFIwZ09IbUlWcC9TUEQyVFdTVzhWbkhiUHU3SEJjQi9Y?=
 =?utf-8?B?ckJHYnhIMzEwbUhOZSt1M1lud0kzVFdmd04rK0sycGs3bjBsa0sveGxWM3h4?=
 =?utf-8?B?TjR0UUM4RlE0T25majdEZGtXS1FOOEtzMkpmVUVwb1JBZFZvV3lQZ2ZFWXZr?=
 =?utf-8?B?NFRjVFIvWHBlUTBMQjZTeHYyWHZlTnlyQ0xOMm0yV2pmQkVDRkNWbVZIdVNs?=
 =?utf-8?B?dHZPK2dSN2tFQlp4WmpXeExRWVlpalFzNGdlellYbDlQVW1MaUhPNnFWMlVo?=
 =?utf-8?B?T05zMENvV2pObjZBTGt5eXhxU1hGamhSeWszdmlvbHhxWnZUMk1lWk05eWw3?=
 =?utf-8?B?YmJIeE8yTDZOTzkxdStCbFNLeFBpOFRiVm1MWVpVRVJBU3V3SWJueVV6RFN6?=
 =?utf-8?B?bUlxK25walh2VU9pbjlSRzg0T28zYStoMWNKVGpiSVNPQU9XWWQvK3lKN3VZ?=
 =?utf-8?B?MjJEcCtJQ2YwSXFVaHRDdmhtSTNib0phYkZVZktIclFHTklOUlpJVCswOC9P?=
 =?utf-8?B?bDVCR1lXNDY4M0JxUGx5MlRuVXFZclI3aHpMNng3QjJoQVJ1STdVeVZ4eks5?=
 =?utf-8?B?ZXdqN3J6YUU1SXpmQnFwYnMva3JpOEk4M1lpTEI2TkRaUTVmZG8yR2dpL29G?=
 =?utf-8?B?UG9pSzlPR2w0c2NWTC91NjdWZWhjK3F1eVdQaUw0SldKem56NzZzUERGYTlM?=
 =?utf-8?B?M1hmTUtRREFJaFBHRWdubnVFU0Q0THIxRkZmWjVxM01leHZWZ3FYbktPU2x0?=
 =?utf-8?B?SDg2V2lRcnNJdlNCdTZ4VVNZSGRJaXBKTWhPalpjZWJWSnRiYlZudk85T1Rh?=
 =?utf-8?B?ampKeURqWG5LVkFjVUdleUZnVW4xTjl6QWxLclJnN1hrSDBtd1ZUYXpxak1O?=
 =?utf-8?B?R2dFeVJUcm1GdjZveGdVcW9NVFJhalVWc0ZWUTBmaXU0YlF0b0ZYV1Irb2VT?=
 =?utf-8?B?a0oyM2c0QzZCQ2ZOVFdnN1dHM09Pd2hUNW1iZzd0QXpiaXpwaGV6OHpLL2F4?=
 =?utf-8?B?MTA1R203MHU0bWpPbEdsZUFXcjFWQjZzTVJKbkFOS3ZKSFFndmpDNytrWjZj?=
 =?utf-8?B?SGJMelQ2VHVVUWZiN0JyUi95U3RUT3A3OHlwTlY3NGFVOFBFMDBNZjFhNTJ2?=
 =?utf-8?B?K1lad0tJV3Yzci9GMlhxUTQ3RGZFVnJ3SkRTaS9MWERha0lWQkc5UT09?=
X-Exchange-RoutingPolicyChecked: mUFRBfNnTLfMxCCZZScsm98TVzm9SncbO/6kAoNZj5WSfg/yM1GjhDBR8dwJ+BmnBZsLN6zyfYMpThpGNsJrx/gjkcxycDdPS9SPmyzNuYuLsYUPXAfzgUMFRuikSxBkVRJDgU5IWfEXpArlWVNj+s763YiF4/R94H3J7JSypyk97qQzBHYz8LDUmPDTedyMnGvmbDh12oeU3I2R2wHcTHhjCp+M6ClaE9YgXmQ7F4mE5giX0Xl/DjlHbF+nSkjXpGD74890UfgaqOp7cwvljIvPb/N532Bl+ipAY6Yewi67/uF8GSb1Mo9z+d7Ab/axGxHGmWp1wIeMSPTmi0Q/kQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f94ba681-bdc1-4f25-469c-08de84eebe61
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:03:27.0842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqRjMBDPOV/haAoSPgg8iQBSW979R2p0BBkSyLiePyO1yGmd3liemDqFUXQeb5j1kGuDs5EftJipNrjPX6v+YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5832
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


On 10-03-2026 15:47, Thomas Hellström wrote:
> On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
>> Don't allow new CPU mmaps to BOs marked DONTNEED or PURGED.
>> DONTNEED BOs can have their contents discarded at any time, making
>> CPU access undefined behavior. PURGED BOs have no backing store and
>> are permanently invalid.
>>
>> Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
>> -EINVAL for purged BOs (permanent, no backing store).
>>
>> The mmap offset ioctl now checks the BO's purgeable state before
>> allowing userspace to establish a new CPU mapping. This prevents
>> the race where userspace gets a valid offset but the BO is purged
>> before actual faulting begins.
>>
>> Existing mmaps (established before DONTNEED) may still work until
>> pages are purged, at which point CPU faults fail with SIGBUS.
>>
>> v6:
>> - Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
>>    with the rest of the series (Thomas, Matt)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 28 +++++++++++++++++++++++++++-
>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index d05a73756905..3a4965bdadf2 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -3396,6 +3396,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device
> This needs to be done in the mmap() callback. It should be OK to wrap
> the existing callback there.


I will move this to mmap() callback.

>
>> *dev, void *data,
>>   	struct xe_device *xe = to_xe_device(dev);
>>   	struct drm_xe_gem_mmap_offset *args = data;
>>   	struct drm_gem_object *gem_obj;
>> +	struct xe_bo *bo;
>> +	int err;
>>   
>>   	if (XE_IOCTL_DBG(xe, args->extensions) ||
>>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args-
>>> reserved[1]))
>> @@ -3425,11 +3427,35 @@ int xe_gem_mmap_offset_ioctl(struct
>> drm_device *dev, void *data,
>>   	if (XE_IOCTL_DBG(xe, !gem_obj))
>>   		return -ENOENT;
>>   
>> +	bo = gem_to_xe_bo(gem_obj);
>> +
>> +	/*
>> +	 * Reject new mmap to purgeable BOs. DONTNEED BOs can be
>> purged
>> +	 * at any time, making CPU access undefined behavior. Purged
>> BOs have
>> +	 * no backing store and are permanently invalid.
>> +	 */
>> +	xe_bo_lock(bo, false);
> sleeping locks need to be interruptible whenever possible.


Noted,

Thanks,
Arvind

>
> Thanks,
> Thomas
>
>
>
>> +	if (xe_bo_madv_is_dontneed(bo)) {
>> +		err = -EBUSY;
>> +		goto out_unlock;
>> +	}
>> +
>> +	if (xe_bo_is_purged(bo)) {
>> +		err = -EINVAL;
>> +		goto out_unlock;
>> +	}
>> +	xe_bo_unlock(bo);
>> +
>>   	/* The mmap offset was set up at BO allocation time. */
>>   	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
>> +	xe_bo_put(bo);
>>   
>> -	xe_bo_put(gem_to_xe_bo(gem_obj));
>>   	return 0;
>> +
>> +out_unlock:
>> +	xe_bo_unlock(bo);
>> +	xe_bo_put(bo);
>> +	return err;
>>   }
>>   
>>   /**
