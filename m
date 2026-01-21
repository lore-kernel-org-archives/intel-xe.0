Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A21FC44510
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 08:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CD610E70C;
	Wed, 21 Jan 2026 08:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aV8xXLsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE51B10E709
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 08:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768983878; x=1800519878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1EfntTvxrrg3jjQhnnxsDUNYo6IuFDwGPr/yX0A/V2c=;
 b=aV8xXLsW5scceHSi+sFg0UVrmBKGekfIo5742Y0EGoiqXsWbdGRf01Cm
 Xo+o+6jbgGNLwj31P8SE1/7sKtdBR4i22bTMjEzBHH37ZE+adsgZ9QBin
 YDjJwdQQrcFU4yk0aCtxweLQWbVb3i8XSsi87nAKDup2bt2qA0TImaiUV
 R1/trey4oI844luYDBSxbXIQDGqHgwIznqCQbf3oqS3eWNqQw5nBA93BN
 LwXhu4obYZAn4osBGoZuoZTrtVROyJPFjjzS5/CywgMhlYheWVyCKCw1u
 b0Yp7IGcu4yk4004eZVZL/Og8XNdCbyD1dS13tYpuZ8bAhSdsD26v0tQe w==;
X-CSE-ConnectionGUID: YQdUrYcTQ5Gi1ZN0cYlnuA==
X-CSE-MsgGUID: 4h3wM1WeT22OFQszQdr/cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74058654"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="74058654"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:24:38 -0800
X-CSE-ConnectionGUID: 4TpWz2ztSoGCKCGlevBtjA==
X-CSE-MsgGUID: MT29wRjPR7+b9+wO0WWV3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206441112"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 00:24:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 00:24:37 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 00:24:37 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 00:24:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZWR1NUQlmSe6zbrphGeiaf//EQ/TRQDs46jtgdII252zONYQAf8O2SUfMHZSdm161q/FkXpaD7lwsnc5UkF6RfShBHTYGbw9HiMjVDWXTFKoWNCO7cNJArxnZMWmGx2Pri2cufofrKCmmESh7t474A0YF6QSE0eZzLGaHlzSJENWCb39cPuDfyuBzN2An1Obk9rNAk3vCOeRfFEdEbhpuynKIyNBHH7L0wGk2ljfVW6bdLOdD3uVgeAnOXRoG7FMDQ+gvz6vqJW1BOloQipKUqPyc/ugPJJOFRUXDVsTKtSTniUsvf7zHkwv8gl/lUw1E/Cs+3EEt7d0f5TAgi6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96BGuf1JQYMQOFs2nUqpe6CT0s+mwFlWK/x3c17MXTY=;
 b=UjH2wHSm12JrUg3Lz9gmHSXs/u2kV0tQpn4V8yqiuJi+6GCTQYlv5ezI+1mAcQFKtnq/nyCsAK95AuN9+9lm3m+dXu6l51XmjXkUylfSPBve5bkNBMty7AEvW7NH1DW8Z1iw8ksQzFhjUe9gcM/u3A+9xBYxWdpzLyLfzF4NkE9bu2F15yFBhRwdI3jtEI1IfjPfNGWy4S65CrR59zaFntAYXsExCIn2n82+pGoM7RIRLdgrOhrSFc7I7bzj9AirshiXs6gIAgb/2E/8n22Y+/jl98QxVCIVPoJuP+JfuqM7Ly2UL6teyw8HXQDFjqqCAFKqOd5wZvHuLlPeSkEZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:24:35 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:24:34 +0000
