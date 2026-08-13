Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9328BC5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 12:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FF410E032;
	Thu, 13 Aug 2026 12:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AAi/BTWl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A77A10E032
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786624525; x=1818160525;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ooFKOMGe+gcJEt3qUooYgoVojaoh8g2vkLGltIEYDKU=;
 b=AAi/BTWlaZPip2n66itNEBezY6+v0T+VieNVjZCTvLPjEqhIofnvb/17
 22mjndnKwiesPi7wTrYq8yWrEWupF/eiiwJw3Yvc/kwmQxl74tfzi6Acb
 mx8S81lRFy9Sl2Lj88K2oXRU1C9rtq4nk8VkRSUHbVx/cxVWTP9EUP0Us
 zANY3YFTTmPwUWKup7H5ligjvwbzVajTWm0MiaLsBEGXt7x1viAPYrZdd
 d3sml658psPVZmhJZ/BhZTeidcpvychlsYXW97GPFphyqacFM5EZ0bhpl
 hRFrIT8SWbXTLMQpCrTHR1llswU8R26R1gh+I1VRmo4lrMWiSpy4ncprc w==;
X-CSE-ConnectionGUID: jZemxzQrS76IB5+P0UVO/A==
X-CSE-MsgGUID: fDCj8Vz2Ri+5KbU9N2R5Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98711545"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="98711545"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:35:22 -0700
X-CSE-ConnectionGUID: umhjlIFWS3mqnPnhqJE3yA==
X-CSE-MsgGUID: 3hGYTgcpQZOUOiM01wxoNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="269121640"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:35:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:35:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 05:35:21 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:35:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RWpCKlfuc5ZfjO6n1ytaed9pngl0huDJdqwucMzQ2eG2RHfoJunEnctUz4eUswVCVnwrVTXrQgKN86E0TXnt+QtFEDrBbfSSoe8mdCpNB367rFFy6OuwD58cyEnfLFhUsgXDf/wpwBfcJMs+T6pilWwbTUEz2i7/EYmqWSLkP0ZPlXygk1dbQV/naH0D65dkIcEdJZRV+6EjgiYAWKSed7fvKFwZut6xAvrvMqjVO+LUHL3jnfoUeffIzR4SE41PoJ8Boa+ZOtxamYBfx358v8NzN2O7GCS6HcW3nzyXyqTsnL0MF0pYksgDq50ejAhxfQh4pGWjGAPZEEiIVRyj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+dftua1dexwuMhD3WH7Fvb8/VqDupC8tlnhT/hLQdA=;
 b=pCl4dzcBeR+iI8oukKB7oZWKoiTHnO2phw6cJQJ872ZJ1IXOm9rNEF4vF1F6i8ZK8Q5rGNYfrzmFvbRpxvA//gyH9B/vB+CZSXj0KtZWh0RDxe0ZNyZ09eM6CrV8rg83J2fBzHqB3p7oYjzxEJuG8aF1ANBXSOWjTtraps48gzo7bb09GEA0e9yz+YUQXWJT5GCpRz4YdBybaSYDqJNeczt5o2MIyEZvdU4g34tcuY9j7fIqjGw2SEVhL3yKNuGRDReR5/mLZmSJmL+qlubeVqIcKubJSxp8qX8QuXuaME3yxfX7AvnqIQ0YZ/A/K15l3EsxLDN6CVjBfa4P1XAL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 12:35:17 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Thu, 13 Aug 2026
 12:35:17 +0000
