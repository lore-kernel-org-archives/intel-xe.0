Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA9AC982E6
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 22:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D50E10E07D;
	Mon, 21 Sep 2026 22:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgSrgF0W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E242110E07D
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 22:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790031538; x=1821567538;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L24RiHg9mJDDCZ0rBL05Kpl40ZKX+BBSzyk30nLL7oM=;
 b=AgSrgF0Wzq09KdqU3pZie59MmCN2k4weAkTS5GJhBawiHztqW4BBRya2
 nHvt7BinrqsTTmzrm6A6xQ7wUHhVpjBQGA2hRhd4MeCGuro0lpfEjq5bO
 wxypK1uOYIqCAZ1BRD4Uvg5bwylgzT3T+qAdV/FwD3nP8RlEin6oAWoEH
 RxnETGjNIgK/ftcfwNEYZG0EWPpr0EGPDMZAgvorx0HbgNNIYBwT1G+le
 apGBZNa4kK0aBPvD3Ja/4vXQoRe37uU/wRyof4QsAI1iLw3hi9puZQCgF
 cfHh7inmB69jl2LGJ1MmrQqD7h6mO8OcjcICnhr4x7QA2X5DGIO5PDO67 A==;
X-CSE-ConnectionGUID: QbbP/RqMSl+JfsdnjQnm5Q==
X-CSE-MsgGUID: pOe5bNK2TN2DZ8kbgrR7CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1091681"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="1091681"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 15:58:58 -0700
X-CSE-ConnectionGUID: bKj37ZBvRcm3Yp/ca7WGXQ==
X-CSE-MsgGUID: qU3d8kt9Tdi0xr2HVSFUzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="3946235"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 15:58:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 15:58:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 15:58:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 15:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s32ddWx7aO1N6OmQ7dDJkO3gjPbDxjrPrCYUPdi4dslz8ih0XUCpD6rsQONcEUDtP5OHOXLr6QQlTcCnwCNts9NuRup9ww8p+odfBArfo7V1+z5CT0sr/HkCMeZ++UlpZXswo0Xuu2CP6Kh7L2jtETdAbfMPpWVX1xX353yYeOyLIIJ2grYRu4TWLxje6sbKCz0pI6KqAMRCtzHj8DjdpZsxFRpkKwUD07UPbA+heDxvKdwHtq5KLrbGIreuthLbdDyPDDjGPxfan6GxTXAd5bXONRi602W75ijlSdmBpY7msOznrm0osRpSkacXKbBZMF4lzXR9Dxc2EP//IiN0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6ipeRw4kfYyxUMaEYIajNboYs4JXSwidqImHmrpo1s=;
 b=hE8vJ5OI6gYIijB2hmojeneAJrwj31znqMfd1UrTs7kt0vY730wdxeOxhL07wraZpyniSReJl2sssAvCQVEFn932DTtoKoBT1nQKzW7eYcMRRjYzCW946RFFDcfMPGWRNK/BAz6WMba8TgAfDZ02AaoEULM7Mhao/WbBMsuB5zG1bHaVazv6VDGjqRyh84zyP18izaDHuYAh2NjTB4n8b03/aFwLXUIAPqkJU7J3+woRFfCGBMHDPdiR8PLy0bK3AaKtzwHZK3CNr08Jcs3qyVWXhEiMbPpXNNmLW353ogQL71FWlxRQzzpmODFh60Qq2Z2Ge9NpC6P1iK1Alg8i7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by LV2PR11MB184224.namprd11.prod.outlook.com (2603:10b6:408:411::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 22:58:49 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 22:58:49 +0000
Message-ID: <6a5a8c0c-dcd1-4cf7-94ad-d17f0a2ca4b8@intel.com>
Date: Mon, 21 Sep 2026 15:58:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p
 platforms
To: <tilak.tirumalesh.tangudu@intel.com>, <shuicheng.lin@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260916100545.779894-1-tilak.tirumalesh.tangudu@intel.com>
 <20260916100545.779894-3-tilak.tirumalesh.tangudu@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260916100545.779894-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::28) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|LV2PR11MB184224:EE_
