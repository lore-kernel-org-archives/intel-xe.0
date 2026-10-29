Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBE2606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsUrOVun
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807E210E5BF;
	Thu, 29 Oct 2026 17:27:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90DF10E779
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 17:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793294868; x=1824830868;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qnaragruYr2PFU8vQoBk3W1Ml7syiyk1AIo4g9YFesQ=;
 b=RsUrOVunYFuystNk3pzNP/KnawPcJx6bw+EAQvW0mGIe7qV6tjrain2w
 9gj9XsfZHIJKhtAI1jzS+1YldMZTCO75kHgbWMs/vDSnLBx95mkPrwkcZ
 7CflVTGb5YCSflSCwWU+apowrKxdg/8HlAlHtlA6zMO02gwDn3f9/wiL8
 B9DwFCxG1OlKcv94ek/B4JWheHUI7a9QMJVpFFpEhyiNLt4ovSDFwO9g3
 kiEDJzgwfPDZ0i1sEuzXKxHVdWZe37AefULT5Iwfm9X3sqy/fSaLk1HJI
 31E9Timu/00ETh0Qco+uZEh6kDDuucBVkCdaQWaMf+8dmrzvSrS+FmNPF g==;
X-CSE-ConnectionGUID: GNN4Jr/TQimx8mN+MTqvdQ==
X-CSE-MsgGUID: xQsqfwM3Taab4tjQWbuZ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2061922"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2061922"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 10:27:48 -0700
X-CSE-ConnectionGUID: JCRsCMSaQ5a7IkpOLKrPXQ==
X-CSE-MsgGUID: gJK2u977TQ6gJ5ePJaEOCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5346838"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 10:27:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 10:27:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 10:27:47 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 10:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD/i5ks4MZ/h8QGd3NOiIIU9GukuaW44hQm8daWxBwe44POjxoDNnVD5l3tmLI0Xb0MiLqc/hkzZXa4siirCQLDNO5Kse7fJoX2ixGCTGaTCukytrw+fwCtSKMlQyl8mk3nzDsABTxIscv1X3sdcJs+6Rvz8976qkJSlR3kmoGItAHkrDA+Q0Qy8YC2h2+JG9y4/vNuPl58amt1RICQGIsv2OVaZZmf9t7Q/pQ0ZLX0gyWEBYslzM56XHEFEjgyJiCPb4lUGhZ5wVsl5Tk7IGGzZ84WODiy+VuVTqsWk+jvs/kZAx8MUFUtPquxAYg+I9limWKRmAKux+h8C6enhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/VIWpjzwj8C85gIuBJ6aUQtkZGP9nLHBpAkz3mx1nc=;
 b=DTzuUTV60dSCXN1XiyI2VaSbSrqEfTWDESpf33GL7A2RMhnrB0ZQgR9x0cAPq0U5pC0OsID2PymaWHiihj0jdcnn4x3bWOH8IWCN51u/Zn0qOIyaMqjgr+jUGmoxzD66B9Ss9LfaqKrx4aWasN+8Nkcfs4JoU33P/wKEBbS2PsKrf0invjsSiDZ2c73vVt9sDnS8mplvMISOOc6qHIM3QyQfVDpEFJUtz1bP9ZIKbIJ3FkP3FsRFHeF20LWVUg+Fv3e+YvTxaloXE5D5plro8Lq5h1ku6cxMhT78qKQaGib/+Oi7cVDgdBbRXB4Y5sWDYMMUcShExKh2NR5d2U4TiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 17:27:37 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 17:27:37 +0000