Message-ID: <45b54476-3d59-41b2-923b-690b28c454ef@intel.com>
Date: Thu, 13 Aug 2026 14:35:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 25/32] drm/xe/pcode: Report 'Mailbox failed' error
 using SIGID
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Kalvala, Haridhar"
 <haridhar.kalvala@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-26-michal.wajdeczko@intel.com>
 <DM4PR11MB542403C5B4FA880463ECB09CE2DB2@DM4PR11MB5424.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <DM4PR11MB542403C5B4FA880463ECB09CE2DB2@DM4PR11MB5424.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0067.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d806d9d-6592-4931-fdd5-08def9375487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: HbSJMcPmdTrtI3/53edKIPV19zJQi0QS5sEtyjpdqBdww9F03MU5xlx/PMy/cCbpe5WsUl6mseSm9dj2hGdzt8i15S5WJM3g1dTiu0mTi5kZWt8avyzlv96m+Wezp5wxPbYBU2POYSDDH+PUfj92946ieAo2AArHCExRb1/Zd08zo2zPUkXGin0oy7BQRm6/6cndL5snqtXGkyxlm9CpHpOUmIu617EdJyx/RnNB7DedriY9DRq44W9HOqHuFUtSprgFOV2CQdCQOa3lhqyYDvUOF3Z7XavjklrC/LnvCb9FjPeOItkvbyhI3tBdUAJ+jbENSSHxbVQyMleE6dg2sgSvR65lzxndiTx39bzJZQVvjosXf8vbnET0ArsdrCTYFMJkYqLcIkNPH55CksIPg/vC4EoAICN1Z5DzbmixQL9SugRLl1v1DIvnoKnCaLkHNeJUDmgt8SAJrZo7w+C6/nWfwhC7uu7DHY1i+ItBhMT+uWlXaWkVZYArAycXNV73QjyoocHrnQvCrK0ApSudIGShkyJi/XY+K+Niw6v7OfTI64HDDwQIzutp7j/uQ2AwxBj/gcTqTnFeUaCtY81PAjlKYsJ4R7SM494fLRDCbxw1ry01Y+4O3HSBC0kRtjMF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkdHQm8rRktUbXFDbHZmV0ZicWkwaUNISlJOSUhta2k3UGM4a3VDZTZQWjZx?=
 =?utf-8?B?QXc0WjN4MDZvbUlXM1EwOEtURzZLalBQMmN4RDNTZ0RPR2tIQVlvQjlKL05q?=
 =?utf-8?B?MEJORU5mc0l3eVA0ZmtRK3ZXTVpCNUpVem9YQm1UaHNVbTlMNFVwSWtSSGpq?=
 =?utf-8?B?T0k1WnZkRExYM0tXaXdwU1JqdGFmUGdObFFpdkJlRU5FekNZR1JOSVFRVXh3?=
 =?utf-8?B?d3AxVGh5R1FlRjNYMzNaaS9WZTFoZTBnK0U2WDRpWUZyTXY2bGRRQnFhS3Zq?=
 =?utf-8?B?dlpONmd4bFBQR0hxd0k2WTk5R2hYVjNHc2VObTRhYzhLeXkyc1N0c3lqRFJG?=
 =?utf-8?B?R0dsaFZySEsxeVZ5c0ZPNkpwS21FenVsVncyR253WWRIbzIrdHI3VHFWNFVs?=
 =?utf-8?B?VUsrZy9ZQ2V4UW1RNDNWaFJYR0JCT2EyajF5NjJvakQ0Q0FlOHJleC9tcjF0?=
 =?utf-8?B?WGRIdkdNbWNQbDFoTHI3VjJDNWhOYVlkVzgrdlM3cjNDS21hclNuKzhYRUsv?=
 =?utf-8?B?YXoyOGJqZWhNeTkzeEhFUnVhUkF3cnl6WmRBQjY3cXg0aDFKZW5pSlZFOXhJ?=
 =?utf-8?B?bVdhSXlrSlVMS3NHL1dTb2dSbG1RT0hMODZMQTNSMDBaSmQxQUcvR0R6YVN1?=
 =?utf-8?B?bUVVbHhPb052MUlWR1JSbGQzV0hYb0Q0NkVnbTliWmN1NDJvWWIrWTYvYm9N?=
 =?utf-8?B?SGUrMzluYWI0Rm8rQ3VOZWRKSm1ST1FjL010T0FJTTlDTXI2OFljYTYxWWZi?=
 =?utf-8?B?VjJUSlM4Uk80WHBieXBHNitZQm5JSzJuMlc1QU9XTElIUDBwVGkrQ2lDVGNu?=
 =?utf-8?B?L1BMQlU5MVowSzgxbjZNVmVocXBTTVBjdFJoVThWQ3QxYjhPdFVsc3pGN3Ez?=
 =?utf-8?B?NWprOERFOEJvRjczVnQ2cVQ1RXduakc0THVCdlE4OG1XeGIxdVQ3eHRaUW9v?=
 =?utf-8?B?TjF0T1NzNzg5TUN2WlJXczZnOXBUeDBoS0E3SjlyWlVLTU5sazJFK0lVdXor?=
 =?utf-8?B?RjJBVytPRFR2aEphSmhudUdCMGZCWWpOai9UOHJ5K0ZxV3g2TDhCbTVmenJt?=
 =?utf-8?B?bzZTa3dyNHJQWkV0alQ2RFRtdnc4WkQ4dElMOTVQdTF2WlFSU2pDMmlTVGg5?=
 =?utf-8?B?NnhLemJ3SzdaaXdKN3JjUy94TXNJSHFqNUJrQVlXendlMDVTaXN5QlVqMlVH?=
 =?utf-8?B?Q2ZCWm1CQ09zNGFLTThYUndzRUQ4RTNqNkhVUGtCRStLSEJxZGhyb0pUbnFG?=
 =?utf-8?B?enduOU5xYVg4bHV3MGlmdjhSZnNWOWhhaVNhYlFuQS85T1dKMkRwTmVYVm1y?=
 =?utf-8?B?YjljNTVRQjF1QXdXWG5KVlpTN3RBc1BRV1pjak81VTdWaGt0S21EZlJzeWRC?=
 =?utf-8?B?aEVyZzZnNWdjd1Z3dC91REFRNVJvb2VnREhtMEJhUDhMMlhDbTlRSTdvTXF2?=
 =?utf-8?B?ZGJCZWlkd3U1SzJnQlVoTUNRSENSbHJEK2ozbDR0RllSOTkzWE96WU9kVjAx?=
 =?utf-8?B?bzZjbVVuL3B6dzF6VFpseFBUTUx2cko5ZjlyLzgydEcyQUhUZDRIUndia09G?=
 =?utf-8?B?WCtMZityMnlvTGkyV1JNQmRtalM4UUxXWVJuaXBWMWRrTjM3THlWZWxKbHh4?=
 =?utf-8?B?MnZ6eENJVXRtMTFhbGJoc1ZyRElQYzlCeDM0ZDAyZDNvQ2FFdU5lNy84SWl0?=
 =?utf-8?B?L3RBN0VON2FGUmVxY3RiVFZSbDd6QlBIQ0tLNCtpemlmejhha2Z1dElGK1Nj?=
 =?utf-8?B?NWJnY2d1cU9kdHdxRjduZExpVXFhcHZqTzJaVTFaUGdnZUh4ZTFLb1J0U2Zs?=
 =?utf-8?B?OTkvcU5oNHZSeFR3WUFqUXI4Q3I2SDVRb3ZmMkR5VHRGMkQrV2JWRDhRL3Ft?=
 =?utf-8?B?d1hqekxoRDZLZHpUUk96M2F0TUFFM2xISFhMN0dDdThxZkJSQkdhQ2VSL3hW?=
 =?utf-8?B?amJFS3BIQU5lU0lqaXAwU3pVa2hCa2VUdktIOU85RmdiWHJPMHB4MVo2Skg3?=
 =?utf-8?B?RU9Sa0ZCcTVvMnJoRTlUVVNCNVY1RStaV3pzM0x2Rk1IM1BSLy9vOS9yc2hD?=
 =?utf-8?B?UWZTcHNUblRaUDBjYjNaczhlYmN0OGcvd004c2hWZEhCa2xzWlVNU2UwVzQw?=
 =?utf-8?B?cUJ5NUxOZGpvbGpaRklvZkJnaERHazF3eFA3SVhXZm1uRGVzMGpRUXhCdmRO?=
 =?utf-8?B?MDlkMFRxUnJoalFxc1I5eVl0dGJlQ2Q3SnVQOU1EeDNGeDlqWUc2ejkvWlY0?=
 =?utf-8?B?UkpvUDc4L1ZUSzJUaDhIM3gyR09SVmVHL0pyUXZscXlhZkpUUTJBbS9zRjY3?=
 =?utf-8?B?MUtFR3ZRTDFpSTJXQ096ZndyaC9TZjdJdkRUQlFUajF1OVQyamxYdGJDbzYv?=
 =?utf-8?Q?2g8KaC/PwY6HHJi8=3D?=