X-MS-Office365-Filtering-Correlation-Id: d2af1a40-65d4-45ec-3b30-08df1833e62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PVwn4t1fNrwemTIfzgciq8qgmT0yQL30DSWcSjUX+0zLKaAWrDq0IkHxk+wtxtDfo887ApPG7JNonHSnX2Us5ak7PX3NjkO6gyzXmCDwB4+E/XZs9/kSXPI8P32TSkyUmcDmpuRP7yxJAePJvg3oD0efCfcLhZ2vMEywD6xIUQatWA83PR3BnfDIjf9Emj0z/WhPaaZUxKrvxEqdKy5i0POBcciZq+5AlmFrpJ8TM8XfAyBQDNUWhRXTx6+u+AaPWTn5//RkTPQ7q6BSE2nEw3EGzdbljLUDAw09QctBmCH6KmcGgvyq2lCyplceBUgLKdpOpDxyVnA2AX46P6BUZTjb7HZDRkPKyZIGn7Ms1TWFz3LYWkNz0HW8ks/feYWztqmI6MRDWMHcMBmCecl0p46HRZfl1GC033Ap3VarrXw18r0GgEtrowLrtLFb7U2Y/jHcG6LXSFXl5y3rBYZH9/yVq8xDYUrADn3t/BpolcU4eZBI2hegM3ZqElc8LeVbanCJ8BNwCJr2YfRm8kHdXBUx4auUbgrXZtjW5xsJ54FEJuFdzA91S+YodfiZaG0M2e13YYsWjcOHJIOnaNrT0rnzrGtvJOi0S/ec8GCm1UuM909PTBiWhdM+ym7gtKoNzR/GHO6iszn5CGhT1QWabtqP+td7O3g/Gy/pxfVEkvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3cyUm9kOUhiRzcreCtxOHp3dWVuMmpXKy9rOXpqaWZNSFZXVnd4cHA2TUYy?=
 =?utf-8?B?M1BGcUh0T3VseXVvajFvcHR6SXdoRllYRUdJN3gwVzFhdHlNOUc1cUEwKzdM?=
 =?utf-8?B?aWJEWTZtT21CQ010YVIwbnV5ZzBZVnB4Y2Jmc0dpWWVjTkJZd2srKy9ITHdV?=
 =?utf-8?B?VUdvREpteCtWUHpMUVNYOTZQd2xOam1jRFpmbndKcURsU2wvK2xnWjE4ZWtj?=
 =?utf-8?B?a2NTQ0hNanNyaTJaY3R2YVlRU0ZtL2RMM0hUc3hNZEprZFFLZDdRZDlSTW5B?=
 =?utf-8?B?dDhHZkI1Ykl5WGQ0RlE3SWdvTkJwWXJ5WE15NmZ5SDhHS0FEaFl5d1orMGZK?=
 =?utf-8?B?V0ZkTzVISlBtTFh6TE5jQWRqcGRvZFh1ODJMcFR6RkllRDVKU3lKQm1FUDgw?=
 =?utf-8?B?RjNjTDlVa0lUbGJ5UEV2M3BPWkRNN1lNQk5CbHB0T01JVENEamhkNGRpSzZa?=
 =?utf-8?B?a2NRSE15Qk5NRHZkcnMwYlhaZkRMZElZK2E1M2k2VXg0K2JBRTF6aVAwc0VK?=
 =?utf-8?B?b0xTSVErbzRDTEx0emRYbVlXNGFsWVFPcGJBOVhJS2ZLUWQrNDZ3eWhCbGZX?=
 =?utf-8?B?WkdHeU95YjRYK01qVUpEbVh2YjhYZ3ZaYVFDMk1yeWtaSitJQ3VaVjg5eW04?=
 =?utf-8?B?LzBDYW9XeUxCdlVYZVlSWWdjUk13VlJlajdBUzBYbzhYMXZiT1J1NjUraFo3?=
 =?utf-8?B?cGdWdDkvaVh5ZzMrdUoxaitPdHNlZFcxR2Znd0k3aklLZnRMOWtRaTk5bTRx?=
 =?utf-8?B?Vk8yM0NHeElOejdsK29ibU5MOElhTDVYR2N0aXo1TWsyOU9JL2JWWEs4UGYr?=
 =?utf-8?B?Y2dOaU5RcEdmL0pjOE1BNjlsekIvOGxzUzhGeUM4VTZBUmVqemtWK2JONUhU?=
 =?utf-8?B?cFJlVGxTcUVQOVJrdG55STVwajZGSUphQUVXeDRQTWxheVBreUVCaUNGNVBD?=
 =?utf-8?B?YUUramhPdVRkS2h2QXl5UDNlSEY0SWpkY3FpcWNrVDB4THJwV1JKWFhUbWhE?=
 =?utf-8?B?UXJZWDFSbnhMTktYNnlXSzBXd0s2TEY3Z2g1SGFrOVRGUWd4WHBKUzdSL1o5?=
 =?utf-8?B?QWZ4czY2M2MyYUdQWHhLRzZqQWh1MmM3N2NaNGdsYTNzNFBXdGpJbDc5V0o0?=
 =?utf-8?B?T1poSmkvQ3VsU2t1WTNPMWdCMzhjeDc3emZzKzR5dWE3amhsNnNod0lDVU1x?=
 =?utf-8?B?MHVkakNiUmZFN3RWN3FNZWdnYXVOSCtnQ3VOaUhxYU14SDRpbGdNVTZ6aCtN?=
 =?utf-8?B?bm9mOHZIWVQ5dDJiTUNiNXZIVUd2dkVsT0pYanpMRkU1M3JBLzliS3JLV2R1?=
 =?utf-8?B?MnpjT05ieEtDNzQ5UGp6d3Awc1duQlYrSVE4SWpUcGpBQmhGbk1HUkhxSVQ0?=
 =?utf-8?B?ejVyNmNaZTBzUU9GYW1NaWZrZEVKR2o0N0x4Z2lXVlMxQnMxTkZKa3Y2RlBU?=
 =?utf-8?B?WUI0Qnc4TUxtWFVSSU9CekpSQUQvMVkrTVhOTjYzUHBuNXFOVW1wZEx4dktL?=
 =?utf-8?B?blQyeTgzNGtrRVZZQmdGL3pDcUNRRTljZHl6K2k2cUtIZld6OHdjQUptRU1D?=
 =?utf-8?B?M2hDR1JWV0VNMW9hdCt0RU15YjlKYmZZQmZaNEREdm1jWklDL2VFNXl1VzFI?=
 =?utf-8?B?ZHdDT2ZEb0I1Z0d4UFNKWmc3a2dJQzlMQ0lkd2c1N1gvUitXdEFBWVVDYVN6?=
 =?utf-8?B?QlBjanB5MGRBUTlrTTlpRUJxTFBEZkN3Z3FkQzAxb0pvUXBnTEt2bmZSTGVi?=
 =?utf-8?B?SlZubUVyL1VTSVNqTkZJUTN0ejM2RVNWZkRNQWttMS9sS29zWXBvRmdlWExi?=
 =?utf-8?B?WHhiZGNBRWpQeEc5cUw1OGRaV3pMNTJaRGVETi9uWTdCLythZGNFSFc4YTly?=
 =?utf-8?B?RzZObnNDd3UvZW80QVh3aTUvVzZtYjZ3WG1VYThpYUxLWVp4a3pwNTM1NEY3?=
 =?utf-8?B?VnBBWmtrMG85MnVxb04rYm5ra0ozaXZzWUhzQXZCaTdHN3V5RTk1UWg5TUcr?=
 =?utf-8?B?b0E3WDVGZkxCcTZQYUlUOW9XZ1MrNHV6NWNmdHRjMW8wdlU1Z3F5RUZrd3A5?=
 =?utf-8?B?azZqNzhrV1BZdGE2R2hwVk5zZHBMWSszcjZMRkhoYXNaNmFVZThzSzh0enVE?=
 =?utf-8?B?NWVuNVM1UjcyQlp1ek9CS3dFZlVnRXhhdGE1ZlJjMEZ3eldqREtZK3d1ejda?=
 =?utf-8?B?YkRXdXJnV2ZYMDVrd0RFd09jRFhtRnZ2dk1vYis2SWJDMVZmcVNZaFRVL3hk?=
 =?utf-8?B?SDZQWXFqeXJaN0lxQUtXbDU3YVNvM2NMY0o0KzhsVTdFNk1qTStjNWMyR2hv?=
 =?utf-8?B?aE96UUJZdWIyUzgwMVVERkJkcGxJUjc5S1dJR1lLQStYYklxTVF1V3VTZEo1?=
 =?utf-8?Q?d7xf4WGOD/yD1s1U=3D?=
