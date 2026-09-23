Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECDCC98307
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 08:47:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D2D10E2FC;
	Wed, 23 Sep 2026 08:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaeohO+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D020710E2FC
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790153261; x=1821689261;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T6TmvrgcIJBv6XxFSbOL6c2BjWtPdORQmhq0TUZDzQ4=;
 b=QaeohO+WNw0ERXmbecmvGlN8AlzadhLZHPki0mur/M4RKAuQO5pKUJCH
 NKoF8daL3jsbV2h6Xxulce/wFjlcTvaMuWCkwQIlkHuf2e/fDrizQuuHC
 ttvM6o4TztlHrQVz8xdE9swkRphWV4wZ3F61fWlVGAnx9EkGSsilbgUaj
 UDDLLvEiHu6GVtWSPXpcbDoCajCHJ4xXPuSTqT9EnmOVzLsFvTTW+uRgD
 qgG24wHlkgWD1dfteF/Au873pdcnrwHw+CwLpAZf/Gb7pInGwp7IK+MVf
 cAIpthIwRTJ6Rc5ayb47M8wsEgOJQEar0q6K0+QYGP6pXjFhdnKYg185p A==;
X-CSE-ConnectionGUID: JhGNjwQIQdCLk26lZ0naYw==
X-CSE-MsgGUID: 8OaFZiiuQHu8TbvV9NWvjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89744090"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="89744090"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 01:47:41 -0700
X-CSE-ConnectionGUID: RmTzmAlCTUmHZD8njopP+w==
X-CSE-MsgGUID: GrjyBivXQq6oYnpf/6qOTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4594062"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 01:47:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:47:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 01:47:39 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvSa7BxaW6h2eUFVqyK9+vnO1irdwvQZxfq78vZZP/qnqeUnc1adMYNsQJCvLtQTKo7RouBK6cLISC3EUh5UFi2+5prx95uBeZIri6cWXtIpWtDiRh7l1oTer5xGK8dY1CBzMP6AZ6moPIyUOy2bRJ5bSOcCm7nMaEvqN6GOzKljAufFMAtL8J2a2Wv+SzJh2EnQc6SOJGCnWhPTcu588kBN7k/UBkGULIa6mOLaWp0Nedo+0BIyQNW/FR3m4sj2pCxNSr7ihhlhH/wWEYTgSmJqFok1Kuz/5yR8Ldzc05CLMVR7fFQfv2ZksLGfvvcqIQHwuMQ/TP/UPmkV2Zyo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kL/uJaNlbvS7fdGsVoXCSxY8hj6slN2MEPxsXabogMs=;
 b=ibZ/wWsp4CdI8povZn7cJ6J3V0Ydu7WFiFUJBicNZRDcbTbcy4phAVfMEwVmL7V1hx1xHNvq1RT79FZ5ojsRca04K5DFYjM3w/Fyuijn15x0WE1PYepH493vnjOQqnYcAZy7GrYX3GyeH0UKymboIX2BuVGsWfZg3MTzJ0Z4kYcyMvpLR1K0FN1XCg0hzvcJTfSHpTOgkbsEXlpOQPqOs3lbndQ+Nzu2femkDyeJC44LuqkwlD8ZIlrVlC84Sqc12x3QtKfi8OEWlKB0Rb1yqCneDM5ZDFTxR59G1qWOnj44UFIYXH+lRjNzBscq2EjtTZlgwqkpCB6A4M/zdsgnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 08:47:36 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 08:47:36 +0000
