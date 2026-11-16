Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC2A606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M+Rh0T/P;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=S81pg7CB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F7310ED5C;
	Mon, 16 Nov 2026 09:02:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5150710ED5C
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794819748; x=1826355748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5XHn1fErZ0sqhFDPMqeeadTkMNYPAcV4Qq2c6mncS9E=;
 b=M+Rh0T/Py0NQ6OOTgsBHa47E/9L37jG58ey3iARXPyrMX6Se99Lk0u75
 d9H6lYCT/2eTkzDJgD380PNop9mKvUX3RXyq7XvP0sL+tWmCEWI9NqH2S
 ge4L4dLnLl3Ud0SRLWKXRhF/YwRmdoeEbbJV8BKpNh1pIoZYNATZ6m+3o
 KMBU1sHIOBbNcR4Mbcd4gwmvJrb4JCLdKCedi0Ed9iUg/1bIHhtS+OYl7
 yCp6R6VkOsDFNcMso1JQIfBnQl1edJqRBr4HBVKVRm3ooQmJ1qctCPY+A
 rPaQYMVGe0ZjDlcbx+PCXANLalgMfFWv47BYHkTR9NG7eybPCQdMn3R8t Q==;
X-CSE-ConnectionGUID: T/YjXMZsRu+D3YGJU8plbg==
X-CSE-MsgGUID: PNqjYWYIT0iCVSHoOX43sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3561111"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3561111"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:18 -0800
X-CSE-ConnectionGUID: 6CvsNGqGSi2M5vaBtW6d9w==
X-CSE-MsgGUID: ly2ZGMQgSJ+rlu6ezwmZFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; d="scan'208";a="11275698"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:02:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:02:13 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:02:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dij9sxS+pWuuQjLdmpIFEI5IXUtFBLWxKVzh1jVEA3fOVGn6r53iZVVh+lHxl9HGsErhIME0Ls8VPHXBSAypteJG+G+UOzyC2Lt+2GkOvrmbhUKzs74Ju68Qyubyl8RfYRWPYPW80UebqCDEK4WRr8qZnTGNop+hVswwZYWkRK0LLKRkAcgUMJ4oTokUKhwZpewQ0WHKE08hqDC0CqXb0b551k/fOFFtRifpxHpINTcdf5v7xWqLahoA/TDOOAd5ibRe/ZXlGiGHgt0tl+X8dGoiWOJIitml7hMLyA0i5hoAj2j/OS8fiAX7xkX1U3h3KYbPXlFqxIC5D1n/jEVndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMuujwBZXhE/bXhCHILGdH+dF+mAhgIqCD4896xjP1I=;
 b=ZMrCKNkMj5/YhKswWYcFc8kqkwJIAE5QgijpAa4f0ABJcOOX0hMYJspnHlyBcw0zgFlkOlhOn0q8ekek6MUtoaQ9iLDdb7GcrF+LACFIOUgYW8QLAo6CoQ5xgrfy3mQFTiYUPN4nYKB2W1K1RZfUGtFr49Af1mB/2p4o+ioLr73pIR6lryLlvFN3zla4Ll8RWNP1yhajJViaybhBtKugev3xlGCKOiQ2b/othwyu2fhnC2TQYWEgs0t+1pm3BQIXKIFBIHQxiuyfSZUVMF/yeCK6FyAdWTMgvMYcJL+ZgmJJ+X1gsYydbqURDuSP27yXpIacTGbCKJrg25Gb5FbdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMuujwBZXhE/bXhCHILGdH+dF+mAhgIqCD4896xjP1I=;
 b=S81pg7CBQ+w9r2CFSyrJVrpLI1bFAfeq1UfgNH93UFsVezDA7Jy8Cfxmp4ttKWvGhPsajEvGvTJ7G9eiadH2R9aoWQe6UEE4fBfMpDXlISusLTAn4l9QPft5/as0A6cHgUBC5i7iZALwGYnY0GPjYKckkkQVrKJka04fTJgR6Lw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:01:46 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:01:46 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH v9 5/5] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Date: Mon, 16 Nov 2026 10:00:53 +0100