Message-ID: <5a244a75-7788-4587-b73c-d934154d522a@intel.com>
Date: Wed, 21 Jan 2026 13:54:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/madvise: Implement purgeable buffer object
 support
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-4-arvind.yadav@intel.com>
 <aW+0HUCM9UvfTL05@lstrano-desk.jf.intel.com>
 <aW+4HJRLVPHn++6v@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aW+4HJRLVPHn++6v@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|DM4PR11MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: cac02dca-93f1-44c8-32da-08de58c6823e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aU1lTFh3Q0dQNk5KUG04R3NmdndFUE10eTBzUnlCUHl3em44SUd6eXUwRkpF?=
 =?utf-8?B?bVV3VEpaTDhIajJkdEZXU1FGQXdZWWRBNDNvMXIzWENrakxyMVZPMlRsQWkv?=
 =?utf-8?B?RFYrajc2bkMwdGwwcFBUbXhZcmpCKzZoUGpuMW1OM2lja3pTNVRBOVRzMGJ2?=
 =?utf-8?B?Sjd0NzZIaFR6WUdZdHhLeDMrcnM0QzRRR3VXeVM1VEVzSjE0bTNGdUhPbHJ5?=
 =?utf-8?B?Q1c5SWpobitYTS84UVdlOHc3Vmw1RnJuUzA4UkVmaFpEcTZjNjdnU2dyVXFE?=
 =?utf-8?B?R3hCRHl3MDFtY21XeVd6MVdHQlc1My80bHRTUzV0STUySEhCUERCSk83UGRr?=
 =?utf-8?B?L0FwZmpuazZzM2M2bldTaUYxWkdNUUtrR0w5MnlUcmtvMEcvK052Mlk4Q21w?=
 =?utf-8?B?bksrZGxWUThKeURmanFJTXNWN08wa1JJWFdFZDZyM1ByQjAwNGdaZmFlRW5V?=
 =?utf-8?B?TlZtNmhndE92QnhDRTFvMFZCSVRhalRVQ1VPWnk1MDlUeGV5U0Z2cmdMSVpw?=
 =?utf-8?B?QU9BMzdOUStyR1NJMjNremphcGV2bDVtSURzQjBzcVVTaEJsOG9mRC9XL05H?=
 =?utf-8?B?c3hXK0x5WmlUNVN6MDgvUTZhUFVteTcyNXpLTm5zb2M5VVI1VGFTTFZ3Umw5?=
 =?utf-8?B?TXkwTHhTcjZzT3NUbFdGbmc4eHJQUHdGUWg3Tjd3V2NTV2tWeEVGTjFiKzAz?=
 =?utf-8?B?MXNvU2p6VURpTnRDa3A2QmY4N2F2MlYyU21uMmNrOTZNU3VHQm1ZTzNveG1k?=
 =?utf-8?B?WXNEM1ZLdDlxcW96ZHk2U1pkaGR6cVE5SE8valQ2YjlQckx2dWFTQVJzU2lD?=
 =?utf-8?B?QkxDVjgwMlZDbGE5OTQ1Zm9hSkRrQmlXemFiQ0V6QlJ5U3U2d3hvcWVuTC8z?=
 =?utf-8?B?MUlqdnFhZmFHdnM1bE9McXROU25VOEFrVVkrdnJLdGp0U0NCSWNNZzhnMDF0?=
 =?utf-8?B?VHZ4bm5iM3U2M3JjSzJ3T2JYN2Y3QnFWb3ljYVVhYnZUUFlYakI1THorTkY2?=
 =?utf-8?B?ZmViYXQxcnR0eWFKNm0wdXluV0RxVVVlYTlqckJ1N0x0S2Qzbkg4QkRXUHA1?=
 =?utf-8?B?RHZ4S2Uvank5ZVJzSWJCeTdMeG4yay9CcVlVR3lpcDVRdmFqUGF5UGRDUTBC?=
 =?utf-8?B?bkViWTFDVlJicGx3dXRmZEtxUUFGa3FtVVBlT1ZadmpsNk94OW90VkFtMzJa?=
 =?utf-8?B?QW9naVM3TGRYNmFHZVVzUURQZUliZGVvTGVXUjBWaC8rWFB5c2NvazNNblV2?=
 =?utf-8?B?eUtncW5XRWQ3Zi9HRTNxb0hUQ2wvaldVbmxzQU90U3BON3hhdTJLV1BPMTRo?=
 =?utf-8?B?L3lmSFkxVHI3Q3h4bFlJOS9JQldSb2lDbUx6Y1E0bkt3YjBmdU4zbE43VFhU?=
 =?utf-8?B?TjRYOG9xYU95MEgxU3RBNVRPZUpjT0tTNkVVeXpGcFB4R2ptVThoS1dpZGU4?=
 =?utf-8?B?ajJKMWFna0lzZ0pzMjlsSm14bXgxckQ3eklLTGJGdnBaQVR5QXVvZCtkb01D?=
 =?utf-8?B?VWV6MDJiOEZadzFPOCtXWDlSQ2p5WDVscXdxWlFYYmVXR0xsaHRzZjJSYkpF?=
 =?utf-8?B?MzRXRVNJNjN4eHp2eTZHZ1NyZjR5STFmRVRIdGNHdmpwMm1JQ0dJbnkwN1M4?=
 =?utf-8?B?cnRNRmowZ1VwODFMeHNPQmEyK29MamVkMVhSbEptcU9paENFMWsrODd2QldC?=
 =?utf-8?B?S2hNY0lnUFQ1Y01zeGFhT0d4aG1nckRCOGIwaUo2Zk9EK25zaEF0dGdjbmZH?=
 =?utf-8?B?bmZld3IrTWFySk9MaEtFZExHWWQrMzNXQkU2K2l0eW51VjBLOXJFaUpPUlJl?=
 =?utf-8?B?UjB2dFpmMjR5VVl1WVpsZWt4RUlKdzRtbmRDelZpZzhxWGVpMDJPblcrd1Rs?=
 =?utf-8?B?Q29GNFNyclVmaTZoUGVUMTdrUzNhWGZLVjNrQlhxNUVpQktUdURrWjBhQi95?=
 =?utf-8?B?NXV0VzMrNm9CdEJZNThwdFhFOEdOZlpIWStpWS82UUt3dUJiU08rR2hSdDRq?=
 =?utf-8?B?YXhwR09vUkg3Z0ZRa2x3VCtnaUJFY3U2ZmllYmhGeTh5cjIzQzVHT2xpQzBo?=
 =?utf-8?B?LzR5cTNDMnkrSTkxQmpmM3pEbVV6eGhVZnNOZ0pVN3R5Q1lKWjJSRUtUaEw2?=
 =?utf-8?Q?thlE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmJsaHVnR2gzUVBoQllKaGU0aHV6c1lFWlBBdnN6WDN1MnFKemRSL1hGeTBV?=
 =?utf-8?B?Z3YvdEFLVE5VdFYvYkVYUlpUWGQya2VseVhnZ090TExxNkxNMUVMZ3FaOEJB?=
 =?utf-8?B?ckJNQmdRM1c2UCs4aFIvL0E3Nmw3OGRuQ2lwVjdlZHdOcXd1UHVkZldoNmda?=
 =?utf-8?B?Q1loZHo4VEx6Vm1SZEEyUnoxcURsdWFDaGtwUk1YMHNvTWRzYlJaRWh3UCtn?=
 =?utf-8?B?TzQrTWRJVXgvVGFDbS9QT1ZXV0lxSjFHOEUrOFlaUit0WnRIdjRaSk1UUTdQ?=
 =?utf-8?B?K3JlK01IRENZcmZMT0dYQ3NveWNqL25pRE1SR3JxTENuakdKWHNsSCtuZm5G?=
 =?utf-8?B?enBxSkI2MDdYQ01DbktvMWU2TjNIY3Flb0NnTjZMdEN1RVdtb1FtcEMxOGEz?=
 =?utf-8?B?QnowdEUwTG9LNVhYV2lST015a1M3VkhqZno4TUo0OWhTOENMSzV0Q3ZoZDJK?=
 =?utf-8?B?V0xybHlvU2RBYURrYWRhY3JYU2d0NTF2bTFqNGc5SDJpUnp1TDRNRytOaGR3?=
 =?utf-8?B?OS9YVDgwN0JYM3Z4RU9pSnFOSGxjQkdzRVovRXFRcUkwRVJxazhJSnpDS251?=
 =?utf-8?B?R3pFV1Jzam52V2dMR2t3VjE0cXNHSzRVMmtSckZZcUdTRWFaWFVTSXMzRFRs?=
 =?utf-8?B?YjdqQU9maE1oamFZU3g0UVhaZC9jYnFYb01oTjZsM2RaMEVqc2poVmFReXR1?=
 =?utf-8?B?M1pmQ1RlOWpUUUc5dDdscmY5N1NQVTlTOFRjSHBIQldsNlhUYWRJVmFxMndp?=
 =?utf-8?B?QnhTaFpsQ28yeEZHVHF6K2FqZGZBeEFPaVo5Nzh4Nm5yVy9MWWMzeFRGcTVV?=
 =?utf-8?B?MWx1enAyRkxwZTFpeG9xUFl6aTJCQWxiL2FyS1ZnOEs2TXo3bnd4aDV1U3BN?=
 =?utf-8?B?L1hwMVE0TFRURHZ3a1AxcXc4SSs2T0JtVXZKd0RxYjBpMklsTVZNMEN4NlJH?=
 =?utf-8?B?WjR1SnlteHAxR3drS21KeFVqKzZXYUR0Z3ZYaVAxY1piUS92Ym1ybVhKZ3lK?=
 =?utf-8?B?VVlGd3hpMUlMZCtvbkFlUFV6cExkSkhXWmJiNkl5OU02U3E2RFIvSENCSjhD?=
 =?utf-8?B?dE8yYjdQWTJVTEFRUG04MG9EUWdRSGdnRVNNcElvTEwrSFJsQnhRRlNYNldp?=
 =?utf-8?B?V1BwTXU2eC9jOTlYQmpSLzVtMUFadmRXenRScjFDdHN3aTZkMS9yZkdwTFJE?=
 =?utf-8?B?YmZsbzdDZEplVVgrNGY0YjFBeUFvMURsUExuZWcvQnNqZUJYbit3YjJkbVJj?=
 =?utf-8?B?MWlxWDNQaTR6bUtVb2xSeUxta002d3F0YSs2eGlnY2U2TmgwK1pHQjBGbXN6?=
 =?utf-8?B?WXhNK2l4MTNEYW9jb2ozRm9NdXJ3SUxwV2RySmJzOWNyd0VodVlicGFpUkRN?=
 =?utf-8?B?ajdudHpTblZycGpOYko2Z0wrQ3p0cGExM2JOSFRySW5QQTNFMmFiNlhWbnN0?=
 =?utf-8?B?OVk1NGJRU1ZDTjU2aldMWTMyRUhDam8rNUo2ZWFuc3d2TGpxN3pOSFlkbkly?=
 =?utf-8?B?ckpiVG5nY0U1R2ViU2hGUlp0U3B1U1A2NVNhanVvSGJHdGFNRXV1b1RVN1JD?=
 =?utf-8?B?dVp2amd4Z0dJRGtWeDFNUWIxQ05pWmZFMFNOdkRvVnFEellIUTJUWUxTbEsw?=
 =?utf-8?B?U3Z6UnVQWmpBb1BjL0RaL09Ba2xwRXJ0VTFBT2lhT2FVYmRSd0cvTldmSE80?=
 =?utf-8?B?N0NkUWdSWFN6OWZudEtFS0h5enpOZWU2Ti9OOGdXMnNVdXJDUWs4RldNWU1a?=
 =?utf-8?B?SVFyM21mMjc2KzNreVEzRytqZkNVUEZzMUZTNlB3TjdXNEVaTUhxZkRQNlRv?=
 =?utf-8?B?T3VaQVpub3ZCQWxwQmFGdFVobUxlbnkrdkhDekFSOTFCbmNNemtMbkNqeHVu?=
 =?utf-8?B?Mnp4WjhPTFF5cDlWMjJDeDJaZHFmcGtveXV6Uk5yOU9kajdHZC9SNjJkQzlt?=
 =?utf-8?B?V2ZDRFlNeWxYV1hkb2pZUTNHN1JldmR6M3UvRkt2VFpRSkF4ZHhJd2tRYmVD?=
 =?utf-8?B?S0t2WEM2MVNodm1UQXQreXg2QzZJcHNNa09uSW50Q1hzazhGdFdyWEh2SE9p?=
 =?utf-8?B?R1FxN3FNY2xTK3FXSkt5QWxXOGcvbWRjM1RDejJieFRoK01lRG1IWG9NbXp5?=
 =?utf-8?B?TUhKemc4dXFxbHNHdmhaOERwaWZrQXVtWXh6L1pFbFJHK2VtL1pyVStkM2xO?=
 =?utf-8?B?TmVIdVhGcFJZYk9UZExQT3hTTGkxWS9uTVBSSXVLeERTY3oyTWt5ME5FUHRj?=
 =?utf-8?B?NFprQXZIRmNKbTE5WmxDbVNXZjYrNWNNVjU4QVJlNGNRRGwrSmxRdTBiMjll?=
 =?utf-8?B?NGFlRERVY0ozNk0zeGxoVFBQTkZTazBGZm1IUVM4dzQ5Rk10ejBUUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cac02dca-93f1-44c8-32da-08de58c6823e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:24:34.7433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzxMYMWK7wo8LNaq1gUarHw4cdTJvj3meDGINIjIjBKhAYUYE6DKkWsuOcLx9FcOeexTIwjmxf1TU3eVfY2dyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8179
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