Message-ID: <00df2a6d-65d7-4274-885f-7e845c94d7fd@intel.com>
Date: Wed, 23 Sep 2026 14:17:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 20/24] drm/xe: Add ULLS migration job support to ring
 ops
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-21-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904211613.3934307-21-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0059.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS4PPFE901A304F:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4b2e79-6877-486a-5f71-08df194f50ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|11063799006|3023799007|6133799003|10067099003|5023799004|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: AplUjQLJMMzVDApLOlXi8TKBXWVZWC6EEMP6OuH9Oi/Ow9LdNevaoGUUVYdCOLmRfXV3Ehea1pe3zTjNde4r/MYiwbb0DRmzkOhA0sZykMI9VlIa7/68PvV08GQgd86rMT3AW+tQA2doUU7mNCTQBML177n2022Sj32R6/U8lH+cd9uU78ERFuT92uEiHk0fnowlOtZ3etEqnUVRsOjTdyysjpjMeMNHS3QCj2ibBfvU2nL0mKNmoDP5ew5O36BBROoOa9uJkkP0JjYVrH+8fmEtIXjjU1XH7wHqpuzW9YnpBlDBOi+GxW2kJX/lZiQuJcbImFWwp3v9lvDoIE82JBlBrh2MF7pzvYDCYt8NtDmodr5X0fsmru2Z+i63HbRYgLxBj346BGzVivV8zAJsErqAr8XysuwhlIwuJatFA4oB5CPCGDi0NZDSwXtNCJJS9LBmse97DT+Y1Fv4ZtTTu4qZYdMPn990lDBYJlG25H55XyB29iHdYBoCn1L+fDdlxSsphaFVRhs6dkKtSbEth3JSHtBTPp7SVbwtl9b9QReew2kcUndpdx6XPSL/lLM5E1vEkz09dQFkigPKMhkx8/3qsyG+dp6FJ1ervuucpPSX4gTweAtbVrxEPo+j0VRU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(3023799007)(6133799003)(10067099003)(5023799004)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2FDcmNhdElJZlhBWVQ2RFhBNHF2UEViKzB1UlJNamZwQzEvS1hYWmhBSU5H?=
 =?utf-8?B?dlJ3NU9xajNRMlRIb1ZKcFRSemlERWNtMndwQ1ZjWVkrNFVicSt2WVk3Zjhq?=
 =?utf-8?B?OVhiVy9uWk0zVFpRTVV0OFhXZ1pCTDZPakphdDl1V2I3TWxaYitaaklPWkZ6?=
 =?utf-8?B?eGJld253UlJMSUk2YlZkcE96VjU1aytaRVBSaDQybk4zZ2s0YkhyMmxiTnJY?=
 =?utf-8?B?TmJ1NFhKalJsa1dpZkNYMUhvejZKbFNEVU9vVWNFMW5pdlZwYjkxNlRyUlk4?=
 =?utf-8?B?aVRtdGkwWHlJdzM0SXNLOVdSV2pMT1QyL2gxa0RMcEF4SzlTRlF0eHlLbVhQ?=
 =?utf-8?B?Y2pSY3dxa2FCTWhBNnhGQTZSWXhzQlZrbzZGZERnQ1R5VzRhZ3NUOC80OGhs?=
 =?utf-8?B?amhEQ2NiRlRtNU5zUC9hSUppMGZmZ2JqZjhiTXpnbDAvbWx5bG5OdDI1VEV2?=
 =?utf-8?B?bSs0RXIzNFAzUnBjeFVyU2NacjA5UENSVDhqbTNGLzNSSU43Rit5aGxERXlh?=
 =?utf-8?B?QmRzbHYvYTlwQUtzYTIvdnpsVWJqa1BMMDVsNURaaFJZeWJ3ME41eWtLM3Qr?=
 =?utf-8?B?dGNCT1pURDNiVjZNVzBJUnpvZEd4bW0zL09JSXRiR20vaVhKMlZaNkNJaFcr?=
 =?utf-8?B?S21IVVBMZVNheFd2Q2Nmc093SGM4TVJ3V2RUN0dMVVFJZHdmQmRNR3ZGQ3p6?=
 =?utf-8?B?WjllK2hMa01URG02MHB2VVBjZTdzekRhYktnOW82MUxOKzk5K2M1bkpDMHQ2?=
 =?utf-8?B?VUE4ZUpVNThGYXdkMVdKRGdkeC9LQS9pclp0TjNiOXdpMHlxbXNaK2RPSWxt?=
 =?utf-8?B?eVpneEZSYnNhdUF1cXBMbFVBWXpSQW9GYUN4SVJzVTRGb0ZzTkVxbEphblZn?=
 =?utf-8?B?c1ZyRWd6Z2JGN0c5ZVlzSzNNM2V5MjVxWFRoRm9sWXFwdWZ1R2ZmQ0JXMEt4?=
 =?utf-8?B?SjlUMmRZeFZwVXA2SDVueW9YNWRMeENyK0Q0QnovNVpTbWVmQ2x6YjlITjhP?=
 =?utf-8?B?d29oTUFoY0dCWnVXVDJhbGx3MUo2VUswSnJGZ2huVklsbStTQU1sWmdlcElB?=
 =?utf-8?B?VjhueEw1cVRwaGNXbkFUdDVMZzBKWmJJSitBVTd1c2xRYkxPTElDYkpBcXNa?=
 =?utf-8?B?eEJWalp2NE16SmlBZVRCY2dleFVOZ3J1SXljemQ3KytBaVp5NS8zWW1OTDBZ?=
 =?utf-8?B?ZkhjbCtGMCs5N3R4a2hxcjlteGM5TEZjSXE4NHVJbjByejJCaGtIZVVqVG1N?=
 =?utf-8?B?aEZwbDN4WjcySTNLVFI4Rjh3WDExMVF5cUxsazJpZmJLR2dDNEJRcmxVRlpS?=
 =?utf-8?B?YzVlaFMrN0l4a1VUQlJleU1uVTlkOXpDNFY4Z2ZuWi9MR3FVTFpWN04zQ29i?=
 =?utf-8?B?dFFRSW9URXIzbzkyQ3ZqeHQveTUvWHNBZ1p5L1FwY0podkdlSlBhVTRiMnpV?=
 =?utf-8?B?Nkh1NGYzZkxwWVhuTkN2SWZWN1o3YkhIYUo0YzcxcEFYWFdzcmtST0ZFZTM5?=
 =?utf-8?B?K000UVE3cDZKUTJjdXVTWFJZSG5oYzdkc2g1SGx0MERvbWpnNzBQaTJCWG4z?=
 =?utf-8?B?dHZpS3MvVDcrdXlBSzNRc21tZ1kwUkI4RkprNm84RDRobDJqcnFRSHlqNm5w?=
 =?utf-8?B?UjhsUWdlTkVXOE9OMXloekkvVnlOMGh5T28xL1lIM05Cb3RRem9YRWlKS09l?=
 =?utf-8?B?WWliQTVyZmFDNnpEWVRNeU9FckxnMEdYNUIvQm9oWkRWR1luQ1h1M3k5UDY4?=
 =?utf-8?B?Z2RjUC9LQkcvYlhnK0tyTitXZFpOZ1hHZ1BFMTJ1QjRGeWhySnZXYTBUb091?=
 =?utf-8?B?M2l1QmJFYkkrZlZDYTNYclhxakQraW11eXU1ME4wMVdNZmhxODNaRHhiekZr?=
 =?utf-8?B?ZDVuTnIzNFlTdXhZS3RiMkFSVE5LdkNXRGNOVzlnWDlxZ3dVQ3lhblNLYU1Y?=
 =?utf-8?B?UWVBU3NTaDlqcEwxL1hyOTZKWTY5dEErbnhOR010bjlya1VFTzVURXR6SFN6?=
 =?utf-8?B?eXEvL2xNNm5WeFpxUHdoTjJmRVBpQlhtb1IwbGxtMjJyaE9LQ0ZwakthaFFZ?=
 =?utf-8?B?RUh5R2kwT3plTDdIcXdiUzJiRXpUeU96Mng3UEZSVTUvZklWTTUrS1dQYXg1?=
 =?utf-8?B?KzRHWE90bmYwWXJyMldOLzNvM0RzbHpibEpXZUx3NnhHNGVHTDk2aTZqVnIr?=
 =?utf-8?B?SUNMbjhsTWxXa3VoQ3V5QVJxN3B0OVQ1aVo4YkVGcFQ3MkVkMkFBVU53Qzlq?=
 =?utf-8?B?UzZ2ZVdlUHNVQ0g0bE5kazlWR1F5WkkvUXVwa0xPNVdjR2dqdjVtU3k1d2FM?=
 =?utf-8?B?L3FVbXFrQThZTjNlVzlzZVpidEZCSnZ5MDVUNytwc0YwbEh6STkvRjVFV25a?=
 =?utf-8?Q?onpAAb8+mZCwybDE=3D?=