Message-Id: <20261116090053.2466938-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
References: <20261116090053.2466938-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 247c2af2-dcf5-4d14-fcbb-08df43c03df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022113327099003|261021121427099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: Tf7PrZCHUx645n+xtdBZ86W3sNS/rH4Ek8OuF7ZZzCtrt+8OjFU6xEMwuFQmaxP9GWLNwVyp99DLQ88cBkv6Q9aIxO3oEcH8IMqOmnTwmZIl+ViMWL5jCs4kUPjMfOjllSf/B9ztZstid5ccY+nfFfQtkzylNvUIkIHMfBLtbimn+Bx9SFpDEpAHcMvn9Zk7mTMBj2BCO/v1S+ezx6T4MoVH/rDaJJ/2Xyjh6MYfVlyNbxWCCQKW/LzNNimrxMXVEXLWPha3UBtNAb3hTzbVe+9wvsUnH/bPAA5Ye7a4mt2+PUkgeDvCaCA3sSfEohbyw8K7duKQi9HVst/EDZPLCZZv8efJn5nI0ItgLH+yk9Vo8hqlZ6ji6kII9d8/RwVk/W4HvsiegBsPTRp/T7ApMS9ojSJoguzZ5plM0fH+nNN7Zk2zV1rQLiihJj3RjJzOzX5bgiLjMU7PGkHNY4qI2jQXXdCqaAo7YbNzcDLNZXQo5y4s/CXSRRCZUh6VR3IotByeSr3xUvlyAJ2LmhiFkoFjgVooMNQlo2PL/qHJt/JSfzy4d4qrvpe/hyCFiBAOT73ZYofhzNVX3qAV39NWgredwsNNQj3u9jjmyd9NVJpYRNL2QSvGf+R9Xjo7wYx09z1tZpXkDID4h/0BCxGgL6krO5u9iAaVP/sjx/mt43o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022113327099003)(261021121427099003)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWNqalBSQjBBamNHaE5qMkVYTDhhWWJESmlUTG56Q3BSN084aHZxQnE3S2N3?=
 =?utf-8?B?OVFUbW92R0Y3cTRUUlRHdjRkaklLQitmNWw2MXVaNTAwMUV6VGZWaldiVUtT?=
 =?utf-8?B?OFhsR1E3WHRscm5oZU1ISzA2eUpYbnd4aWI0TUcwNVc0M0dsOHZwUjVzUkFm?=
 =?utf-8?B?N1lzRWZod0t1QUg5eHRid2xrS3RDOHVhai9zb3dtOGhPUDdCZkNTMU5ua0N5?=
 =?utf-8?B?cUF5Q3ZRZjZoRVNSb3kwb29aTE9uRFZoQXMyajc2Ym4wVHhuY2pVSzR2dWxL?=
 =?utf-8?B?UUJCd0JGK2hRMS9xUkJTT3RPdWRQTXcxWnI3MTFnNVZ4Y293a2NwWDRDK01p?=
 =?utf-8?B?L3BKN1IwWlRuK1JRbnhHdkRFMVp6dzFnRDNCUWpKSHpxZEF5SXVSTUo5T20x?=
 =?utf-8?B?TUtjNnIxUStORnRvWnFJY1h4ZWFTWjVDdCtBRWEraEpzQTVZanJzM1dmdWY5?=
 =?utf-8?B?eEJUUEhEWm0xUExxcDkrWFhxQzV5NFJ1Wkk5L3RJVEVDYnNvaGdqQ0g3Mmgz?=
 =?utf-8?B?eXFwN1FTRmpINnBoNFB2WTdKYXpEOFl4bXkrNjE0cjV4ZzE4WTlDTmZiT0hB?=
 =?utf-8?B?MnJPby9DTy9oMGpyY3o2YkRDNnN3NUc2emtXUUNHYm92ZytrRko5Wmw0cTU0?=
 =?utf-8?B?ZEJnWHpQOVI1SG9rMDNiKzdhMzQxRnZRcDV4NTh0V0dZNkVKLzNGMmZwS1B6?=
 =?utf-8?B?RHdNcFg5NytCazN5RS81UmtFaEMxUEhha255ZkRLWmFVa2ljcmh3SDRJUldr?=
 =?utf-8?B?V0Q5UVYra0R0eEkxQ0VlYUQyK3p0OHBFMW91a2h0Qmo3ZWdlNVRWekwvZm5z?=
 =?utf-8?B?dFk4K3FzazRPVUdXNG43SzVqYk9mNUZYZVBaVlFtcWY4Rk1yZFZxL3d2Q0RB?=
 =?utf-8?B?bkk2QTR6eGhGNFhuWkRtY09BSW9CS25PM2pIVGxhakJhZ1lJYitrZHMyQnRL?=
 =?utf-8?B?RXFEN3pxT0d5cExUNHpONEZQa0lBQW11dDNnRW5ObkcyLzV0MlhDKzJzSDhX?=
 =?utf-8?B?dExSV0Nobjd2TnJ2b1luUDBTaFRiWDFlcm9heEVjcWlSbDRWV0pTa0pIRDQx?=
 =?utf-8?B?N1haeVpId2NPUmtidTZPdnhXRG1LWElBekNSc1hKa0k2cmp5b0VpdmtZVnNE?=
 =?utf-8?B?bEYwa1lUN29jaVBXU1lHQmpoMGc5TlVJQStQTzZ6Y1k5RWhxTWFQNUs2YlRo?=
 =?utf-8?B?VDVBTkpxSkFHajFUdS9Sc1NoS1NDazl1L2VOeU8yQW92NjdGbml6MjJEei9S?=
 =?utf-8?B?TEVDUnFHMnNReFhRUmdvVWRhWE9obGN5TGhxRVp1NTlJdld4UUN5YmpGNEZK?=
 =?utf-8?B?SXJ1STkxSXNsSDhLblhKOGRTckdCeDJ6WWFyWmlSUDVNeElLcTArZ3pNNnNv?=
 =?utf-8?B?V1Y1d01WVmp3TnFFV3N6blhHeVFvTkY1S3VMcjA3Q3VZREMxcXlXVmUrVmx2?=
 =?utf-8?B?OVF3dFBIcE5tTEUyWGRZK3FvNWRoZ2NBRm5kRWtLVExqNHZzdnRpQ2dJbEpT?=
 =?utf-8?B?aVdjS3dndnkyTFcvYzlSdFRBcGlYMHdGZSt5NW9tYXdnUjZmZ29ML3NFVWYv?=
 =?utf-8?B?anNvMHRScDFYOW5YTEVHdDFabytjQzNheDJHd21nNGo4d0ZNZHVNYjhSUjg4?=
 =?utf-8?B?N1VxQW1aZWVrdnZzZ285UnFFQysyTWpRTHlNS2UxekVtNGdOOUJiZ1gvRTZF?=
 =?utf-8?B?Ly9aZGVLNjloeHBCNUJPcHE2bTBKTFBHUGlRSmVJRTBkZnpUbk9Uc3dDZ0hR?=
 =?utf-8?B?L1ZUT2xsbVpyYXJZVmdxbmdTVUhURDFpelVzdHRwVC9OeXFERlNTMUZSNlI5?=
 =?utf-8?B?NW5LTE1vdTBxb3owVTg0MFFEdVg4YWo4SXcweTcrUHFycHNuUVZtOTZ6RTF4?=
 =?utf-8?B?WUpqMVpxdlJiM0VNak5pSjZ2c3ZRSzJLd1l5bC9DcTdhVy9WaVUrZUpOc2lX?=
 =?utf-8?B?ajdLZVhuQmxFaGlJekFRT1JSWUozYmVmclRTUFowRkNPbGJMSzRzSWtPWTRW?=
 =?utf-8?B?ZE5LMzYwYnBsMWx0bHlpUURaWW1LUUROY0dIblBDY3pkVWJDYkxKVElGaWdK?=
 =?utf-8?B?RlJKaFhFS01DREU0bVJTVk85VUluaWFRL3B0ekxVNXFGK2xUQzdyd3J6Y3B5?=
 =?utf-8?B?OWpwUEVZN0NHcWVtdmp2eHJnL05jTEpXeHpJUFVGYjFiK0J5RVNuZHI0Wm43?=
 =?utf-8?B?YnYrTzRYWWppWEs1N2o3VFZteHVva0UvbHBEWGFKeW9jdkw2MUVBN284QW55?=
 =?utf-8?B?d0VuelN6amIyYlM4UloxeEJ4Q055aVVLTWVUL1AvNG8wcTNLbDhYV2Z1ckdY?=
 =?utf-8?B?TUhCT3RJZVUzWmU1cnNCRTN4dk80cUxPMWxpcisycGhQb1E3MWFzVXI4Q1gy?=
 =?utf-8?Q?c6+QxtQCkJWc/zF0=3D?=