X-Exchange-RoutingPolicyChecked: oqAdn7wq7oZar93BKOIJL2QVg807BQqBXbvtk9pT5XgWfTp6QTW/VOAQ7MfDQ4400+deQ0lfC02THoMnxencxfclnFNhit3DGLVwA9Fle6vpXS9pH/fiJfuOB9b7wGpPZA41j7FVt4VeSdNEzF8tS8NuuVrf4XrfScXuUAFvHseXsgPULB6GLRMdiTLBheHTjO8s4yLYIdZ6Obsh2dr/zavf5FuqoePzrs2TCXVgpmIhTUqcCVEcAtoT6Rb2YocOHM3lc10BhL6BGNAuKYrl1ynDsaRuPt9vs0k+xsbXpxU43/ljgOKT83uwy6NpQELS4uiG0FHhiGY+lCvMXekj+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2af1a40-65d4-45ec-3b30-08df1833e62a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:58:49.5355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kft7lCUZ2qcs0bHYou2f4sXYIY/1WCGYrI11rUC1Ca0fr4kyJsv0M/xR8HbQIMavovIDZiz7xhPTaHSKK+csXB587A6JSZT83fcmFz6QkXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB184224
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


On 9/16/2026 3:05 AM, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
> Avoid programming the IDLEDLY timer to less than 5 microseconds.
> Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
> and Media Versions 13.01 to 35.03
>
> v2: Use xe_rtp_match_not_sriov_vf, move to local variable
>      Remove warn and other knits            - Matt R
>
> v3: Add verbose comment - Tejas
>
> v4: Restore IDLE_DLY register on engine reset.
>      Add it to GUC save-restore list. -Vivek
>
> v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
>
> v6: Avoid clearing inhibit switch - Bala
>      Refactor code accordingly by adding idle_reg_val.
>
> v7: Rebased with the divide-by-zero/overflow guards living in
>      a separate hardening patch.
>
> v8: Preserve the Wa_16023105232 floor (DIV_ROUND_DOWN_ULL) and the
>      maxcnt == 0 guard from the hardening patch. Round up
>      (DIV_ROUND_UP_ULL) the Wa_14025941587 minimum conversion instead,
>      so the tick-quantized delay cannot round back below 5 us.
>
> v9: Evaluate the Wa_16023105232 xe_gt_WARN_ON() against the value
>      read from hardware instead of the Wa_14025941587-bumped value,
>      so it no longer fires on the driver's own floor. Re-check the
>      rounded-up tick value against maxcnt and floor it if tick
>      quantization pushed it back to/above maxcnt, logging via
>      xe_gt_dbg since this is the driver's own value, not a hardware
>      anomaly.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Assisted-by: GitHub_Copilot:claude-opus-4.8
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c  | 93 ++++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +
>   3 files changed, 79 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index ff8eee3831aa..58a3f6293ce4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -864,7 +864,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>   		}
>   	}
>   
> -	if (XE_GT_WA(hwe->gt, 16023105232))
> +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
>   		guc_mmio_regset_write_one(ads, regset_map,
>   					  RING_IDLEDLY(hwe->mmio_base),
>   					  count++);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index d868af8e3301..9680d2a5adec 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -585,44 +585,103 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>   	xe_reg_whitelist_process_engine(hwe);
>   }
>   
> +static u32 idledly_floor_ticks(u32 idledly_ns, u32 idledly_units_ps)
> +{
> +	return DIV_ROUND_DOWN_ULL((u64)idledly_ns * 1000, idledly_units_ps);
> +}
> +
>   static void adjust_idledly(struct xe_hw_engine *hwe)
>   {
>   	struct xe_gt *gt = hwe->gt;
> -	u32 idledly, maxcnt;
> +	u32 idledly, idledly_hw, idledly_reg_val, maxcnt;
>   	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
>   	u32 maxcnt_units_ns = 640;
> -	bool inhibit_switch = 0;
> +	bool inhibit_switch = false;
>   	bool wa_applied = false;
> +	bool clamped_below_maxcnt = false;
> +
> +	if ((!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) ||
> +	    XE_GT_WA(gt, 14025941587)) {
> +		u32 mincnt_idledly_ns = 5000;
>   
> -	if (!IS_SRIOV_VF(gt_to_xe(gt)) && XE_GT_WA(gt, 16023105232)) {
>   		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
>   		if (!idledly_units_ps)
>   			return;
>   
> -		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>   		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>   
> -		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
> +		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>   		idledly = DIV_ROUND_CLOSEST_ULL((u64)idledly * idledly_units_ps, 1000);
> +		idledly_hw = idledly;
>   		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>   		maxcnt *= maxcnt_units_ns;
>   
> -		/* Clear the inhibit switch without disturbing a valid delay. */
> -		if (inhibit_switch)
> +		/*
> +		 * Wa_14025941587 is applied before Wa_16023105232, which takes
> +		 * priority if the two ever conflict (not expected in practice).
> +		 */
> +		if (XE_GT_WA(gt, 14025941587) &&
> +		    idledly < mincnt_idledly_ns) {
> +			idledly = mincnt_idledly_ns;
>   			wa_applied = true;
> +		}
>   
> -		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
> -			/* Floor below maxcnt; write 0 to still clear the inhibit bit. */
> -			idledly = maxcnt ?
> -				DIV_ROUND_DOWN_ULL((u64)(maxcnt - 1) * 1000,
> -						   idledly_units_ps) : 0;
> -			wa_applied = true;
> +		if (XE_GT_WA(gt, 16023105232)) {
> +			/* Clear the inhibit switch without disturbing a valid delay. */
> +			if (inhibit_switch) {
> +				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +				wa_applied = true;
> +			}
> +
> +			/* Warn only on the value read from hardware. */
> +			xe_gt_WARN_ON(gt, idledly_hw >= maxcnt);
> +
> +			if (idledly >= maxcnt) {
> +				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
> +				idledly = maxcnt ? maxcnt - 1 : 0;
> +				clamped_below_maxcnt = true;
> +				wa_applied = true;
> +			}
>   		}
>   
> -		if (wa_applied)
> -			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
> -					REG_FIELD_PREP(IDLE_DELAY, idledly));
> +		if (wa_applied) {
> +			u32 idledly_ticks;
> +
> +			/*
> +			 * Wa_16023105232 requires idledly < maxcnt, so floor
> +			 * that clamp; otherwise round up to guarantee the
> +			 * Wa_14025941587 minimum survives tick quantization.
> +			 */
> +			if (clamped_below_maxcnt)
> +				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
> +			else
> +				idledly_ticks = DIV_ROUND_UP_ULL((u64)idledly * 1000,
> +								 idledly_units_ps);
> +
> +			/*
> +			 * Tick quantization can still push the rounded-up value
> +			 * to/above maxcnt; re-floor here so Wa_16023105232 keeps
> +			 * priority even in that case.
> +			 */
> +			if (!clamped_below_maxcnt && XE_GT_WA(gt, 16023105232) &&
> +			    (u64)idledly_ticks * idledly_units_ps >= (u64)maxcnt * 1000) {
> +				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%u, so flooring\n",
> +					  hwe->name, idledly_ticks, maxcnt);
> +				idledly = maxcnt ? maxcnt - 1 : 0;
> +				idledly_ticks = idledly_floor_ticks(idledly, idledly_units_ps);
> +			}
> +
> +			idledly_reg_val &= ~IDLE_DELAY;
> +			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
> +			xe_gt_dbg(gt, "idledly %s: set %u max=%u inh=%u ts=%u\n",
> +				  hwe->name, idledly, maxcnt,
> +				  !!inhibit_switch, gt->info.timestamp_base);
> +			xe_mmio_write32(&gt->mmio,
> +					RING_IDLEDLY(hwe->mmio_base),
> +					idledly_reg_val);
> +		}
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index dd69ad07f7a9..3001155f8d09 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -72,3 +72,5 @@
>   16029897822	MEDIA_VERSION(3500)
>   		GRAPHICS_VERSION(3510)
>   14027054324	GRAPHICS_VERSION(3511)
> +14025941587	GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
> +		MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
