Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84B606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 07:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xnnj4iAg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313CD10E41D;
	Wed, 28 Oct 2026 07:47:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F5E10E41D
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 07:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793173661; x=1824709661;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=o4v1Ch2hO499Aopw5D646qBo+CpC/5EpLH8GuONZn9o=;
 b=Xnnj4iAgTSbBhHFCM/3YiRqzfC/gd4zllLvPMbpgwdkw4LuOgsZZSfuX
 IFf8jF7XX2Rp1b82ZP4qMdjIKFE/9nuFtrMVfPKlO+hRUqlDkNTCwdKtd
 nOlBg5hdWXco2V58gTaIpS4AINDo3Jrt87L45OPO9z1lZSpH9Jm8If9lZ
 ra0gziHQZhLHiNkmSjxCf5skWEUyGhg9111OrWjtiVCsUP6C06Dk7uI1T
 27jNNd2EhMPFqRPgK8DbN6mQ/oG83qEBe2KpJX6MkPInSDIZ33v7xx0vh
 ymg289i1NlZFsg1uvHiNatEqPpwXjYyEnrCykx3f+Bx/YBYEUdwY8nQ0e A==;
X-CSE-ConnectionGUID: PuDnmT+nTKOCwJmxKyM0zg==
X-CSE-MsgGUID: Cx5ISWW+S+WJ2mjRzjIBVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1901327"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1901327"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 00:47:40 -0700
X-CSE-ConnectionGUID: v5l6XIqhQDeNM50vSNqfIA==
X-CSE-MsgGUID: RJYzSs4bRRCJGIMp6ikugQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4875086"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 00:47:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 00:47:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 00:47:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 00:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWy3UW/eW6LB6YoqSwzOgWozHg8BS2gQBYPU3HwncdIvCVZSZZlRx2iTYdoO/iFR8arwPTx3lxK+IEN1lpvq8TjGIWdzQZHvsxeHX+RnSd+fgCyhmGrdTC3yXJlG+i7oEbGI/bvVqGBto6ZcAg2dktU8vEZY2Z3hzeJHUu+/TOREN+gQzm+sJoWtdz8LRltTPvl5BG7eHs1utpQvHvtMgcSw8SxhfuMXJfzpoLy3ojKNZZZqaQfTZ9vY6XnAmMPsKwFkM/5dNWaGJxaWfzf0aJvattX4Aa4BM2souXYtw+/K8HecjzphicuAHZDZV8LBp2ESty2wDFrZ+a2YBikAPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCeohpszp1gT2gDcu6WKljHio7uUJJyAqICfYuiOUrw=;
 b=UMNzzbkDRQj7Mko2ivIz197DGUI4EDhzx7QKgSKsWVNYSaD4q3i3MtBjD9nMA3ttMHeBoX5ww08nJeF2tc4L2eC9vdmnscVTPRAFKRRuzHaHyVeO/KJ9+L0Hy5uud2s/EdhL+v3QUYymRpx2BCFe3rLnaH/5gLyV+FenePS/NXa9zFxoNejF4S6uSaX8go2f1CFaoFMD3A2Kn1sAuUuHwW60nD+8V5LYnIUqDpSa+Hb+5vWuT6Q7YExHdCNDRdjj60JcIXuTdI9tr3aPOKSYg65QXrnirgJ37Y/tg3c2AaXkWep2ntwNAryQrXH7MLBlFl7E98Now+/F1kybTsrQWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 07:47:35 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 07:47:35 +0000