X-Exchange-RoutingPolicyChecked: BvE1mEt4pWzl4wxu5VJZBtuoKXNEcwI5DL0pqWL/hm9zeTIsHTpqjHkjMYaamYIRmYXfJTL0Vo8XPn48Umau7j3RlbFaPaXUDn8ibPEEI2/+gWsW9Wehb54ePgaN3VcWRXX477LOcZ+KJDtC+e2ErEHgcruv/RifUQljkn7gP+OoguvfcWyXTW8qxM4u9H4KVYfcvZJliCIpuEtinTIvHOg2JncpvIHtbovs+1HfQh6aXUMYj8jJ3uxAlfvyNJj/HE2otJxyxkVm6KOfEr2h5zK/1ejyDn1d7rFD0Rf81+tOB1ynH4C9kIxtwNAjJ/K3+5IhfDxWBbJEyzvYqVg16w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 247c2af2-dcf5-4d14-fcbb-08df43c03df4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:01:46.4423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07X7zMINXDkdtKOWn5kv2hVSm561D8JhnQI5RTlaWClGZjeHSWDORnaYvCPBV1WgN51f7nEIN2D2I24omcnY5Wu//sEhw1WnnMVIIa8MFXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add GGTT KUnit tests focused on the newly introduced usable and
shareable pools.

