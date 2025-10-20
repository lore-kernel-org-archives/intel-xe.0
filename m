Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C383CCD1A2
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 23:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D139610E53B;
	Mon, 20 Oct 2025 23:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqXyOhi8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA6F10E53B
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 23:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761001936; x=1792537936;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=hqXyOhi8pDhxj9MSolD9FnckhFVd6BSNSEskjT/ORoii7UTdW3eYj4Pi
 9+uZqRH/hGWDQ5rJwAMg0mJVtIv9vXznRriv0LwAHsRiVk4GjAxXKO/vT
 FH9eBv3Met/A8hCdut5ZMxpjHFShCSnZZAT66HN/smCjRvFDjR0cG03eF
 igtA4QEOFo1UVaWzt7qP5ocxPda8GfhsXMrhihSujl2n4ClZec8O/u8ej
 ka/1K9m20ppOX0Kux/Di8TvfQ31b6uqv3nY8292y3nf8ib9OFRCHwDbOP
 8iLkuZP7YQZi0LxQX+DlUwCAimx9I/JCh/RH2MO8qveJizfxeWA/U7y8q Q==;
X-CSE-ConnectionGUID: 0MZfeVZdRveynYNIp6szOA==
X-CSE-MsgGUID: Ziz/eQwETxe1PKmHTSM1Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="65741016"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="65741016"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:12:16 -0700
X-CSE-ConnectionGUID: aRxXg+1HQAav4zy87S93HA==
X-CSE-MsgGUID: GGWKccCHQ16/1TQfH5I1Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183925961"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 16:12:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:12:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 16:12:15 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 16:12:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exCKAn5a/q0aGGkkptzVY/9/VTQ4lYv4qLRzo//baTqnodIyLbvk8XrSu8c1he7meEiv5r2S2JxYdWz7s+DGwNsYvrrw/saEM9iyZWbwsyFzQ1uay7MHO8Q4y+aZwATqVO4igq07PZMVJptMh5JGghTgSy108jwTRTY+pd8UJIU/FdvtrKJDIL11oo4D6Ap9NyWfFfWQB+4L5YgsbO6pb75MgwvjETYsER9o1e7cnOPJtE+3k4TS7A/Qq0mROUHaK0DWDzEpw3myY1t+D0/ms0Mf833adVTRYVPW+ESA3775mLEz51UnuicZX1AscLqpBE0ts7ZQoBuhOUx7JpUJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=cb+i1LZ8iJ2v7GyDvj0BYWyIlEVbQ7fnH1ViFFyMFceFDaHbS2WlslTe0oOfgTkThGJ82V1QvWHtVKVyBW/8Ty1cjb2GLeHyJKfJzUx8tBmwqQV1lBGczltinp5494udtPqXT9LndOPIyfe71EvQCge8X7Kx/ZPcOMNy+gJp67IV0hzCTzLVKBaat4lZhUxty/MTr+JHuVQu9TFTOeBfPcIKULy0K/fFc4XRknuzbgYu6Ln0CcCWriwFVJ1itQBKxNrgrwYCUC0IJfAfHO7R2TURFJ8/E3JCPmXoILL8ceXfxTtwC5WQvWZc93J7RPXJt9F3XZClxON+nlT/QpHm6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by CYYPR11MB8405.namprd11.prod.outlook.com (2603:10b6:930:c6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 20 Oct
 2025 23:12:11 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 23:12:08 +0000
