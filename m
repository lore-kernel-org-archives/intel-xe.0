Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B48BCA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 10:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67F610EB83;
	Fri, 29 Aug 2025 10:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFn2qTlM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB0610E146
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756462820; x=1787998820;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eWMvHItS+Oscr7J2UqDRXiFXldND3fowvzFZnD8TDwU=;
 b=CFn2qTlMmElUXG5SLuafrE1KDzbaCeDIX74oYJa+bH8krMbZL2WOdGvA
 xBO2t6PPz35S9CFCjRrBcgAAVArYUEolPWTF8BwAfiMRH1/rZpN1jijSx
 jA414b9e4ylBNrce30KEpLlzQamaefA1Cu/CcG7nMh4C+d9zjPy43UKZc
 GvQEm+z4Y2k+QwvriB/aF2dy1zAn8EQqeooEIXImsgV3huo4IRmIydCra
 jf+8pmzKylrHgzQXBLi5bTqsRTXti2JEKpqSDyHsoFsYmyXwRTQyUw8LV
 Ac14nqcfmW0BWuXncUbaL/FQZlYVfcFqcJbV4O5ZKoVsIlZF4EUFT+tDC Q==;
X-CSE-ConnectionGUID: qUoBEq+PTEqmHjuy3a/TdQ==
X-CSE-MsgGUID: HPUIgUuPSHmejYrhowmlIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58812074"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58812074"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:20:19 -0700
X-CSE-ConnectionGUID: 02/oS4N3SB6PXn+H79QVnQ==
X-CSE-MsgGUID: NFN8zL4bQy6JlWJ6eGQ5hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174704075"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:20:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 03:20:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 03:20:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.75) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 03:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ul48U9nXn8lKVPjvTcqP/BgS3JplczOyN8O7JJKIzPm+I8ykIX/p7DcZgZ9Hmu3SCrnbWLfc2zpvWe9EBmgGBIJIPbr4wY2IkOJ2iE90HyZxSkIvVqRedQrzL1TlT341vwkJFeqqO2exdn5hQorqVg+j7Z3ixXQG0f66g/LJks5QgHH9MkU4CME2Fybqn3DpkpWcIbHkLqcBUk5WFTF/NEecBF19tQY04Dhh4z9ZGoA8US7GOAqbIVh3Qzvzn+4lgP+TRhjvXxpDdIQjUpc4wPwc8om2HuGa+y6LVUsjneiATvZJz15gb8dzhoQD24FIpEFVzDlvOgL6i68E7grFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e36e0ykRtql7nVQAG6geF3G5l4c27JefAqMXrqA4jEw=;
 b=O2en+MZe3dVnS2TC6PIJ4ORcqKb2VPbUgTX5eg7UZz9H1yLvRv5rNH/fnSa0S92gzKuYXfWwMqjOECYiiE8RhHbvr8mn8cok0eo5HvcOSAdGZJjVV6wIzO9ctCFL0Vr6yXydo3BKyFuAXHH58MboWiM6cok4w7QRxrPkMyRKYLgl29lPlx+ZuJu2H0KpIU3Xf81qCvJeH5o2J4Pirnxp+J/mHhvpqmHDxDm7KwTsGdhRpNhJkruboK+Jqhot67tIyylk0NsF1zQhtpd8SrQ9c3NLJ2ChiFTQGVTotSDtaLGjmekYOYlR/MWmWueKIQyJVUprdrgzbcY5AJ04jnoZnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Fri, 29 Aug
 2025 10:20:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 10:20:15 +0000