Message-ID: <38a360da-4010-4b53-aeb3-926166f06258@intel.com>
Date: Wed, 28 Oct 2026 13:17:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/cri: Add new PCI ID
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261028072602.2035289-2-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261028072602.2035289-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0339.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::11) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|PH7PR11MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe6d718-19b5-40db-20d0-08df34c7bb0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|260925022911599003|260925021911599003|260925021311599003|11063799006|261021123027099003|56012099006|261021121427099003|261009223027099003|261022113327099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: B/bXnxA9qKeW2a+X4ByUEo2jusJfsYzJoSep0s1DND5bGPXTHVLrzD0VWbypXBMpY9pnlBOMGG3MibNqW8gIqK/oTytg485dCzv1zzVtSBbxse1q5ps5HlsHyrKp/bTEXxvvQEeXoSNknpicQvMOknNmXbV1mVIpp2F/BINcF3KyPEtWaCqdEPjArP31919/IZAiGgpdI7OI7iDLv/qAoX0oFU6ypmyDMNXe7d+H28L1zeyvKTkX0wtVXt457CCpF1IIotoIq0BtyY3UGH2QvqVmH5uywvX+J+d94uiHrS4VEg9xBt2OXau+HYkh4PBRkP6PpoB6SfrmXMCbUCpRmIkqfkeny+L+0GUvU7hxIppAKexpc+symyo9fiNFiP0m0OWbFCIPp/hkpAghnmPrWMCUkc3uHQzAI6M3cNorZjHHkX27qmfOJ/DIEInPpgFJ9ZaCHZIi9H9rCPn5q6RMNq9Gxt62ai0f7IUcptWBXJCsy6hJP+kE2LPE1WGLJWR7P6k7YsvSKROyoPOJCyLRXHcUlhw29ickQoC2oBQjaZlC6jLx/zgCxxuA0enB6n+tsrH6ckIB8x6OmP+BvOgKVHik6yYNk02GPgyVMxa8KakrfmY1PXoeP0s8qImsMHSok7fBBryDZBLs8Co6p6mQsAGWrFe/8KPCfWT3Z2fvMi8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(261021123027099003)(56012099006)(261021121427099003)(261009223027099003)(261022113327099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHdqaEQxaFFjTFNpUmF0TnhTQWtRNlJBMG1lUXBBcFBUYjlvT09VVGcxRENU?=
 =?utf-8?B?Mmx4enZMaHFrV3pmYS9QSWJ0NVhBYVNRZG5YODFXZFJRUVlnVkJKSkRlNnQ0?=
 =?utf-8?B?ZWtidFRvNDVMdmhKcTRRR0xxeFgraG1HZDhUb0hvcVc1aTRHeTMvZUpjMmw3?=
 =?utf-8?B?NFRma1ROOTVScE5MSUltVjJWUDJ1VzVkMm81OUZaRDhuTHkreW9GQ3dVY1Rq?=
 =?utf-8?B?MUxrbUdvT0daQmNCMEg4OUhXQVZVR1Npdk1EOUcxN2RNUlZaZmRGWjhJYy96?=
 =?utf-8?B?cy8wdmZYaGsrZlVoVlJlNTJvaHNqQUprMjV1bVByam8rZEJNREJuU3FlbUtX?=
 =?utf-8?B?V2svUXoxWDl1OUlkRnc0WjZTVW5iZFQ1N2hjUzgxUitRdCtURzRrQ3g0aVBS?=
 =?utf-8?B?MkZTUGxmTTZ3LzRNRnJZZE5uUHk4dE5MUm85ek90THZEZmluVFRENnRWVElX?=
 =?utf-8?B?NWNBOURibHh1eWRHWmJwTVAzaVRsSVVCWUJuVVJYQVZWcUd5eGM2OWxFTXli?=
 =?utf-8?B?aDBKWjljVEVvcGVXS2lVVWlHKzVzRTMwRTBQeFkwT2QvaW1YRG1Za2hUdXZC?=
 =?utf-8?B?cFhtc09CcWROTGpQVVR3MWpDTUdJVjNWeUhHWkRJbGZMdVBlUXhQTGNUVG5r?=
 =?utf-8?B?eFJJVk9YbFVBclN6akNLcm5rNVgzdkVubDhibkFPbnJUa3pxQ21LZWN2TGxW?=
 =?utf-8?B?Z0VBcUxKOWZ4V1l0Z3dLVHdLQTlvTHJENThkd202aFNJWlpJUUs5Um5yeElW?=
 =?utf-8?B?eUNUMnA2UFNIOHJzZ3RrS0liT3ZLSGkxSnlPSVEwWm16RWROZjh4NGJyREEx?=
 =?utf-8?B?cmhZRVF3SHQzb002NVhTNnFhZzhLRm9sYmFPTi81NHY0cGVYNCtBRnA0MXVs?=
 =?utf-8?B?SlJRZ2pXUlFrYjZweUhlTkwxSGJyS05UTFdIVmdoYnZUZTNTN2huUkVKQjBS?=
 =?utf-8?B?OEdaRUFtSHZxUHkzNHdqS0tFemdDZzRTQVY5NlRCK055WDZ5YUNxOTlwVUpm?=
 =?utf-8?B?MktXVTNnanR1WkJTMmZuZExqbHVIcjlWempFZjlwYWNJbS9ncGVLNjBzYUJE?=
 =?utf-8?B?TUZOUzZLZDEwaC94ZDg2YnBBSjdtN1lnTVdRcFZON2FoWFF5STRaT1hNUjdD?=
 =?utf-8?B?cnRhVjBWQTlDM2VFem9LSzIzS2xPUmljTFBRd2F4d2ZvbmFHa2RWRTVSSVQw?=
 =?utf-8?B?SzVRZTZweWNkS2pOY3JKSlZNVG16aE5WdDNlVmg5VXF1RG4xRzRwb2NNN0Zu?=
 =?utf-8?B?QWxSbUt5VjlaeXFUSCtSN1VqZGxEQm5xcVUzZVJlcjQrWGVGdTdvVTkyK1lM?=
 =?utf-8?B?RlNsSTd5WTR6aTFkVldCMmdKR20vWnBIdGR4c05MNEpVdW80UnBCTkxlM041?=
 =?utf-8?B?K3IvUDRVR2tiMUovSlZ0Zk4vbUltVG5MWEVCanZZMU1nbFgyM0thdjJvNWVa?=
 =?utf-8?B?OFY3ekZjOGhYUE9ORGZya2x2amVaV21sdVVtWkREU05SOTdHZC9VM0xlU0lk?=
 =?utf-8?B?NW5jUzA2MEU3VnExUHJBNnlPVU5LVEhrdkFJanc3bGl3Z1hueHo5TG00bVZs?=
 =?utf-8?B?T1h2MmVUT0t2aUJUOTF4WGs1OHNHMWlPVWFCK3NGR0ZIWE4wRUJDaWl5cFJU?=
 =?utf-8?B?VkRRbG1CNXhMV2tWcTN3WFVYY25jMFVVQ0lvWDMyekd6YmxnWU5iUytSQjln?=
 =?utf-8?B?RXltOUttTDdvTnNONjBBcm0rVWFoVzM5OGs1L012Z3pabXI4aDFhVjFJZmZa?=
 =?utf-8?B?ZGNFWktsZVV1UW9qQ2dGTzFVRFZvRSsyMUpGQWtoSjZkTFhXNFpudEFMb0Y4?=
 =?utf-8?B?bWltZTBpeW9WT1REaFd2ZFMyVDI3N2crVVgzdVhENXVHSmdwNGl6RDFzQ1Ju?=
 =?utf-8?B?dzFJMno3dlRtVWZYWXNhOEVRd2N1cnY0cjlsaEtjaU5xd1ArSTBqRVYybUZF?=
 =?utf-8?B?aWhEbUdyckd6SWI2Snh1WHFZQklRWlIyZlNXZ1ZTMlNGdzJWcjBkV0ViWmJL?=
 =?utf-8?B?WjlOQlNpQXVhYVVxdGpzTHREdlBSOWxUWXpVa2ZXUTN6ckVGRHJXZFlYN3FK?=
 =?utf-8?B?dy9MMjM1b01CVmNrYzNtcHNqSStmR2dQcmwrTjBCRGZPOGFKU3p6eTY1eEtG?=
 =?utf-8?B?Mk9raC9vUXpBZzl4dVR2eERyYmhMcVlkVWZ6MjVrNWgyV3VlWmFIQzFmdGM5?=
 =?utf-8?B?UEV3QTJZS2YxOU5XOWNHWU1wV09ZOFkvTUtZc2cvTUtLL3hhSVU3Sm1NcGdF?=
 =?utf-8?B?ZXFNbkJKSGJiSzd5bkNCdTh6MStWbHRFcThSV1lOK0oyaThneS96amJKR25r?=
 =?utf-8?B?VHZIV1Bwby9aOXUxODh5UkxjZHlBVXFNZVkvdTFtTDF6MTk5ckRFZz09?=
X-Exchange-RoutingPolicyChecked: rN7EFYHbQMeYd6TvTRcc4v0YmQygSQ19nLbq0LxqIa7uzLvGHbwLMQS+9QZuFKfY8xrf03D8lakIxWElZhFeK+ocbm3WnaCx8sX4HYm+85Wh5GNoDzChnOASvWRU2PGpzhrcgk8cewLS04e5Bp3GZQPqh1F8J565G6BgsL6Xv3BYXl7Eg0u/vh3Dy0uXT705+3ojHUCUP8KwtoVv940e3D1etRWRJzNvrjeBjBnb3bukMrhkuoMxfe8Pq7aw8cerXj4/s+pzPw70SNVVLyRl6o7oVpw3BifEOkqtTHhsndXig7PqOI8U3fQf2/2BprdpbH05RxGJ/GepWyVboSzhyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe6d718-19b5-40db-20d0-08df34c7bb0f
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 07:47:35.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LlEWr/78pB1ZIVUxVkdomKKc0ki7t3XprAou/iqPTK2JUnyp38Trq3HJHSVv8fA6sr7Fiw3COD4/SMo1rAkdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 28-10-2026 12:56, Balasubramani Vivekanandan wrote:
> Enable new CRI PCI ID.
>
> Bspec: 77979
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>   include/drm/intel/pciids.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index a2160920781d4..ac858ed26df2e 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -905,7 +905,8 @@
>   	MACRO__(0x674E, ## __VA_ARGS__), \
>   	MACRO__(0x674F, ## __VA_ARGS__), \
>   	MACRO__(0x6750, ## __VA_ARGS__), \
> -	MACRO__(0x6751, ## __VA_ARGS__)
> +	MACRO__(0x6751, ## __VA_ARGS__), \
> +	MACRO__(0x6752, ## __VA_ARGS__)
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>   
>   /* NVL-P */
>   #define INTEL_NVLP_IDS(MACRO__, ...) \