Message-ID: <1024520d-f2a4-4428-ac37-ac5bbdb7ebe1@intel.com>
Date: Mon, 20 Oct 2025 16:12:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] drm/xe/guc: Add new debugfs entry for lfd format
 output
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250828174159.1232994-1-zhanjun.dong@intel.com>
 <20250828174159.1232994-7-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20250828174159.1232994-7-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::31) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|CYYPR11MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aed0534-8962-4901-c42a-08de102e17b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkZxRUIraC9JVFFETTJsZTNrdGNqMlI1RTZhcWQ5SVB6VnloRmdpc0xUM2Ri?=
 =?utf-8?B?Q1hXVy9QbHJNcDJURzFDcXloWXJCeHBNanZjL1hpN2d4aUllOGlaQWFLb05h?=
 =?utf-8?B?cm9VZURESGtsVWNQQWkyWGlORzducEVnQWlxNW5mNm9tOEpITmNrZ3ltMWdL?=
 =?utf-8?B?dHdmTGd2QXpFMXQzbWh2TkZtdXFEVWFxcFdHRmNFZkU0ZjNaYVVwOVA4M2hq?=
 =?utf-8?B?MVgxYnBob3N4ZjZLa1hrSVl6R2cwN2JSVHg4a01qZUdOSWJTZ0F4VHVJMFlX?=
 =?utf-8?B?Zlg1UTFNMFRaUExMY0FsYWVBT0UxYURtelhKallQNVRIZUdXTGdnNnQwWVJK?=
 =?utf-8?B?STdvRkVCM3BRcW5iV3U2eEhMeTZxZmtTYlhQKy9hWG9icDU3aE5udVFaTGtx?=
 =?utf-8?B?T1o1VXE4U0pxQ2w1SnN0OVJzR24rYWNFMlU4a1U3cURIOEY1RkphUElOeHNj?=
 =?utf-8?B?V3dERm9SQlVhTDFubnVyMkdqdldqTFc3bUMvdlFmK3VBRzNPcGgwNXpwdG9H?=
 =?utf-8?B?MXl2eHhMWGl6MEZHK2IrRmdrK0tvWGVLWHFxT1VuQkFKQnMvYVJ3SHRiV0dF?=
 =?utf-8?B?emtrWUo0NFE0bjVlaW94NUJqN0haQlU0UndWc3RNeVJybllJTWlXUVFiUE1y?=
 =?utf-8?B?eUpGUTZXQVI0bFNTRmwvSzR6ODh3R0llc2RHbWZQZkFOTWkreldmMjVwS0dm?=
 =?utf-8?B?UU56NXY2cEtWcVBTWDR0cEIrdW8vL3RleDVZSE5OQjVQZHVDTVVzRHA2N2hG?=
 =?utf-8?B?ZHBLdDVJczFBUnFQZ0JMSm1XRE52cHhtb0s4alZSbW9FQ04rcE51Zm1Cd1hK?=
 =?utf-8?B?ZWlacFVXOXl3dGV2K0N2MWNxQ3ROSmR0ZDZOcUlsdmVPdmZIUEVtblA4VWJu?=
 =?utf-8?B?VUNpVFo2ZFp4eXAycUVkZnNVRnl1QVFJMXdFREttcTIvWUtyY0NUTjZhRjI3?=
 =?utf-8?B?VVhiVmZQOVhPZm0rTEhiYlU2ZXBqSnlRMTcvVkszNEVIaGdWMkM2R2ZNT0dZ?=
 =?utf-8?B?SS9BSFJocnV1cmY4UGc4YnNLK1NnUitGMUlQZkpqRlNxQ2l1c0IxcHRzVFB6?=
 =?utf-8?B?NktzTWlSK1FjbER2ZEp4ZlVNc29Hd1dzKzRaMHpwS2E5TzQyRWlqSm9kcXFF?=
 =?utf-8?B?QWtrNm1sZi94V1BmbEloaUpHWWtnTVhpT05ESWlBVCtsL2ZKR0ttQXFIblRt?=
 =?utf-8?B?bTBXUG81NmprWDFRNk43UjR1QVB0UEJWR05ndUlWZmpTNk82SUZJUjg1bUk4?=
 =?utf-8?B?dnp2OUV0aXhSVitzdWlueDFiRHJURjdCaENNRkcvY3V3ZTNVV1N5YXNmWkZB?=
 =?utf-8?B?dlkxTCswdGZzNW1EQ2E0M2hmQzd3ZGJVUVp2VVNMUTBvTEdFMkhiaEdKdkw5?=
 =?utf-8?B?eG94Z1h0V2FKZDJVdGlhMU1jcEVLYnR5OTdWeEd0VlVNL2Y1UHMxQWhXQ2s5?=
 =?utf-8?B?N0UrMy9PNTRiMnJ1dHdrNnplQU5QdWVNWHdLUGFZUlh3UFdVSUdlYndUNDJS?=
 =?utf-8?B?RmhpKzlmMjBUNXFCRTdnVkNrbXFraXZWVlhKR1dSUEpTeWlEYjRXRlBFRWNz?=
 =?utf-8?B?eVZUODFsc0hkK1FKZW5NWWkwREhzRm9NOFVqU3VSVURLL3ByeForYTNmRUxa?=
 =?utf-8?B?OGlnYzJVc0cxUjRUOFRRdEN2L1hKN3BEN3BhMWhva2tkNUZRVkE0TTgvUHNO?=
 =?utf-8?B?MndNR3N1MFBZU2ttZlNRVVlZTXFCS2hCV1lhdlU2WWxJQU5vWkNaZ1NVZ0pX?=
 =?utf-8?B?MWN0akNXUlhkem9RSmlqUUk3QzZoa0wzc0ZMd1F6YkgyTFBTVlN2WElPK3pS?=
 =?utf-8?B?T1hVWjl5S1hPeXBqSEdyWVBNL3NkbzIrTjJBSXZPUFY4Z0JpSkJtWjJUSEZT?=
 =?utf-8?B?TWYrK1ZTZnc1ams0cDU4WFRtcHRmYjlRS1pYZE9qTDlTNmJCT3cwVkIxdlAy?=
 =?utf-8?Q?9Ii44D+l8GybCUgVoEyrHvxNiFL431n5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkxmdmlNWEtTOHRSTUdzbzdKaENLT0duMzREOGgwZ0tvaWtkd2ZLTTdKVDNh?=
 =?utf-8?B?ZkZaL29pS1hQS3B6K3c3K0RzZXRnYzRsc3o2RXVoL1FNNVMzUy9FMGtUNGcw?=
 =?utf-8?B?eHdXTDZCYUxRS21ZOVRISVdGK2ZXK1F3emNwOFJUcEtkY1BUcGdJWjIrMWFx?=
 =?utf-8?B?VzlEN0dsc3E3SGhXL1RFa0Z5VkEvNEppMTFYc1hScitGYjEyelEvK3NRZDcy?=
 =?utf-8?B?SmtVcDNwOUNibkQ5Z1QwU2ZrTEJBRGtHdkZMN2kva0VXbFZEelRsWjk2MVFW?=
 =?utf-8?B?QlpzMlhOVmpaV294TjNaRk1GVHNtQWh5NVhGaTV5WDZxTkpKZ0g0czF6bDFw?=
 =?utf-8?B?ZmhMOHYzeldQZUJQZnBoelVXNGJQOGV1L2NBanFrdjN2ajNHWVhVRWRkZzQz?=
 =?utf-8?B?NzNxMFB1Yzk3dGNoM0VVYlE0R2ZXZ3lkZVZDdlNLQURCeThyRWJybGlSb00z?=
 =?utf-8?B?ZU1BU1kwa1E0YW9DOVF3aG5zbXhJcmJqVFpZZUZhcUNJeXFsbFpMeFZGeTVt?=
 =?utf-8?B?YzFTRFp5QUI1bXN4eDIyWkZvYmh3YWVqU1FMaml3MnhBZ2tzRVUvQVVPZFBr?=
 =?utf-8?B?eGFtVlJ3UUpDck82T3dmODZYTUs1Ym9tTHcrOEZ3d01yRjJPYWpBS0QyYlI4?=
 =?utf-8?B?Y1ZDN3ZRQ1RmNHo0ZVZzM2hhb3RVYk9KUEZyYXljZEp2Ukt2OFAvWXhmT2t6?=
 =?utf-8?B?QnNMZ1N0aUQycDcwTmQrY3dZc01zb2UrTUVIeFhWdkF4WExlUzZsajNrOE5N?=
 =?utf-8?B?cm9lSGNqZDI3dVliRUxvOWwvR3VwYlAvUlM5Wlltd0E0dWtmblllVk9vR3F4?=
 =?utf-8?B?ckZRaHh5TWdxT3ZsenZIOERxYkRLQ0RVNm5XYmZwZlBtSXlZSGZkNi9lRnFa?=
 =?utf-8?B?aEFKUmR3Tkg1TDM5UWxrQityMlg1NnVtclNnZ1YzOVlzMXZWVjkzby81VEN6?=
 =?utf-8?B?a3gvdWV5Y2RrMkgwNGR1ZnlPT1Z6UkhERURLYWxLWE5MR2NVbGIvK2lEbHBm?=
 =?utf-8?B?bmNpZ2F5MlBpUU1wcmQ2bzkxSGREWVhDQ3ZEVkNJUkdOamxYMnVJSzNiZm4z?=
 =?utf-8?B?ano3MW9BZmRWYWdFSGNrRXZWd0NGcUlOeUgxSjFDMWFiMElEVmVkMCtXa0VT?=
 =?utf-8?B?WGhvZDkvK25YY1l1UGkzbXFrOFdBaXZET3hPd1N1aytkZzhmQ0o3SUFyZHpE?=
 =?utf-8?B?RGt5d1llR21VK21XblY0OUFkeE5HcHY0eFJ3M1R4V0tkS0tVYmdGTkc3bW1o?=
 =?utf-8?B?SmEvcWRWOURiM3BCcnlBQUdGZFhjejZlSmsvTWFBQXNQQWRSMzlKdXRGTUo1?=
 =?utf-8?B?SVc0b0J0emRTVFhBQ1JQYm51OUhZTE5OTzk1MkFwSDF5ZUQyczQvQU5LZGR2?=
 =?utf-8?B?bFNRU1JPeEtKYkYrM0RPOXpoMVdGV1dvWVE0M0JZdzVRRW1uUHZDaTdjZG45?=
 =?utf-8?B?bnRqNm45N1pRRWluNFlSTjVMSFdGNzdNTGFJdS9sSi9RK0t1ZDIrbHIyR1VE?=
 =?utf-8?B?R09wc2h6MjREMkJuRGpHV3YyczBXUDVjNmJZS2FpMEVKZ1AvZi9oZVJxcmY0?=
 =?utf-8?B?eGtZWU5jeHhibEM3aUpCL2ZCd1NLdVYzdVNBUjV3K1lNOEdja0liL0NlYm45?=
 =?utf-8?B?ZUtFRFhKOVl0RVBuMlV5TTZYRUR6V0JLQzc3TXlaRWkwNlQxKzliVlZFSSts?=
 =?utf-8?B?a1F6WXAraVU0aEtHRFc5djhqS1F3bk02elM5VGlBSS9jRGZZd29xNkU1a21p?=
 =?utf-8?B?QitiM0NEUDc0Ti9aRi82NXlibE1GbnI0M2xVQUlzZXdNYnRka2NHblRtTkN5?=
 =?utf-8?B?S2tJUEszM1RtVGl1MXRaN2xobmVESzI0TnVuWnFkOVFuZXdSN1FJaTRGWG1H?=
 =?utf-8?B?ZGJvVHV2ZDNtenpRUytpc1FJNWtWVzZYb0xtVlV0cjVhWEVVWklKL2h6d0Zr?=
 =?utf-8?B?TGRleENFOFcwOTZLb0czSVV0QWFqTmFSS1Q4RGlrWE91TFZpcGg2QTRxc2ZZ?=
 =?utf-8?B?VkVIaTlsRGlQVk1BdVpIV1JaVWtVZDk5SW43YUJqTklhUlNPZkMrUDRiVFJ1?=
 =?utf-8?B?VEIxaXArdXN2dEpXK09QSmxkSjVmdFIvOGtLV09oeitXZUpDTnVHM0F0eUxH?=
 =?utf-8?B?YTBaWjk0RjRsTUNuM0VnYmNLTGJ6aHQ5Q0syM1BvQmpDdjFEZ2M0a0FoWlBM?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aed0534-8962-4901-c42a-08de102e17b7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 23:12:08.7935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4IDTl7/v+om7yXi4xWfUgNOVu3UXpFr3zSpGhePHQZg2WFGaJSUDFpV9hmfggCkMBvONWEi9Mmt/MOd3sr/Q/8SFG8103Gchas2PW1VLx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8405
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

LGTM

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