X-Exchange-RoutingPolicyChecked: tJpYMjMPgz9RxWVHp+WMC5Wr+zX1TW26VGUe8QfgbOP/lfMtj8vISCOpAmaDWz4mkCy76bj6Y65YnNo/lz62WvaRaxpz2ViR2TSHPUVGxmwrOi+BiNucY9HaYtMtbf/qBS4CTBcpG2v6Zt6CKqxgwpDDlVlxoi3uYmhsktSg/RQM+k9W6xVe4vKm87tbsYUdyijYTkXw8Hk9J6GPsZ+dRM46BqzjnqyqH9OWXQ442gQ+diRErREsXt6/h9REuD/s1M6bMzq3ZH9NqHcfqq10Ct6L+6cFxi3YeSUu44FpoHpzsHrrp1gWddpX3WcWIbPu+LRRIEWH4JpTioxZJurE3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d806d9d-6592-4931-fdd5-08def9375487
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 12:35:17.2708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mK1muy8PZD+rHeYDILevkfmLL7IgYi1rjGPmB55tJ4gdaj5sUFb1WGbGS5TniBw2PYHMyXlJIrjz8xIPhYtSMkkg3M1wgPkAk4J70k8ddOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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



On 8/13/2026 2:10 PM, Bhadane, Dnyaneshwar wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal
>> Wajdeczko
>> Sent: Thursday, August 13, 2026 12:45 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Wajdeczko, Michal <michal.wajdeczko@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Iddamsetty,
>> Aravind <aravind.iddamsetty@intel.com>; Koujalagi, Mallesh
>> <mallesh.koujalagi@intel.com>
>> Subject: [PATCH v4 25/32] drm/xe/pcode: Report 'Mailbox failed' error using
>> SIGID
>>
>> Report 'Mailbox failed' error using xe_log_err() helper.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v2: say xe_log_err() in commit msg (Mallesh)
>> ---
>>  drivers/gpu/drm/xe/xe_pcode.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index ccc3bdeed6bb..014632e11338 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -14,6 +14,7 @@
>>  #include "regs/xe_pmt.h"
>>  #include "xe_assert.h"
>>  #include "xe_device.h"
>> +#include "xe_log.h"
>>  #include "xe_mmio.h"
>>  #include "xe_pcode_api.h"
>>  #include "xe_pm.h"
>> @@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>>  	}
>>
>>  	if (err) {
>> -		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>> -			err_decode, err_str);
>> -
>> +		xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n",
>> err_str);
>>  		return err_decode;
> Hey, 
> Could you please merge patch number #25, #26 and #27 into single patch ?
> Or is there any thought to kept as separate. ? 

the idea was to have proper discussion on each new SIGID usage
then we can merge each acked/r-b'ed patch separately if needed

and as the side-effect we indicate that we don't aim to have
single giant patch per each SIGID and after that topic is closed

as you know, earlier attempt like [1] to do everything in single
patch was far from ready to merge and it would be hard to finish
that in a finite time

[1] https://patchwork.freedesktop.org/patch/744652/?series=171725&rev=1

> 
> Regards, 
> Dnyaneshwar
>>  	}
>>
>> --
>> 2.47.1
> 

