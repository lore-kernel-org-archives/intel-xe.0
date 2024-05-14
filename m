Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C49C25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 12:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E54610E0D5;
	Tue, 14 May 2024 12:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMFe+EGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F00610E0D5
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691578; x=1747227578;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=65GHyWUc1EoMToMSlX6skE7IvdcLzlMDfGJf0GnrJkY=;
 b=MMFe+EGgARk63oxcgw6fAu1iMx+bYn+iEG5M0edQH8m3qqAxO6jV4RnG
 xWyB8++7WHULrhU+t0jtbhHOLsGbsYcCZpQ3SPj8UkNc+HLDlRERw7YPd
 PAecMJdS0MDjH02K2GRPTrwKs3tNmm8NEAyG+C2jt2ngfSHj14sIgVb+H
 2tCyYCe7I4xOMm6c9oQn5uBgqtCdkORbusKdpT3pJm8I46tePBnCQSSDz
 GFdEl7wu90rQE/znyaG/Ut1onZhzwvDz7U5DrrPJyvZW3Xf3m/8tW/jEz
 qzSIHUvQOofHt/+L6nbJ2mGpWcflC4ViIFPlyTpugSNnOVXc5Pw/MKttG g==;
X-CSE-ConnectionGUID: 7YUBy6q/SquExvUg3j7KPA==
X-CSE-MsgGUID: DXWF3nF+QzukGi2TNQUbOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23067514"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="23067514"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:59:36 -0700
X-CSE-ConnectionGUID: 8Upj5zd/QgWk4PCgnUhdEw==
X-CSE-MsgGUID: mGy3Wm/wRZykNLxKEMpD6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30629749"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 05:59:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 05:59:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 05:59:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 05:59:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYCx2ef6PQ8tDszWVpMjqaUgL7adIJEMDHa7uuWsnNihblHTZCGpOhGeZxES9veYl61nw4EE5WTX98ZZhneJmYiykkbYuyX91mGfD4HLfJ4YXKlXM//xXpsXC7ypYdHwV9XdaZqnmaRaT147YOJjJIEOp7EfOdCbZa9IsLat0oeBWMxEt6SdlCRZHJerT0wpVLJR7co/gLLCdpQtZYsIpofkg6TWEGuJoSwZp3j21zHkOVDw5DHGv+Ng4yw/BL2hi29sALpF+N74jh7SfoyOqTSYi/W5qfLveq16al0T8mtP0Bu2d48BMYNOvdVrwUMy4ALUKjREQUIoz7QQs/IUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnFxyrtqx4L5PQw0WUwVk4/1HQrcnHus5cAYQ5hq+60=;
 b=Pent+rVKwZ9/qA8sj4yHCTL2lxcMsv1p3DcR4MmquVh3gFsoKgKqUFSuFxhHOxD5qovADWJ2KX9vXyXU/JsihFRbjeIIUddWzzX1KLr4KYKyJ2FEuV/b/MCvWbl8ZN+kSZqx21mEnPws1DdVLg6M0aNfuui1W/ZaFEMuAzCYhDaWscd/Fy5t0dNlAoxtO7XtRhY+xhnIuMamE3z9HU03vJaqEMn/4yO/9pvNXNS1BCa1x+m8AE3jrZfRE7a79YxEAhGfg6BehGpWxESPqx+85QT8IQ8r8reOfuJ9dAuCPSA3f84mZ51g5PSnIhjBGE9+j3r3L5VPCVNZUfV3Ts9How==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB6408.namprd11.prod.outlook.com (2603:10b6:8:b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Tue, 14 May
 2024 12:59:28 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 12:59:28 +0000
Date: Tue, 14 May 2024 14:59:26 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe/guc: Add VF2GUC_VF_RESET to ABI
Message-ID: <20240514125926.pkejfm3ssscx72ua@intel.com>
References: <20240512154915.2040-1-michal.wajdeczko@intel.com>
 <20240512154915.2040-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240512154915.2040-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DB8PR03CA0028.eurprd03.prod.outlook.com
 (2603:10a6:10:be::41) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 72613028-2d58-45a6-72e3-08dc7415b0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3NWK3NlckZCK2dzSlBaeUJOUHBFZ0dJVkhRS3lzQXUxL0t3RTlOdnBIWE83?=
 =?utf-8?B?MDlsRXVJT3kwOEpPUXJQUytmUThtU2pQUEQ3bnNFem96TElMQkhKNmF6bDJY?=
 =?utf-8?B?M2xWb3hFWE9JVUxHMzlqWng0WXVIR3E1djZncC83eGl4c0pKa3QyTU1sQTdr?=
 =?utf-8?B?N2hvcDNBeitrRk4rVDIvOUp4ZG9Va2VUMS9jOEY0TGlLWDZnd2pjV1pqUHFB?=
 =?utf-8?B?SFErQnBZbjd6NkF1M3hKN2xXWkxiYWZBTDlsTHZ5R1FSeDJiVElDeVhoOUhG?=
 =?utf-8?B?cEsxc3RnU1RiVWIrMmwxbytBc0tDSldEaTNJanpzZE1INFFhV040akV6SjNa?=
 =?utf-8?B?VW42MW1kQmNiditvMWgrY3JVcGlZYU1BbGhpNWovZ0dtRmRlK3QxNHdQVWor?=
 =?utf-8?B?b1czd2w2Z2U3R1hLeXVSNVNNaldqbWYwRXpqMU1ZQnpHSkNiS096NHJTa3Jr?=
 =?utf-8?B?b3VsV243eEZXSnhjWjdZMS9CN2E4NGxScHVKdDdiOUtkSnVUZG82ajUxbU5Z?=
 =?utf-8?B?dXExZkpRQlFFMk1RZlJWVXBkVlJ1QWlPcWJpWDZRZVBGUTlWb2VlWlR4NkFl?=
 =?utf-8?B?aXU0bHRWUm4wUzVuSGswQWExUmdRY3BIandudmFaQlN0eVJXanExMEdwMW5O?=
 =?utf-8?B?ZlVhMVVjWS9wUW1MZnhoQjFKY3dDcTAyTGZqNTBkd0lpRDNnVTUwc3dySW5y?=
 =?utf-8?B?d2orU3lrMXN5TUxxNFNQZkVnNlA5WC8xU0JSU0pqT0wzMmNzNzU4RGdoWWFN?=
 =?utf-8?B?bFEvb2VsZ0hEZjlma2dmN3Y3U0lDNnMwTWd6endaODh1dlRuVWlnZVZLY05h?=
 =?utf-8?B?KzQ3Q3hxMERNR0Voc2RBQmFZYXREdTFJbW1JelBFY0pEZ004YUZxdTZVYjdx?=
 =?utf-8?B?ZHhyQjhsVFV0b0kwN0U5aUQ3bUMxNWcyOXh4Y1FvckdlUVdJSDYyRjdYRUU0?=
 =?utf-8?B?WWxmSkR5a2t3TjhkWEdWaWFIUjRUOG8wVzRHZi9qNWhFOC9iN09OV1lCTjNs?=
 =?utf-8?B?VnBpYnZKaHk2ZjhWRHFCMzQzb0Y2QWVFbVduaXB5c0w1RGYwcXRVZStvWnBB?=
 =?utf-8?B?bUxmcHYrVU9kdHEwMVU1c3RqSnZLV0xGRTJQTkNxdURPYzN6V2JNRlFuUXpW?=
 =?utf-8?B?NllHNmpsS3RVdFhYR1pvY001ZGx5bGtna2x6cTFQNjVFMTY5RXhDSFExU284?=
 =?utf-8?B?T3dkRDNFUEVGQWJXRFQ1VVZ2WVI0VEd1ZjkycVhDMkdlOVJFS3F4b2dFSG84?=
 =?utf-8?B?VHNqU0xLM2NjUDRUeG9SUkJ5TkVKMUhyN2tEUzYydjdTQ093cXVnbUhSdUxk?=
 =?utf-8?B?V0F6VFJQRlhLUlg0YjV4bXhibzkwdzkyZzBWQzlhT09QbU4rcW52dHBGdmdW?=
 =?utf-8?B?Qm51cERFdVRCcUdJNzFiOCtnTVVBeHoyMmRkemt0bkV5YnorYkIzS25NZnhK?=
 =?utf-8?B?d3hhR3VMR2V0eGJTS1RpZEQrcDlEMHFHZlBpN3ZoMUlOUUtnRVAwN0pqdU5P?=
 =?utf-8?B?RlRXOUpZQS81TVVIcCsvUXFwZnJUNFNBU0ZIREgrUmt0VW1ONVFoYVoyTldX?=
 =?utf-8?B?MzdrUVpUN2UvUTduS2w4WmwyUHJZSmtlTnY5OHBoUkpWck40REVWYzJUZVRa?=
 =?utf-8?B?d0xQVHZwODhuZ1cwOG56VHRIYjJWZkptVDc0clUxVVdIREZXZ1ZoZmVZK1FJ?=
 =?utf-8?B?QUM4ajFIVGdCaDJDU1RpYmd4ZHBId0dxSTV6TGVTM0pJcHRSSUNHVTNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWI2QnVZazFmWEE0YmlVRWtLZHQzMDgxajE1UzNxdElkODVnWmNUOFBsOGRr?=
 =?utf-8?B?TllPc2txU1dkRFpHc2ZScHdxVStjS0dmNnI3M0kvQkJyeS9qd0lCR3JrcWM5?=
 =?utf-8?B?Wm9rbUNIVzIxbCtnQWtGQURudTM3NlZMY3hDekpDM2grckJkQWxJSWROU2c1?=
 =?utf-8?B?YUtyMGtDMjFUVUFvTForaWp0SFp4R1doTkQ5b3o4OVV6cENZL1ZDMHhidGF3?=
 =?utf-8?B?WnM4THoySTRLSUVwbUVJbE9rcUdDY3ZCQUMrUGplRjcwZFZVaks3RUVkanJU?=
 =?utf-8?B?RW9RNFNGeXdmbUo3cHZDM0Y4VVRqaW5wU0dSNmg1NWc2K084eEZvUWRLakpS?=
 =?utf-8?B?YjRnTUd1bmpPek82cDllMmJRbFF4MW4zeHN0RFNNN0pCWC9ZUnFSRDZqb0Yy?=
 =?utf-8?B?bHVucjd3bGhaL0g2YlVDZndIT1VCbzlPWGNWQVkzeVRuNTFCRGkwR00wUmU4?=
 =?utf-8?B?dWdXTGZna0FWYlhUSkExRyt4VmxaVCt5bjZITGtLSHY2Z080S2FueTVmZ2lD?=
 =?utf-8?B?Z0U0Wm1mZjJySmtWbEM3RUtWMlltbzBYenlRZ0dlcVJ0QjgyZ0xTL2pQWkh5?=
 =?utf-8?B?bkVuOHRlU09QY2VlRVUvTHR6cXVweHBSWTZUd3BGbWFQOURyT3V4VzdvV3FR?=
 =?utf-8?B?Tjk3cXFmc3NaWUtySjM0T1dCdEtQUkU2OFV5UmdCUndUUkIvaE80UE4rNGwz?=
 =?utf-8?B?YXVOd1JUU3Q3dFdsK1hUM0tZYXBtMHBCSHNmKzBVR1VXTkx4RDQ1Mk1wNTBr?=
 =?utf-8?B?eDhPakM0QmFqS3Uwc1o2Y3huQ0RYS0FHN1V4L01BZmx4b25JYUJiZDE0a3hr?=
 =?utf-8?B?bHpPeTBrQjdvY1pTbHlZcG45cWFxblZsNXJqZWh3c3FoSlR6ZDFhbzNhZHMz?=
 =?utf-8?B?U3dDcU9URTRWT1V0c21aTWtRYVVEcjRwcUVxYStXZEhqQW1OVitoVTM1U2RN?=
 =?utf-8?B?VHZZWU5lYTFTbm45Z0MwWm9hNHJ3RlQvUkVyMGU5TEZRb042NGZZOHB3cW1o?=
 =?utf-8?B?MWdUaHg0b0NhRDB2MkNWQTlxVG93M0piSkZtVHFleVJ0cVRYd0FuTkQvQmpN?=
 =?utf-8?B?UTBzRDBVazZLNEY2STlHSGtqMVhxQzNIU0lrNlpyQ21xZi9DZTFWOWdha29I?=
 =?utf-8?B?WWhlRHF4ZHBLMWhYZDlnNVFpODBseWJmeTlsaVJKUExuNkFydFI1WWFzb0xT?=
 =?utf-8?B?SEUzaGVnMWVvem9IbUE2UTI4YWF2Y2NpTUFRUlBoY0kvNmhLd2MyQURVMFVP?=
 =?utf-8?B?RjhXVDVBYzV4SldhbzcxQ2lBdzVCVUt4YkdWcnBYMWxvcFVkU1k1TzBZT2N0?=
 =?utf-8?B?L2ZKeHBVdW5GazFFOFNUT25pcW5wanZjamhBR2hlK3NKUEFpeEhFTFZFSHpi?=
 =?utf-8?B?aFZBUWl1OEZYajhwUUhCa2o1NFc5OEF4L1ppQkVEN3MzZkIxRXFtUzRFSnB3?=
 =?utf-8?B?ZEE2S2xqc2VrVi9RdzNKby9TWlk5WS96YjAvNk9hbFNDSUF6UFAvL2Q2MlVk?=
 =?utf-8?B?MFozajVWUnJjUVdVTU9sTXpTWXBuMlcxRi9TNHFoOUZCY0NnVXdYaGNRNkky?=
 =?utf-8?B?SWVqNzlmWXRweVdLOWZ5emNYNXZwSU1TTk5veW5QaE8xWlh3SDlxTytYKzhH?=
 =?utf-8?B?QlpBakluVzhrbjYycjdwRW9iVzNwVnUvSU9RSE1JVW1DM2Q5akRxZEJybUlk?=
 =?utf-8?B?SUhzcmJTazd0NDRGakRSZWJhZDVCV0VleGtIaHhyQk1ibHA4V2pFUXQvTHAz?=
 =?utf-8?B?RzlrNzZ0VUNaTVorMkpKRWNZdWc2NVpBZ2UrMDl1dkpxODZyMjZGandmcXJ2?=
 =?utf-8?B?ZVNadnRYS3BkQVhkRWJqNDgvVkp3UXdZYmRvcE1oTmNIYlN0UkhScUdIa3Ay?=
 =?utf-8?B?WXpVczZwOGd4eXZKdFBPa3c5T3hjcmh5WWdSeFl5OElKVDVyQ05hTXdQM3RX?=
 =?utf-8?B?cjJPYmtNRUxWL1U1YXFvTEpqV3lTeHJGekpiOGFDdDFTNzVTK1kzbUN5d0NL?=
 =?utf-8?B?cDRBUGRSekhnSWRUT1I0Yy9aK1ptNnhnY0ZJZ24yWmZLc2k0UXhFcXdIb0c3?=
 =?utf-8?B?UlBmVDBsTVBJamdWS0J3WXpaL3ZXVCtRMjFOZFpRdUV5VE1makRwNXVLT0ZF?=
 =?utf-8?B?Z2FlK3RzUS9PV2pnMUkxblpTMi9LdWZRajcwanpWSENXTDEweHNGeGxqa2V0?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72613028-2d58-45a6-72e3-08dc7415b0a0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 12:59:28.7632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWdtRUlyUe7cQ4014MYa3aloeUJELN1VMBgVIC/H36x1S0x+WCr5XEuRrRPuUR1zyuzZTJO51Lvg3AhbBe1YfzosWhkS7sq4KZX4ekCVjfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6408
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2024-maj-12 17:49:11 +0200]:
> The version negotiation between the VF driver and the GuC firmware
> must start with explicit soft reset of the GuC state initiated by
> the VF driver. Add VF2GUC action definitions to the ABI header.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 49ed5fbd4ced..dbe6eb47dd31 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -434,4 +434,41 @@
>  #define   GUC_PF_TRIGGER_VF_FLR_START			4u
>  #define   GUC_PF_TRIGGER_VF_FLR_FINISH			5u
>  
> +/**
> + * DOC: VF2GUC_VF_RESET
> + *
> + * This action is used by VF to reset GuC's VF state.
> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_VF_RESET` = 0x5507              |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_VF_RESET			0x5507u
> +
> +#define VF2GUC_VF_RESET_REQUEST_MSG_LEN			GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_VF_RESET_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_VF_RESET_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