X-Exchange-RoutingPolicyChecked: RQd2HQx93GgKpEbjm5RkDoH5OYg9IgQ1TNVjoPQIFvusft6t44bOONYClVC6xD/Lf6I19nM5/OiTPnTqN9rQcJJzIWNgLZtZx4N/yoaV8Z5qOlkJ3ZDu588UmAhNlHHaxfcBSOIhuRBks9nomCSnyBhXlZ1GQbuDZCW6E+dwQ1Fc3iuSIr4xbjjWAM2yHJ6Jfny0rzfhcfs5T2J/J64Q5I7WrZ1b0szNzUbpW5c8BfIgSg5WPIRTnDK7f0Jz53sCBbXjPRheqsAK0g2o3IIRx1yGor4+JFEzWVS7TAPOol55i72G3W19kLIprUlga+BtGTp/qO0J0aOBpDCuFn0rZg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4b2e79-6877-486a-5f71-08df194f50ce
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:47:36.3579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7MrS5rZ7P66p/zsKgyXN1yRtDYVUpNEsxi6kQQhMAlglt5i6moODoXlWupA3C0pYgiDmrKHUCQtXLPPIxT50hFndk/qzR/gqxPOhtL2qS7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE901A304F
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



On 05-09-2026 02:46, Matthew Brost wrote:
> Add preamble and postamble for ULLS migrations jobs. Preamble clears
> current semaphore for reuse. Postamble waits on next semaphore which is
> set upon next job submission, then advances the ring tail over that job
> with an LRI to RING_TAIL, so submitting it costs the CPU nothing beyond
> signalling the semaphore.
> 
> A job updates the tail on behalf of a successor which has not been
> emitted yet, so it cannot know how much ring that successor will occupy.
> Pad every ULLS job out to a fixed ULLS_JOB_SIZE_BYTES, which makes the
> next tail derivable from where the current job starts. The pad also
> supplies the NOPs which must follow an in-ring tail update.
> 
> The last ULLS migration job skips BB submission, the postamble and the
> tail update (clear current semaphore, write seqno, exit ULLS), padding
> the difference so that it still fills a job slot.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-23-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_ring_ops.c       | 86 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ring_ops_types.h | 24 +++++++
>   2 files changed, 110 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 39a670e91ba7..f05b4276c8d1 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -494,6 +494,79 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
>   	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
>   }
>   
> +static int emit_ulls_preamble(struct xe_lrc *lrc, u32 *dw, int i, u32 seqno)
> +{
> +	u32 addr = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno);
> +
> +	return emit_store_imm_ggtt(addr, LRC_MIGRATION_ULLS_SEMAPHORE_CLEAR,
> +				   dw, i);
> +}
> +
> +/*
> + * Advance the ring tail from within the ring, so submitting the next ULLS job
> + * needs nothing from the CPU beyond signalling the semaphore. All ULLS jobs
> + * occupy exactly ULLS_JOB_SIZE_BYTES, so the tail the next job ends at is two
> + * job slots on from where this job started, even though that job has not been
> + * emitted yet.
> + *
> + * The saved tail is written before the tail register so that a context save
> + * racing the pair can only restore a tail behind the register, never ahead of
> + * it. The register write is deliberately not MI_LRI_FORCE_POSTED: posted, the
> + * new tail can land after the command streamer has already drained this job,
> + * at which point it sees an empty ring, parks, and can be taken off the
> + * hardware with no H2G left to bring it back.
> + *
> + * The tail is published before the semaphore wait rather than after it, so
> + * that the non-posted write drains while the engine is parked anyway instead
> + * of adding a register round trip after the semaphore is signalled.
> + */
> +static int emit_ulls_ring_tail(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
> +			       int i, u32 head)
> +{
> +	u32 next_tail = (head + 2 * ULLS_JOB_SIZE_BYTES) & (lrc->ring.size - 1);
> +
> +	xe_gt_assert(gt, IS_ALIGNED(next_tail, 8));
> +
> +	i = emit_store_imm_ggtt(xe_lrc_ring_tail_ggtt_addr(lrc), next_tail,
> +				dw, i);
> +
> +	dw[i++] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) |
> +		MI_LRI_LRM_CS_MMIO;
> +	dw[i++] = RING_TAIL(0).addr;
> +	dw[i++] = next_tail;
> +
> +	return i;
> +}
> +
> +/* Publish the next job's tail, then park the engine on its semaphore */
> +static int emit_ulls_postamble(struct xe_gt *gt, struct xe_lrc *lrc, u32 *dw,
> +			       int i, u32 seqno, u32 head)
> +{
> +	i = emit_ulls_ring_tail(gt, lrc, dw, i, head);
> +
> +	dw[i++] = MI_SEMAPHORE_WAIT |
> +		MI_SEMW_GGTT |
> +		MI_SEMW_POLL |
> +		MI_SEMW_COMPARE(SAD_EQ_SDD);
> +	dw[i++] = LRC_MIGRATION_ULLS_SEMAPHORE_SIGNAL;
> +	dw[i++] = xe_lrc_ulls_semaphore_ggtt_addr(lrc, seqno + 1);
> +	dw[i++] = 0;
> +	dw[i++] = 0;
> +
> +	return i;
> +}
> +
> +/* Pad out to the fixed ULLS job size */
> +static int emit_ulls_pad(struct xe_gt *gt, u32 *dw, int i)
> +{
> +	xe_gt_assert(gt, i <= ULLS_JOB_SIZE_DW);
> +
> +	while (i < ULLS_JOB_SIZE_DW)
> +		dw[i++] = MI_NOOP;
> +
> +	return i;
> +}
> +
>   static void emit_migration_job_gen12(struct xe_sched_job *job,
>   				     struct xe_lrc *lrc, u32 *head,
>   				     u32 seqno)
> @@ -507,10 +580,16 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>   
>   	xe_gt_assert(gt, !job->ring_ops_force_reset);
>   
> +	if (xe_sched_job_is_ulls(job))
> +		i = emit_ulls_preamble(lrc, dw, i, seqno);
> +
>   	i = emit_copy_timestamp(xe, lrc, dw, i);
>   
>   	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
>   
> +	if (!xe_sched_job_ulls_has_batch(job))
> +		goto seqno_write;
> +
>   	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE; /* Enabled again below */
>   
>   	i = emit_bb_start(job->ptrs[0].batch_addr, BIT(8), dw, i);
> @@ -521,12 +600,19 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
>   
>   	i = emit_bb_start(job->ptrs[1].batch_addr, BIT(8), dw, i);
>   
> +seqno_write:
>   	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
>   				job->migrate_flush_flags,
>   				dw, i);
>   
>   	i = emit_user_interrupt(dw, i);
>   
> +	if (xe_sched_job_ulls_parks(job))
> +		i = emit_ulls_postamble(gt, lrc, dw, i, seqno, *head);
> +
> +	if (xe_sched_job_is_ulls(job))
> +		i = emit_ulls_pad(gt, dw, i);
> +
>   	xe_gt_assert(job->q->gt, i <= MAX_JOB_SIZE_DW);
>   
>   	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> index 52ff96bc4100..ea4af321dd7c 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> @@ -6,6 +6,7 @@
>   #ifndef _XE_RING_OPS_TYPES_H_
>   #define _XE_RING_OPS_TYPES_H_
>   
> +#include <linux/build_bug.h>
>   #include <linux/types.h>
>   
>   struct xe_gt;
> @@ -14,6 +15,29 @@ struct xe_sched_job;
>   #define MAX_JOB_SIZE_DW 74
>   #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
>   
> +/*
> + * ULLS migration jobs advance the ring tail from within the ring itself, so a
> + * job has to know where its successor will end before that successor has been
> + * emitted. Every ULLS job is therefore padded to a fixed size, letting the
> + * next tail be derived arithmetically.
> + *
> + * Sized for the largest such job, emitted by emit_migration_job_gen12():
> + * preamble (4), copy timestamp (8, its size on an SRIOV VF), start seqno
> + * store (4), arbitration off (1), batch buffer starts (2 * 3), pre-parser
> + * bracketed flush invalidate (6), seqno flush (4), user interrupt (3) and
> + * postamble (7 + 5).
> + */
> +#define ULLS_JOB_SIZE_DW 48
> +#define ULLS_JOB_SIZE_BYTES (ULLS_JOB_SIZE_DW * 4)
> +
> +/*
> + * RING_TAIL only encodes a qword aligned offset, and xe_lrc_write_ring()
> + * appends a NOP to anything shorter, either of which would desynchronise the
> + * ring from the tail a job predicts for its successor.
> + */
> +static_assert(ULLS_JOB_SIZE_BYTES % 8 == 0);
> +static_assert(ULLS_JOB_SIZE_DW <= MAX_JOB_SIZE_DW);
> +

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   /**
>    * struct xe_ring_ops - Ring operations
>    */