Message-ID: <67906b7f-494d-491f-b164-8dc352f96a83@intel.com>
Date: Thu, 29 Oct 2026 10:27:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe: Memset g2g buffer on resume
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20261027174351.619929-5-vinay.belgaumkar@intel.com>
 <20261027174351.619929-8-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261027174351.619929-8-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0050.namprd07.prod.outlook.com
 (2603:10b6:510:e::25) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: 53dc61f1-6466-4510-e507-08df35e1ed21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003|261028144727099003|261021123027099003|261022075727099003|261021121427099003|261021135927099003|261026121527099003|261009223027099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: YZxHysuQvUWC75HGXQT1HpnHy7P0d/RoA+0mrkLV0y0Tes52O3R8AawzadG/TydcHhaqA2wi1zJyYOu7WUQ3ecHApg7YNgCYDEBFRoWAdVzxycKDI9GVg4NG5loYrMrALJpjwSBhZHRR+N+A1pGuwpVQahX+qKJlusYSlO3cYry6sVgO95et7tpL3S35y16WNmssFvF1o1+6/0oMQj2ySLg7xUNKqasHOdEEJR0LFJkQ9jLD14JCcWIuq+I0f7lH80nuTBVsQzQMQ6VYBFWeQyFk6bdPDD1hDaMBmsHJHyk8xgXqyg2SKtnzKcut5f4ecfKmxcejWUKSCP/oL6cZ94G9jzwy14orEw05tV39kIsXdyYviMdliizbNvHu/aOPzPZH2hnTnoFJYdEWH1BsL9FfG2YunfbS3onk/D8EKC+NNIdOuvAqIwVzIixLbflrkwIc6HW3DkGqfSWCDpYIbEwjzzWTTBQUfnAeO3DB0rQ8soGb9VJ3R9bQFza0jKPChooVezUGGmRclsfqG2EsBKA4QQiZ/90yVL9ZXMm922M8eQnaRMKcZKZhQCpUPsXY4gBsBYoY4Uq7Ur0FWEZz4lute1pZb3YLjlNtTgA3KTKRP2KE+1uYS4qPN9h3xKmrCXFufFsrgPfdZP/tbs7qOVgnA6x9LLID88Q4D17XRus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(261028144727099003)(261021123027099003)(261022075727099003)(261021121427099003)(261021135927099003)(261026121527099003)(261009223027099003)(261026140227099003)(261022105027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFV0UGVtNHRFcGIwNllzaUVFV2Z6WUEwbXNmYi9VQnAweDcrVWlRcjVzZVcx?=
 =?utf-8?B?KzN3TDZmNFl2TnRHZ1lzLy9rUWxvWHVwdC9CbXZoWlE4dnNTeGUyT3Vsd1dS?=
 =?utf-8?B?S2Z5ekVMd0xPYU81VUpvRnFadkFPNmFENGMxdEpxVkZBZmVaK1JEM1g3RUY2?=
 =?utf-8?B?YXNiRWwvY3dRbjdPN2tnN1BXUXFKR2hjM1Mvend3Y2dxZXdXV0p3OEN1RjQ3?=
 =?utf-8?B?OFo0OEhTcXNUa01xYk82S290NE9nUUVQOU9naVI5SWhQcWFpWk5nTjZCZnZV?=
 =?utf-8?B?U0IveE1vbWI0TndUV3RKYnhFVUVGaWRySWxCUG41dzZjSkNhM1orU0xwKzg1?=
 =?utf-8?B?V29lY3dYTWFVcE9jSUlaYUVyNVJzTkNqSFJLT2NyZ0lHSHJzRUZEaXVyTWRy?=
 =?utf-8?B?TXFPS3NTZmFBelljYjhldnZLVm9PVDFOSTY2Y2Q2Vys5NzBLaE1QcEpqUUs1?=
 =?utf-8?B?N1dlZU8yS1hxaEN4ejJGb2NEUysxc1RBbGdqU3IrNENSWkRTeFJCcTcwbXdQ?=
 =?utf-8?B?WnVjWU1aN3p3Yy9PMG9OMVZlMFNmWWhSRnpPdzMwdnpNK1l3RlB4MGxWVHVi?=
 =?utf-8?B?Y3NNY0trQUl4dmZGTlRobzBRSEU0UE5XYTRWRlY2bTcxQzVvRWpwem5VTDN1?=
 =?utf-8?B?VlJIeUZOV0lJenN6NGEwVGxXNzlxa1hOVXVSelF5RlNDUlM3anVFZlY3SkJ1?=
 =?utf-8?B?SEV2SVdMKzN6VnVQK3lmbTlSSk50TWhDNzdpMTVJQXNUYTlhVE5XRGpYVjFw?=
 =?utf-8?B?UXFob2pSM1hiSTJzMG5QQzFrV092Sk9pK2R4ZE1uYzR0djNhSFlzZ3QraG5W?=
 =?utf-8?B?VnZFU0V6QWFKWHdtZHNJUGxibUwvQWp6aSt4UUtLcXF1ek1FSXNJb3IrR2Ez?=
 =?utf-8?B?VlZiOXpON2d2c3daYlRNNnNMS095Z0txWUxwcVc3MTBNYWxvY3pzRXdEcDVP?=
 =?utf-8?B?TWh6ZjlVYjM1N1JKSEwwY2NCZnU0ZTc1SGY5WW1meEJtQUxBelpJc1BKMjBO?=
 =?utf-8?B?UTZyWWZFNitEOSsxTlJrMHhXWDNPSUxuc1VEa251NE9YMG9ON1lkcmlmbjhV?=
 =?utf-8?B?SXdlckF4ekFUREdwSnJ6OFpaaU0yMGUzc3pYYlpmK0d1TjJQTEZ5YkZBekt1?=
 =?utf-8?B?NXV6UzZHQXZIdlR4NzBiMTFUQXpTb3lVWklqYVlHY2RHTVA1NFVRWlpGOXNW?=
 =?utf-8?B?TXdlS1ArcGhpU0Q1eC9ocDg4RGNtNVI2NFdjNHNXYnNFdmFYeGpIMVJVS2xt?=
 =?utf-8?B?ZUhGNmhGWmpEWm5WWlJGazBsK1VIa0pWMUhwNk1Sdk9kWVo1UEJrL3l3eDcy?=
 =?utf-8?B?RVlvWTZiRE8yVXNIc1pmVlNiYzBVN2wzWVQ3MWlaeGdtaktZbW5DVWJnM25V?=
 =?utf-8?B?ZGFKWEtKYi9peXhhQ0JJYVlUazJuOC9uZURhWDkyVDR4eEorYlVybUFFNWp4?=
 =?utf-8?B?bXE2Q2RDL09YS0xaaS93WXJoa3B3WE85Z1ppUXVaS2ExNHlYMjRRZDNUczFJ?=
 =?utf-8?B?VklCa0hMVUJxMmdXY2Nyc2prbTRoNVhyVmZmRktDUkd4QkovYXJNei8wdzE4?=
 =?utf-8?B?NUpvWDFjR1VaOTl5RXFMYTNQNm1KUnlua1J4eVZzVUVSbHRiYmhDRDhNS3RP?=
 =?utf-8?B?alFSYVk1MkRXSkxqTkdRdFF1VHJkTUZjTlVmZEwwcjlpSU1ZTFZ2em5pSEJz?=
 =?utf-8?B?Z1Zmcm1yRG5CeUY2SXdkNmtJQit4c2dYN1hUYUFacGF4b3hSS2VPUlhmTEVh?=
 =?utf-8?B?WDh2dHlDTTFaUksxbHh3K1pLejFzRWNEejhXdjZUUVlpSVp4eDN5bHF5NS8z?=
 =?utf-8?B?K3p5RnYwU2J4andRMnJBUFVsRHo2V25ndlNEbGl2USs2dmE0bzVGanpsNGxs?=
 =?utf-8?B?VHBKZUFFNnpCa3I1UklRMXVqMStyRHF1M3IweFNFbHJJeWNZMGEzNUpvS3Zn?=
 =?utf-8?B?cGxhem52WWViQVk1QXhicWlPT1NWZDRST1lYVExOK0RNQzJMVGRWSktYZC9k?=
 =?utf-8?B?YU1iZXdSeGJSUHpxNzk0ajJKdE1FdUVvQUtHdUNaczVBTWxwbnprYSs0TmV1?=
 =?utf-8?B?NUV3aHpsQ3ZaQlBrNXFhcFY4MXJLMmxKYW9wNnBTM1FTdGh0NVRPM0JWQXIz?=
 =?utf-8?B?Rjg4RHo2eG54OEtzTVNSM1ZEbDVHVlVaMk50dHJIL3AwdVRKRGdIWE82TVU3?=
 =?utf-8?B?cFd5cWI3ZTllTEQ3N3d2NWtKTHRmTEVNM0FwMEhFNkZCTWlLZ2MrTU44WmM1?=
 =?utf-8?B?VkpRVzNXSHoybVRqOTdwMUU5eDBqRnc5dG9vTmZHSE9xR2NFbzNKMzlMZm9S?=
 =?utf-8?B?RHdrb1NHRlJ1ekNxcy9MeFY3bFVUdnBiNjNBU1Vid0RlVHFwb2ovZGp6N1B2?=
 =?utf-8?Q?OFrwt9u0xLkF+HV4=3D?=
X-Exchange-RoutingPolicyChecked: L5sQxKwSJ+IPvTb+GjP/2inBZemvePDTL5gqq7/Y+EUDhCq95YlfPPBupbzUTf3DXifZwfbs9sWaUw/SH3gUy+LHFmYntGMUK9blr8fRzsSUmHOtj9YrZ5Y4xSBpGxXfc6/ltB6m9tCU0CTYPC099AjqVLullxVECmgSqXrH9pC6Sih4bS+sjmL9CzJ0XUc6hyT9bGIImyXgoSnSYXeiXm3YZvRaqTKCz1l8Bq0kuWLYpM+SmMVANC7Ek9R+7r8nxwxUSCxZkjyuYOimTm6CfC9q6YY9ebCW1MwgPh5JM5CNnBG9r17SpTWf+kvt3K9Ere1pBnOuiUJ2Wdb5Vf/A9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dc61f1-6466-4510-e507-08df35e1ed21
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 17:27:37.3329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysg5CS9V+mOXznu2Xf/JgBu7xN4mzh9qxdrBY21kX2Mh+rsR72U+NJhyQkaeyIzllnqq7C1Gh43Iwdt0TY/pUuaokEmLYLlrKxgJ3DvkUg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
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



On 10/27/2026 10:43 AM, Vinay Belgaumkar wrote:
> KMD creates this buffer for use by GuC, it is also responsible for zeroing
> it during resume. The buffer is marked as XE_BO_FLAG_PINNED_NORESTORE,
> so we cannot trust its contents after a suspend cycle. This commit adds
> xe_*_resume_early() functions for handling this and the C6 disable
> during resume.
>
> v2: Maintain layering with _early functions for gt/uc/ct (Matt Brost)
> v3: Memset the g2g buffer in xe_guc_resume_early() (Daniele)
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_gt.c  | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_gt.h  |  1 +
>   drivers/gpu/drm/xe/xe_guc.c | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h |  1 +
>   drivers/gpu/drm/xe/xe_pm.c  |  4 ++--
>   drivers/gpu/drm/xe/xe_uc.c  | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_uc.h  |  1 +
>   7 files changed, 48 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 60d35ada2853..bbdb7ab6c5af 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1093,6 +1093,19 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>   	return ret;
>   }
>   
> +/**
> + * xe_gt_resume_early() - Early init for GT resume
> + * @gt: the GT object
> + *
> + * Handles GT related init before GT restart after a suspend cycle.
> + */
> +void xe_gt_resume_early(struct xe_gt *gt)
> +{
> +	xe_gt_idle_disable_c6(gt);
> +
> +	xe_uc_resume_early(&gt->uc);
> +}
> +
>   int xe_gt_resume(struct xe_gt *gt)
>   {
>   	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 7b6952fe804c..7d292f9d0be7 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -58,6 +58,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>   int xe_gt_suspend(struct xe_gt *gt);
>   void xe_gt_shutdown(struct xe_gt *gt);
> +void xe_gt_resume_early(struct xe_gt *gt);
>   int xe_gt_resume(struct xe_gt *gt);
>   void xe_gt_reset_async(struct xe_gt *gt);
>   int xe_gt_runtime_resume(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b1f4e132fa0c..74438aaad437 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1755,6 +1755,21 @@ int xe_guc_start(struct xe_guc *guc)
>   	return xe_guc_submit_start(guc);
>   }
>   
> +/**
> + * xe_guc_resume_early() - Early init for GuC resume
> + * @guc: the guc object
> + *
> + * GuC init after a suspend cycle
> + */
> +void xe_guc_resume_early(struct xe_guc *guc)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	/* clear the g2g buffer which is marked as NORESTORE during alloc */
> +	if (guc->g2g.bo && guc->g2g.owned)
> +		xe_map_memset(xe, &guc->g2g.bo->vmap, 0, 0, xe_bo_size(guc->g2g.bo));
> +}
> +
>   /**
>    * xe_guc_runtime_suspend() - GuC runtime suspend
>    * @guc: The GuC object
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 75c4b9acb065..543ba4e5981e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -38,6 +38,7 @@ int xe_guc_init(struct xe_guc *guc);
>   int xe_guc_init_post_hwconfig(struct xe_guc *guc);
>   int xe_guc_post_load_init(struct xe_guc *guc);
>   int xe_guc_reset(struct xe_guc *guc);
> +void xe_guc_resume_early(struct xe_guc *guc);
>   int xe_guc_upload(struct xe_guc *guc);
>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>   int xe_guc_enable_communication(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 1f5097875bcd..89d64aa6577d 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -249,7 +249,7 @@ int xe_pm_resume(struct xe_device *xe)
>   		return err;
>   
>   	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> +		xe_gt_resume_early(gt);
>   
>   	xe_display_pm_resume_early(xe);
>   
> @@ -703,7 +703,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   			goto out;
>   
>   		for_each_gt(gt, xe, id)
> -			xe_gt_idle_disable_c6(gt);
> +			xe_gt_resume_early(gt);
>   
>   		xe_display_pm_resume_early(xe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 686c28856014..89040d9fa05f 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -12,6 +12,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_sriov_vf.h"
>   #include "xe_guc.h"
> +#include "xe_guc_ct.h"
>   #include "xe_guc_pc.h"
>   #include "xe_guc_rc.h"
>   #include "xe_guc_engine_activity.h"
> @@ -297,6 +298,20 @@ int xe_uc_suspend(struct xe_uc *uc)
>   	return xe_guc_suspend(&uc->guc);
>   }
>   
> +/**
> + * xe_uc_resume_early() - Early init for UC resume
> + * @uc: the UC object
> + *
> + * UC init before a GT restart during resume.
> + */
> +void xe_uc_resume_early(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_resume_early(&uc->guc);
> +}
> +
>   /**
>    * xe_uc_runtime_suspend() - UC runtime suspend
>    * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 23bc0ce1c42f..3c56327fb3f9 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -13,6 +13,7 @@ int xe_uc_init(struct xe_uc *uc);
>   int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>   int xe_uc_load_hw(struct xe_uc *uc);
>   int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_resume_early(struct xe_uc *uc);
>   void xe_uc_runtime_resume(struct xe_uc *uc);
>   void xe_uc_runtime_suspend(struct xe_uc *uc);
>   void xe_uc_stop_prepare(struct xe_uc *uc);