Message-ID: <5d8a7ec4-8827-4e50-9cdd-5f485a28bc32@intel.com>
Date: Fri, 29 Aug 2025 12:20:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Update GuC log buffer type value
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
 <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
 <0b71e049-bdc7-4ece-a978-26e4f538efc6@intel.com>
 <d0da1a9e-b4f9-4885-a5e3-0b03d001d12b@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d0da1a9e-b4f9-4885-a5e3-0b03d001d12b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 8700571c-c7f3-46de-4a70-08dde6e5a58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDFubTFmbmVmQXhJUnpYVUxnUTk3am1XRnZMVldkSXdsaU9aUHBGcnJBRk92?=
 =?utf-8?B?NGh5ZVNpaW9BR05BNEpnNmgyeVo5K1RoTFM1THJMNUNYRUlYUUE5dENIRlVl?=
 =?utf-8?B?Tkh5VUNNWnJNbFlWNGFrU3BhREZ6TjNMT3NzYmVaSS9DMURoMHRLdlk4elpF?=
 =?utf-8?B?YklDTzlrU21ZZ1lxdlRLSzE2VlhIUlZGOXUzYlFUbUVHalVyOGEwMllXS3VJ?=
 =?utf-8?B?S1NRcFdEamNqTitQSjJCQUNWTFdIRXcwZlp5UzlyLzN6c3pzMzRnU0VMb0Qv?=
 =?utf-8?B?U3BIQ21RcldyZnNTOUJMcEpNaEEvL1p5VTNSL2dzN3E2WS9sSkI4U2loMFRC?=
 =?utf-8?B?TGtoYm9XalpTWExQR2o4TlpBT0hyYjhsUXlqeWhudGtRZE0rbXlGMWdhWXdq?=
 =?utf-8?B?Mmp6QXppMFlUZzFqZU51eWVObmtPcmFMN0k0dmNSSGpMMzA0QTUrVFB6dzlk?=
 =?utf-8?B?NEVSOXJ1dzlYVndWeGlGMk5VNy8xRjhOY2FVRFZVZUluT0RrcXRwUjlhN0pQ?=
 =?utf-8?B?MjFONElWWUEzUXJWdGlENVd2VHhNaEFjalBtU1UwdW9ZQkdkY2lUWHhHRXN2?=
 =?utf-8?B?N0J4OHR3VE44dDhiZWdqbEdEMTRlSmtpcU5XMjI1TE5qOUV5MHRwWHVFNUlw?=
 =?utf-8?B?NllraVM1Mm9yRVcwWGhxMk1HZVFtdnp1V3JjbHphOUFGZmJHS1ROSFczQmkz?=
 =?utf-8?B?MkNhNlF1TWs5YUJaNVNzOVFRTW5JUVJGWmNPcFN2T0Yyd05MWG9peUlMVGVq?=
 =?utf-8?B?Y1UrLzhGWkRUMkxlOVBYMVprR01DVW51TXUxSXpTOHRjTkhYU1A5V2hUOGpV?=
 =?utf-8?B?U2pQdmtMQUkvNHo4Um5YUXJUQkJjZTVmN05pVGg0dzRLbW4yRjFGRE9YaVRh?=
 =?utf-8?B?elVpM1ZSQWMvdDZPMm1aQ1NxUlRnc05tNks2bVhpK3JvTVZONlVreWZCOEJO?=
 =?utf-8?B?SnExMGhHTGJnZmJ4OUxhT2lFR0JHNXgybGxPTmNEUjlxaW53RFBUMzNNUVMr?=
 =?utf-8?B?WVdQOEZ5a2E2YkdQRkNMTUNJM3ljMFo0dm5KRERvWGtIYndraVo0WXZ3L0Q5?=
 =?utf-8?B?UmlyOGNhenIrUDVYRUhlSWF1b3hRbmd5dzFjOTVzY1ZseGJZQ0xYVWdpOGhR?=
 =?utf-8?B?cW5aL1hkczV3UUpIWUNVR1QvMm5lN2s1Vnl2bnNzbW9ab1c3REpRN080d2Y3?=
 =?utf-8?B?VTUzOFc0RzQ2c1piblFLekZCZ1NtWk9zeVV5ZEQ5aTZyRTdVc0dhS3VCMFA4?=
 =?utf-8?B?MUM0cjZSeHYwQ3JleUg3RHJEamh2VG53LzVmZlQ2LzQwVWU2ZHYrWXpKc29t?=
 =?utf-8?B?WCtOck9MZE5DSjdsSnVvdDhOU2ZLV1lMaVpCTHlaaGszeGltb3pmZnJYemZG?=
 =?utf-8?B?REdieEswK2pIMy8yeWtTcVlsdVhGemNXSUdmMmZhcDZzU0pWeENUL3pNZ2E3?=
 =?utf-8?B?L2Q2UTcwSnlwMWl2bVVBbUErSUhKMjN0UllCVXpVNHNMMlJUQ3FwR1psYlV1?=
 =?utf-8?B?YTh6S2JDV216dkxxU3VPTlZaVkgxd0tsL1JyYTNicUQzOTNnb1B1TDd4SFRy?=
 =?utf-8?B?eUxmK2RXMXBRWXhqSnluY2NnZDkzZHBPSW4rSk5qY2hvdDJTenR4bDZveEhG?=
 =?utf-8?B?VnltSkZWR1lTdnZwZlJMZjNlWkRyWFQ5WTlxR0o0L0FsblBySk1vb2x6TkVS?=
 =?utf-8?B?VCt3dFVvdDZ1S1Qvc0gxU09tWEtJY2M2ZDJBWHRJdTdLVEFzcmxlNjhrbFQ4?=
 =?utf-8?B?OW5MVUdOMU80MWNPL1pPQ0hsb2ozYVE5ODZqamNaeG01amFyQjBRMDRzTHZ1?=
 =?utf-8?B?VVZCbGJ3M250TDJtZHFicW5wV2M0TXI1azFINFJYMzRDaDhaM3B4bU52RXhO?=
 =?utf-8?B?TzBMT0FtVmR2bnlkZkxFK1dKK2hoQjNaNmpENDlyV3E0Tm5oQUEyVDdtdS9p?=
 =?utf-8?Q?qCjDofGd7sE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHZ4anRVR2VVRUNzM25oZGJhNk5kbDc5SXJrZmgrUFVXWitOY09rTU5pRUY5?=
 =?utf-8?B?VXAzOTgzQmkzdEl4Y3ROZ1ZUM1hHNngySklKNTZPRmJZVHI2UHBTbERLZWor?=
 =?utf-8?B?aTdZMUx6bkp6NVk5SEFhKzhRUE90VkJOMzdnR3pDUU5mL1h0TzZldXNoaXpN?=
 =?utf-8?B?K0ZlRzQzL2dabERvenBhSDk5QVNtVmtjTndSRTZHSUpJNFJTejRvMGZucWE0?=
 =?utf-8?B?WHFSM3lOOFZGZys4Y0NYUkZRUDl1cGIwQXZUOUMrNkJLOUoxUHFpeGJUMWhi?=
 =?utf-8?B?dmpxSzR0VkdNWXRmeXdCMEdTdnd1NFZOYWdsK3RsM2ZrOXlMVmllcU9wWEJq?=
 =?utf-8?B?aUlUMktOYkFRU2RqSGxWNDNIS1c1MEptVmdpdG85RE9ET2JNSy9TU3NvWEVS?=
 =?utf-8?B?emVOTlBPa2h1MGlQQk1FbS9MeURlT3RUbDV3cllYQzBGSlBiRkZFWGVtZm9o?=
 =?utf-8?B?ZG85M3M2Ry9JcVVEU0ZobzUwUzhnMHFYNUw3VlVodDBqOVJVOFJNVjRxeGZC?=
 =?utf-8?B?b0xrS3pESjh2cnVDbG4rN0dMNjFmeE5yeERJcHV5cWVIMEpDQXZpMzBrUlFF?=
 =?utf-8?B?b0xpdEdBdWxuOEMrcUtlUWpSRlZpZFpmclI5ZWU3d3E1OWhoMDhSakwxREhV?=
 =?utf-8?B?UHJ1ZmRiaG1PNHAxd3FxOFRZUGhyaTVHOFR4SGdVMGI0ZmR3dHJTREE2U2xh?=
 =?utf-8?B?Ylk4cTNtM2pPZ2ViOXNpUWtuV3cwSVBRak11ZmU5ZFl2Vm56RTdFcnV2RUJD?=
 =?utf-8?B?cmVyVkRnY1Y1NlBKZ2xOMGRuSE9RUEtoMkxCbEk3dXF1UWdiTkFZTkFQdmIw?=
 =?utf-8?B?TjBqZUtDS2VEdmNGQ0FrN2Y4M0kyS0VBWTNpcHNEVkNwZGFUSXZKUVNjbnI5?=
 =?utf-8?B?NEs3aUZEWHI0QmptQTZaUHRNNmZ3aUZnVURYYWx3Q2FKNUVxaEJaODFTc3pk?=
 =?utf-8?B?ZVFsaG5oRVVsSXFIdWRFNWw0b3Z2bm9KYnR4VFlRcTZicm1ZUWVtNENsK29n?=
 =?utf-8?B?bXAxakFwWTFFcHRscm9JT2tkTVU3cG9TYnhYbFBJWTlSSmdVV1BmU0JsWE9R?=
 =?utf-8?B?dDBzZWp6Y0EvcW5zNWdoRXcxa3RiSGlqekNKdWcyUVhtUHdDekMxYkFaTjMx?=
 =?utf-8?B?ajBsaWN0R3RtcUx4RkZMd2svQkVXNWJJN1JTeG5yM1JSb2N1Z2tjcUF6My9N?=
 =?utf-8?B?Kzdha3pQVkRvUGZvNEM1RUZsakQvTHJScUhUcm1ONTF4SEFRL0VHVm1SV2tq?=
 =?utf-8?B?Nm4yZ2hwdmRROTZXdlluNWJISGFFSzBkRzI5TUxBMVhJUklJVlZkSmMwQ3p5?=
 =?utf-8?B?blFWZSsxdkc3VkVBaXFCUm5wYUdhRThCNG5ZK0FzeUw3WWZWTTE2Snc5eGVv?=
 =?utf-8?B?ell4c0JZSXlLNlljTEZxT1VlWmh4SGluYW9BSVp5djUvWjRKelpsak1USjdH?=
 =?utf-8?B?OWRaYnh5Zks4bkV5NVBlNjdEbU9CbDZ5SXJocEtLRlNVTkdkdG90Zy9oanlV?=
 =?utf-8?B?VXRZMzYvSyt2dmdLb0pnaVZ4OHhmTndpUmdadER3ekFkUGRJa1R3dFJFSEp6?=
 =?utf-8?B?VkE3NzhiM0FQU3lycStxMmR6U3VyWSsxOEZVemxTTW1vcUtYbnNLT08yZVZT?=
 =?utf-8?B?b2xzYWVTbnlBMGR2RktvQk9NUTh6V3Y3TWJuYlc0OVc3NmlkZWF1Y2poblRm?=
 =?utf-8?B?cENHakZQQVpqRVhJeGVYSCtvcGxnTyt5MkZUVlZBeEt6KzJpc01SaS80Zjlv?=
 =?utf-8?B?bi9TWnhvN1pHUytqdkFaV0VSc1RjMnRVK29qaGZ2YWZiZkNmeG1Td3YrRWU0?=
 =?utf-8?B?dEsvNTc3bC9yT2t4UkZRd21yTTdKbHBURDAzKy9MZzhRR1hURFBtZHRzcnBk?=
 =?utf-8?B?VzNub1FCeHZjWFBTbjNwb3R6RnA5N3BpanQ1VzZKSjFlNFVVcmpVRnk4RVdp?=
 =?utf-8?B?Tjc1YWVmckRPeGdJTWtpYTRtVk1nQ2Nyak4zN3dKeE1DNTB1S2gyZnZTUXdy?=
 =?utf-8?B?SGN0SDNUMU1GTjlxRmtIRDRCQlZ4dW8zUTgwMFJlRXA2VTNyOFM0RThEamxh?=
 =?utf-8?B?NEhlc0RhM2FZelFSa1h1T1c5NWFzUUpUVGRrTm5vOEw1bGJVNXZrb0lrb0c3?=
 =?utf-8?B?VE5MV3pxaHM2QjhKZllodS9iNHRqV0VvOFpUODlRRm9WU043Q3BRS21BT2JO?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8700571c-c7f3-46de-4a70-08dde6e5a58a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 10:20:15.8389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfgFFU2rs9shrRjY8Y8BfMCc5U8PyU9tjkzTkX/xrcQ2NkzNTanqyqaJVlgDUFhrBXmkICSSDk4TYKyEQ8zwAU3I3o076CqZpBS8jSQCZro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
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