Cover range initialization for native and PF modes, including partially
overlapping pools. Exercise allocation direction and conflicts between
the pools, as well as the unavailable shareable pool and requests
exceeding pool capacity.

v2:
 - Init ggtt.lock with mutex_init() in each test.
v3:
 - Rename the test file to use the _kunit.c suffix.
 - Use shared GGTT setup and cleanup helpers.
 - Split PCI IOV coverage into a separate KUnit suite.
v4:
 - Release allocated nodes through KUnit deferred actions, so that an
   aborted test does not leak them into drm_mm_takedown() (Sashiko).
v5:
 - Move ggtt_test_insert_node_shareable() under CONFIG_PCI_IOV to fix
   the !CONFIG_PCI_IOV build (Sashiko).
v6:
 - Use the root tile's GGTT allocated by the fake device instead of
   a locally allocated one (Lukasz).
 - Reuse ggtt_node_remove(), ggtt_init_native() and ggtt_init_shared()
   instead of open-coding them in the tests.
v7:
 - Rename ggtt_test_ggtt() to ggtt_test_get() (Lukasz).
 - Expect the native usable pool allocation at the bottom of the GGTT, as
   it now keeps the best-fit placement.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 334 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c             |   4 +
 2 files changed, 338 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
new file mode 100644
index 0000000000000..25471317d7816
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+#define GGTT_TEST_START		SZ_1M
+
+static u64 ggtt_test_accessible_size(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+
+	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+}
+
+static void ggtt_test_fini(void *data)
+{
+	struct xe_ggtt *ggtt = data;
+
+	drm_mm_takedown(&ggtt->mm);
+}
+
+static struct xe_ggtt *ggtt_test_get(struct kunit *test)
+{
+	return xe_device_get_root_tile(test->priv)->mem.ggtt;
+}
+
+/* Must be called after the GGTT ranges are initialized. */
+static int ggtt_test_track_ggtt(struct kunit *test, struct xe_ggtt *ggtt)
+{
+	return kunit_add_action_or_reset(test, ggtt_test_fini, ggtt);
+}
+
+static struct xe_ggtt *ggtt_test_create(struct kunit *test, u64 full_size,
+					u64 usable_size, u64 shareable_size)
+{
+	struct xe_ggtt *ggtt = ggtt_test_get(test);
+
+	ggtt_init_ranges(ggtt, GGTT_TEST_START, full_size, usable_size, shareable_size);
+
+	if (ggtt_test_track_ggtt(test, ggtt))
+		return NULL;
+
+	return ggtt;
+}
+
+static void ggtt_test_remove_node(void *data)
+{
+	ggtt_node_remove(data);
+}
+
+/*
+ * Release the node on test exit, before the GGTT is torn down, so that an
+ * aborted test does not leave it in the drm_mm.
+ */
+static struct xe_ggtt_node *ggtt_test_track_node(struct kunit *test,
+						 struct xe_ggtt_node *node)
+{
+	if (!IS_ERR_OR_NULL(node) &&
+	    kunit_add_action_or_reset(test, ggtt_test_remove_node, node))
+		return ERR_PTR(-ENOMEM);
+
+	return node;
+}
+
+static struct xe_ggtt_node *ggtt_test_insert_node(struct kunit *test,
+						  struct xe_ggtt *ggtt, u32 size)
+{
+	return ggtt_test_track_node(test, xe_ggtt_insert_node(ggtt, size, XE_PAGE_SIZE));
+}
+
+static void init_native(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = min_t(u64, SZ_1G, accessible);
+	struct xe_ggtt *ggtt = ggtt_test_get(test);
+
+	ggtt_init_native(ggtt, GGTT_TEST_START, usable);
+	KUNIT_ASSERT_EQ(test, ggtt_test_track_ggtt(test, ggtt), 0);
+
+	KUNIT_EXPECT_EQ(test, ggtt->start, GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, usable);
+}
+
+static void alloc_usable_pool_native(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+}
+
+static void alloc_usable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node(test, ggtt, usable + XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_test_cases[] = {
+	KUNIT_CASE(init_native),
+	KUNIT_CASE(alloc_usable_pool_native),
+	KUNIT_CASE(alloc_usable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_suite = {
+	.name = "xe_ggtt",
+	.test_cases = ggtt_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+
+#if IS_ENABLED(CONFIG_PCI_IOV)
+static struct xe_ggtt_node *ggtt_test_insert_node_shareable(struct kunit *test,
+							    struct xe_ggtt *ggtt, u32 size)
+{
+	return ggtt_test_track_node(test,
+				    xe_ggtt_insert_node_shareable(ggtt, size, XE_PAGE_SIZE));
+}
+
+static void init_shared_pf(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	struct xe_ggtt *ggtt = ggtt_test_get(test);
+
+	ggtt_init_shared(ggtt, GGTT_TEST_START, accessible);
+	KUNIT_ASSERT_EQ(test, ggtt_test_track_ggtt(test, ggtt), 0);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), 0);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void init_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_GT(test, accessible, 0ULL);
+	KUNIT_ASSERT_GT(test, usable, shareable);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), accessible - shareable);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, shareable);
+	KUNIT_EXPECT_LT(test, ggtt_shareable_offset(ggtt), usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void alloc_usable_pool_low(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
+}
+
+static void alloc_shareable_pool_high(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node), (u64)XE_PAGE_SIZE);
+}
+
+static void alloc_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+}
+
+static void alloc_partial_overlap_usable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, usable);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
+}
+
+static void alloc_partial_overlap_shareable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	usable_node = ggtt_test_insert_node(test, ggtt, usable);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
+}
+
+static void alloc_shareable_pool_unavailable(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static void alloc_shareable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node_shareable(test, ggtt, shareable + XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_iov_test_cases[] = {
+	KUNIT_CASE(init_shared_pf),
+	KUNIT_CASE(init_partial_overlap),
+	KUNIT_CASE(alloc_usable_pool_low),
+	KUNIT_CASE(alloc_shareable_pool_high),
+	KUNIT_CASE(alloc_partial_overlap),
+	KUNIT_CASE(alloc_partial_overlap_usable_full),
+	KUNIT_CASE(alloc_partial_overlap_shareable_full),
+	KUNIT_CASE(alloc_shareable_pool_unavailable),
+	KUNIT_CASE(alloc_shareable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_iov_suite = {
+	.name = "xe_ggtt_iov",
+	.test_cases = ggtt_iov_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+#endif
+
+kunit_test_suites(&ggtt_suite);
+#if IS_ENABLED(CONFIG_PCI_IOV)
+kunit_test_suites(&ggtt_iov_suite);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 3adce6a540135..44480fad27679 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1397,3 +1397,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
 {
 	return node->base.size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ggtt_kunit.c"
+#endif
-- 
2.34.1