On 20-01-2026 22:45, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 08:58:05AM -0800, Matthew Brost wrote:
>> On Tue, Jan 20, 2026 at 11:38:49AM +0530, Arvind Yadav wrote:
>>> This allows userspace applications to provide memory usage hints to
>>> the kernel for better memory management under pressure:
>>>
>>> Add the core implementation for purgeable buffer objects, enabling memory
>>> reclamation of user-designated DONTNEED buffers during eviction.
>>>
>>> This patch implements the purge operation and state machine transitions:
>>>
>>> Purgeable States (from xe_madv_purgeable_state):
>>>   - WILLNEED (0): BO should be retained, actively used
>>>   - DONTNEED (1): BO eligible for purging, not currently needed
>>>   - PURGED (2): BO backing store reclaimed, permanently invalid
>>>
>>> Design Rationale:
>>>    - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
>>>    - i915 compatibility: retained field, "once purged always purged" semantics
>>>    - Shared BO protection prevents multi-process memory corruption
>>>    - Scratch PTE reuse avoids new infrastructure, safe for fault mode
>>>
>>> v2:
>>>    - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
>>>    - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
>>>    - Implement i915-compatible retained field logic (Thomas Hellström)
>>>    - Skip BO validation for purged BOs in page fault handler (crash fix)
>>>    - Add scratch VM check in page fault path (non-scratch VMs fail fault)
>>>    - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
>>>    - Add !is_purged check to resource cursor setup to prevent stale access
>>>
>>> v3:
>>>    - Rebase as xe_gt_pagefault.c is gone upstream and replaced
>>>      with xe_pagefault.c (Matthew Brost)
>>>    - Xe specific warn on (Matthew Brost)
>>>    - Call helpers for madv_purgeable access(Matthew Brost)
>>>    - Remove bo NULL check(Matthew Brost)
>>>    - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
>>>    - Move the xe_bo_is_purged check under the dma-resv lock( by Matt)
>>>    - Drop is_purged from xe_pt_stage_bind_entry and just set is_null to true
>>>      for purged BO rename s/is_null/is_null_or_purged (by Matt)
>>>    - UAPI rule should not be changed.(Matthew Brost)
>>>    - Make 'retained' a userptr (Matthew Brost)
>>>
>>> v4:
>>>    - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c         | 61 +++++++++++++++++----
>>>   drivers/gpu/drm/xe/xe_pagefault.c  | 12 ++++
>>>   drivers/gpu/drm/xe/xe_pt.c         | 38 +++++++++++--
>>>   drivers/gpu/drm/xe/xe_vm.c         | 11 +++-
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 88 ++++++++++++++++++++++++++++++
>>>   5 files changed, 191 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 408c74216fdf..d0a6d340b255 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -836,6 +836,43 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>>   	return 0;
>>>   }
>>>   
>>> +/**
>>> + * xe_ttm_bo_purge() - Purge buffer object backing store
>>> + * @ttm_bo: The TTM buffer object to purge
>>> + * @ctx: TTM operation context
>>> + *
>>> + * This function purges the backing store of a BO marked as DONTNEED and
>>> + * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
>>> + * this zaps the PTEs. The next GPU access will trigger a page fault and
>>> + * perform NULL rebind (scratch pages or clear PTEs based on VM config).
>>> + */
>>> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>>> +{
>>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>>> +
>> xe_bo_assert_held(bo);


Noted,  I will add xe_bo_assert_held() at the top of the purge helper

>>
>>> +	if (ttm_bo->ttm) {
>>> +		struct ttm_placement place = {};
>>> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>>> +
>>> +		drm_WARN_ON(&xe->drm, ret);
>> I think since 'xe' in available here, you should use xe_assert in place
>> of drm_WARN_ON.
Agreed. Switched this to xe_assert(xe, !ret) since this is Xe-specific 
and we already have xe.
>>
>>> +		if (!ret) {
>>> +			if (xe_bo_madv_is_dontneed(bo)) {
>>> +				bo->madv_purgeable = XE_MADV_PURGEABLE_PURGED;
>> Helper to set madv_purgeable state /w lockdep assert?
>>
>> Also perhaps assert valid state transitions in the helper (e.g., you
>> cannot tranistion out of XE_MADV_PURGEABLE_PURGED.


Noted,  I will xe_bo_set_purgeable_state() which asserts the BO lock and 
enforces "once PURGED always PURGED" (reject transitions out of PURGED).

>>
>>> +
>>> +				/*
>>> +				 * Trigger rebind to invalidate stale GPU mappings.
>>> +				 * - Non-fault mode: Marks VMAs for rebind
>>> +				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
>>> +				 *   and NULL rebind with scratch/clear PTEs per VM config
>>> +				 */
>>> +				ret = xe_bo_trigger_rebind(xe, bo, ctx);
>>> +				XE_WARN_ON(ret);
>> I think xe_bo_trigger_rebind is allowed to fail if ctx->no_wait_gpu is
>> set. In both the faulting fast path and certain parts of the shrinker we
>> set this. So I think any error returned from xe_bo_trigger_rebind needs
>> to propagte up the call stack.


Agreed. I will changed xe_ttm_bo_purge() to return int and propagate 
errors. xe_bo_move() now returns the error when purge/rebind fails, 
rather than warning and continuing.

>>> +			}
>>> +		}
>>> +	}
>>> +}
>>> +
>>>   static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>>   		      struct ttm_operation_ctx *ctx,
>>>   		      struct ttm_resource *new_mem,
>>> @@ -855,6 +892,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>>   				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>>>   	int ret = 0;
>>>   
>>> +	/*
>>> +	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
>>> +	 * The move_notify callback will handle invalidation asynchronously.
>>> +	 */
>>> +	if (evict && xe_bo_madv_is_dontneed(bo)) {
>>> +		xe_ttm_bo_purge(ttm_bo, ctx);
>> With above, we need to send errors from xe_ttm_bo_purge up the call
>> stack.


Noted.

>>
>>> +		return 0;
>>> +	}
>>> +
>>>   	/* Bo creation path, moving to system or TT. */
>>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>>   		if (new_mem->mem_type == XE_PL_TT)
>>> @@ -1604,18 +1650,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>>>   	}
>>>   }
>>>   
>>> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>>> -{
>>> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>> -
>>> -	if (ttm_bo->ttm) {
>>> -		struct ttm_placement place = {};
>>> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>>> -
>>> -		drm_WARN_ON(&xe->drm, ret);
>>> -	}
>>> -}
>>> -
>>>   static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>>>   {
>>>   	struct ttm_operation_ctx ctx = {
>>> @@ -2196,6 +2230,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>>>   #endif
>>>   	INIT_LIST_HEAD(&bo->vram_userfault_link);
>>>   
>>> +	/* Initialize purge advisory state */
>>> +	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
>>> +
>>>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>>>   
>>>   	if (resv) {
>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>>> index 6bee53d6ffc3..e3ace179e9cf 100644
>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>>> @@ -59,6 +59,18 @@ static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
>>>   	if (!bo)
>>>   		return 0;
>>>   
>>> +	/*
>>> +	 * Check if BO is purged (under dma-resv lock).
>>> +	 * For purged BOs:
>>> +	 * - Scratch VMs: Skip validation, rebind will use scratch PTEs
>>> +	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
>>> +	 */
>>> +	if (unlikely(xe_bo_is_purged(bo))) {
>>> +		if (!xe_vm_has_scratch(vm))
>>> +			return -EACCES;
>>> +		return 0;
>>> +	}
>>> +
>>>   	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>>>   		xe_bo_validate(bo, vm, true, exec);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>> index 6703a7049227..c8c66300e25b 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>>   	/* Is this a leaf entry ?*/
>>>   	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>>>   		struct xe_res_cursor *curs = xe_walk->curs;
>>> -		bool is_null = xe_vma_is_null(xe_walk->vma);
>>> -		bool is_vram = is_null ? false : xe_res_is_vram(curs);
>>> +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>>> +		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
>>> +					 (bo && xe_bo_is_purged(bo));
>>> +		bool is_vram = is_null_or_purged ? false : xe_res_is_vram(curs);
>>>   
>>>   		XE_WARN_ON(xe_walk->va_curs_start != addr);
>>>   
>>>   		if (xe_walk->clear_pt) {
>>>   			pte = 0;
>>>   		} else {
>>> -			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
>>> +			/*
>>> +			 * For purged BOs, treat like null VMAs - pass address 0.
>>> +			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
>>> +			 */
>>> +			pte = vm->pt_ops->pte_encode_vma(is_null_or_purged ? 0 :
>>>   							 xe_res_dma(curs) +
>>>   							 xe_walk->dma_offset,
>>>   							 xe_walk->vma,
>>>   							 pat_index, level);
>>> -			if (!is_null)
>>> +			if (!is_null_or_purged)
>>>   				pte |= is_vram ? xe_walk->default_vram_pte :
>>>   					xe_walk->default_system_pte;
>>>   
>>> @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>>   		if (unlikely(ret))
>>>   			return ret;
>>>   
>>> -		if (!is_null && !xe_walk->clear_pt)
>>> +		if (!is_null_or_purged && !xe_walk->clear_pt)
>>>   			xe_res_next(curs, next - addr);
>>>   		xe_walk->va_curs_start = next;
>>>   		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
>>> @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>>   	};
>>>   	struct xe_pt *pt = vm->pt_root[tile->id];
>>>   	int ret;
>>> +	bool is_purged = false;
>>> +
>>> +	/*
>>> +	 * Check if BO is purged:
>>> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
>>> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
>>> +	 *
>>> +	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
>>> +	 * zero instead of creating a PRESENT mapping to physical address 0.
>>> +	 */
>>> +	if (bo && xe_bo_is_purged(bo)) {
>>> +		is_purged = true;
>>> +
>>> +		/*
>>> +		 * For non-scratch VMs, a NULL rebind should use zero PTEs
>>> +		 * (non-present), not a present PTE to phys 0.
>>> +		 */
>>> +		if (!xe_vm_has_scratch(vm))
>>> +			xe_walk.clear_pt = true;
>>> +	}
>>>   
>>>   	if (range) {
>>>   		/* Move this entire thing to xe_svm.c? */
>>> @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>>   	if (!range)
>>>   		xe_bo_assert_held(bo);
>>>   
>>> -	if (!xe_vma_is_null(vma) && !range) {
>>> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
>>>   		if (xe_vma_is_userptr(vma))
>>>   			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
>>>   					 xe_vma_size(vma), &curs);
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 694f592a0f01..c3a5fe76ff96 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -1359,6 +1359,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>>   static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>>   			       u16 pat_index, u32 pt_level)
>>>   {
>>> +	struct xe_bo *bo = xe_vma_bo(vma);
>>> +	struct xe_vm *vm = xe_vma_vm(vma);
>>> +
>>>   	pte |= XE_PAGE_PRESENT;
>>>   
>>>   	if (likely(!xe_vma_read_only(vma)))
>>> @@ -1367,7 +1370,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>>   	pte |= pte_encode_pat_index(pat_index, pt_level);
>>>   	pte |= pte_encode_ps(pt_level);
>>>   
>>> -	if (unlikely(xe_vma_is_null(vma)))
>>> +	/*
>>> +	 * NULL PTEs redirect to scratch page (return zeros on read).
>>> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
>>> +	 * Never set NULL flag without scratch page - causes undefined behavior.
>>> +	 */
>>> +	if (unlikely(xe_vma_is_null(vma) ||
>>> +		     (bo && xe_bo_is_purged(bo) && xe_vm_has_scratch(vm))))
>>>   		pte |= XE_PTE_NULL;
>>>   
>>>   	return pte;
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> index add9a6ca2390..dfeab9e24a09 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -179,6 +179,56 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>>   	}
>>>   }
>>>   
>>> +/*:
>>> + * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
>>> + * Returns true if any BO was purged, false otherwise.
>>> + * Caller must copy retained value to userspace after releasing locks.
>>> + */
>>> +static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
>>> +				       struct xe_vma **vmas, int num_vmas,
>>> +				       struct drm_xe_madvise *op)
>> Shouldn't this check be a vfunc in madvise_funcs?
>>
>> Also I think you can hook into xe_madvise_details for the return value /
>> final copy to user.


Yes. I will move purgeable handling into the madvise_funcs[] table as a 
proper madvise vfunc (madvise_purgeable). The retained return is now 
tracked via xe_madvise_details and copied back in 
xe_madvise_details_fini(), so we keep the "copy_to_user after dropping 
locks" rule without a special-case early return.

>>> +{
>>> +	bool has_purged_bo = false;
>>> +	int i;
>>> +
>>> +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
>>> +
>>> +	for (i = 0; i < num_vmas; i++) {
>>> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
>>> +
>>> +		if (!bo)
>>> +			continue;
>>> +
>>> +		/* BO must be locked before modifying madv state */
>>> +		xe_bo_assert_held(bo);
>>> +
>>> +		/*
>>> +		 * Once purged, always purged. Cannot transition back to WILLNEED.
>>> +		 * This matches i915 semantics where purged BOs are permanently invalid.
>>> +		 */
>>> +		if (xe_bo_is_purged(bo)) {
>>> +			has_purged_bo = true;
>>> +			continue;
>>> +		}
>>> +
>>> +		switch (op->purge_state_val.val) {
>>> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>>> +			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
>>> +			break;
>>> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>>> +			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;
>> Use above suggested helper to set this state?


Yes, converted to xe_bo_set_purgeable_state().

>>
>>> +			break;
>>> +		default:
>>> +			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
>>> +				 op->purge_state_val.val);
>>> +			return false;
>>> +		}
>>> +	}
>>> +
>>> +	/* Return whether any BO was purged; caller will copy to user after unlocking */
>>> +	return has_purged_bo;
>>> +}
>>> +
>>>   typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>>>   			     struct xe_vma **vmas, int num_vmas,
>>>   			     struct drm_xe_madvise *op,
>>> @@ -306,6 +356,16 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>>>   			return false;
>>>   		break;
>>>   	}
>>> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
>>> +	{
>>> +		u32 val = args->purge_state_val.val;
>>> +
>>> +		if (XE_IOCTL_DBG(xe, !(val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED ||
>>> +				       val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED)))
>>> +			return false;
>>> +
>>> +		break;
>>> +	}
>>>   	default:
>>>   		if (XE_IOCTL_DBG(xe, 1))
>>>   			return false;
>>> @@ -465,6 +525,34 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>>>   					goto err_fini;
>>>   			}
>>>   		}
>>> +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
>>> +			bool has_purged_bo;
>>> +
>>> +			has_purged_bo = xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
>>> +								   madvise_range.num_vmas, args);
>>> +
>> Again use the existing vfuncs here.