On 8/29/2025 2:00 AM, Dong, Zhanjun wrote:
> 
> 
> On 2025-08-28 5:49 p.m., Michal Wajdeczko wrote:
>>
>>
>> On 8/28/2025 8:59 PM, Summers, Stuart wrote:
>>> On Wed, 2025-08-27 at 17:52 -0400, Zhanjun Dong wrote:
>>>> Update GuC log buffer type value, make buffer types equal to
>>>> guc_log_buffer_type in intel_guc_fwif.h.
>>>
>>> This is just to maintain consistency with i915? Can you add in the
>>> commit message that intel_guc_fwif.h is in the i915 driver?
>>
>> hmm, but looks like a FW definition (it's part of the ABI headers)
>> so IMO better reasoning should be:
>>
>> "to align with the GuC ABI specification"
>>
>>>
>>>>
>>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>>>>   drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>> b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>> index 554630b7ccd9..b1819679fa35 100644
>>>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>>> @@ -10,8 +10,8 @@
>>>>     /* GuC logging buffer types */
>>>>   enum guc_log_buffer_type {
>>>> -       GUC_LOG_BUFFER_CRASH_DUMP,
>>>>          GUC_LOG_BUFFER_DEBUG,
>>>> +       GUC_LOG_BUFFER_CRASH_DUMP,
>>>>          GUC_LOG_BUFFER_CAPTURE,
>>>
>>> Can you move GUC_LOG_BUFFER_TYPE_MAX in here as the last enum also to
>>> align with i915?
>>
>> GuC spec does not specify MAX
>>
>> it's our implementation helper (so shouldn't be part of ABI)
>>
>>>
>>>>   };
>>>>   diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>>>> b/drivers/gpu/drm/xe/xe_guc_log.c
>>>> index c01ccb35dc75..470c83ead543 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>>> @@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct
>>>> xe_guc_log *log, enum guc_log_buffer_typ
>>>>          enum guc_log_buffer_type i;
>>>>          u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>>>   -       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i <
>>>> GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>>> +       for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>>
>>> I see that i915 is going from i = GUC_LOG_BUFFER_DEBUG and not from 0.
>>> Should we do that here too?
>>
>> actually if "i" was defined as "enum" then we shouldn't use 0
>> nor TYPE_MAX (since it is also not part of the enum)
> Sure, will avoid to use 0, to be changed to GUC_LOG_BUFFER_DEBUG>
>> maybe the implementation should look like:
>>
>>     offset = SZ_4K; // don't use PAGE_SIZE!
>>
>>     switch (type) {
>>     case GUC_LOG_BUFFER_CAPTURE:
>>         offset += xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_CRASH_DUMP);
>>         fallthrough;
>>     case GUC_LOG_BUFFER_CRASH_DUMP:
>>         offset += xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_DEBUG);
>>         fallthrough;
>>     case GUC_LOG_BUFFER_DEBUG:
>>         break;
>>     }
> 
> In spec, layout split into 4 sections:
> First is 4K buffer state structure

hmm, I would avoid calling it "first" as then it should
have its own enumerator (likely 0), maybe just say "fixed
header" or something

btw, as you just said, it's 4K, so stop using PAGE_SIZE
to define its size
 > 2nd, General log event
> 3rd, GuC crash dump
> 4th, Error state capture
> To get the offset for the type, it need to add up offset with previous section, the loop is needed.

the code above does exactly just that but without using the loop
note the "fallthrough" between the cases
> 
> Regards,
> Zhanjun Dong
> 
>>
>>>
>>> Thanks,
>>> Stuart
>>>
>>>>                  if (i == type)
>>>>                          break;
>>>>                  offset += xe_guc_get_log_buffer_size(log, i);
>>>
>>
> 