Noted,

>>
>>> +			/* Release BO locks */
>>> +			drm_exec_fini(&exec);
>>> +			kfree(madvise_range.vmas);
>>> +			up_write(&vm->lock);
>>> +
>>> +			/*
>>> +			 * Set retained flag to indicate if backing store still exists.
>>> +			 * Matches i915: retained = 1 if not purged, 0 if purged.
>>> +			 * Must copy_to_user AFTER releasing ALL locks to avoid circular dependency.
>>> +			 */
>>> +			if (args->purge_state_val.retained) {
>>> +				u32 retained = !has_purged_bo;
>>> +
>>> +				if (copy_to_user(u64_to_user_ptr(args->purge_state_val.retained),
>>> +						 &retained, sizeof(retained)))
>> I don't think remained needs to be a u64 - maybe a u16? Will comment on
>> uAPI too.
>>
> Ignore this, I forgot purge_state_val.retained is a userptr so u64 is
> correct. Let me follow on if we are allowed to change IOCTLs from IOW ->
> IOWR. I am really unclear on the rules that part of the uAPI.


sure,

>
>>> +					drm_warn(&vm->xe->drm, "Failed to copy retained value to user\n");
>> See above, use xe_madvise_details_fini for the final copy to user.


Noted -  The retained pointer is stored in details during init, and the 
final copy happens in xe_madvise_details_fini().


Thanks,
Arvind

>>
>> Matt
>>
>>> +			}
>>> +
>>> +			/* Final cleanup for early return */
>>> +			xe_vm_put(vm);
>>> +			return 0;
>>> +		}
>>>   	}
>>>   
>>>   	if (madvise_range.has_svm_userptr_vmas) {
>>> -- 
>>> 2.43.0
>>>
