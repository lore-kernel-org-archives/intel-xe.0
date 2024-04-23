Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9878C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 17:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895F310E809;
	Tue, 23 Apr 2024 17:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrulnarP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C2510E809
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713894232; x=1745430232;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n9Fh6+jChFDnuopsb9O1td17uavvw1IgyN5mi42VGMM=;
 b=WrulnarPV5UU9FXzQqcrm6HrJuyWe5TKtLP2NRHTk4ac0xLZph56aImh
 6vdxjrzNRyJ7/qmDkbhdsAZp7tlEH4zIGjOgBIpgSIn6uTduitUvQewGK
 x8KoF9ze22ZIRq4AGn45431cN77BKKEqJfrSZ/5A6mqxK/aT3g7MEpKIn
 yk8DcGes6O4MkMW97cvbxkgO+8PILkNOTuxoHozJDpRTlqe9dS73N9SGu
 Mg//5J2FC7ppHvw/klcgxLfXsrobRzjWR/PRpbGgr1HCHYUs/XtqS+PQT
 6mDihQjXRINrjvb6lcMksdnOUee0yyXTRdK4p+GibPKEme30Mgxa20G+B w==;
X-CSE-ConnectionGUID: wZRHd9mBR0W0v+q9EXrafg==
X-CSE-MsgGUID: Sb0bCikGSvCj8qRjSSM4Jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20042827"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="20042827"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 10:43:52 -0700
X-CSE-ConnectionGUID: d1TRvSjlQTu6dUySYYoMJg==
X-CSE-MsgGUID: 5N3lui5bQ62vvbxR7gTBGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24957675"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 10:43:52 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 10:43:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 10:43:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 10:43:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Txe1NIpMNjfXGyuo7TAGrBFtpbg0m1n/R7KRFUXVSDGVuJ93yW9yC4eKu77z84oDmzobqSXdxwuoCyMvG6tjpR5+V8MBzVrgZQAbDw2iDCMU+1A6jBYZhUbKd69ctDNdIYSpeojEA3k7h0t+uffx9nBlAL2kR0lJxJxabbOeVmwXHysb223UlmgEpqY5M7mFD2CVEgdShNHKr3pNXw9m6TiAJpIPXZbXPHJSH8sBUX9c8lYbd2ZQC2RG4hI/dWug3516cw52PwxH0HM6aSESfS0/6+f+T77kee/GES4S4+S92Zy+dCE3um9Vtj0IJSCD2uGTY+t9MZAhsDZd0gUEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Si/yFHjh3ZBCRGUmrS6MeiBM9i9tOQnluniAQS1Yz9w=;
 b=Qdd2BJmXGlx5AU3FdNOhexqRwBe8vGATRCK0/DwkuVaZXyw+V8a7PnYRNLF8VgyjZY7hSDHkdoSzBxurXMDtXWKJ3m1TUfnEZONr2CBUqeakDfPJ+o7sPsUfDxcttnQoDn4aEo6g/TdKaU0aX1Uk0sl7Sttf6qFRvaNaPDWwQvXN3WtSPn6TeTjkE8ctXIyVUAIHei0F5eJ5hBxqYiPDTDSiFdTOZllhvHRx5QvKjZqQDowGRwd9yxwH0jJdTABGfQH9imwh/WobXjnfYzf5oSnzpH/13RIUmuqOItAG9AfNROIZnaSlZe6OxkXDYqjFLOkcRSFhd9jJfI2yCmfOug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6371.namprd11.prod.outlook.com (2603:10b6:208:3ad::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Tue, 23 Apr
 2024 17:43:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 17:43:48 +0000
Date: Tue, 23 Apr 2024 12:43:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <tjshefhgoeyfijf7k52fhag2xdfwsmysnn4sngh53ubittpljy@hhanuebvzide>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
 <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
 <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
X-ClientProxiedBy: SJ0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: 65e18bfb-12d6-4860-cdc8-08dc63bcee68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015|27256008;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0KGue4DRXsq/RqMcUZQ9uVd9WvjfD/UQRoFQGCwvJsA1XgZ3xDRSu/TA0v?=
 =?iso-8859-1?Q?5xtKR26FtS8ZAGmVtwIUSFw15ok8gpdHFPPwr5+aSIifr9qS5OLGDRLMvO?=
 =?iso-8859-1?Q?QaBp+EsvFyVjf8QSFH6SVCw1cutGeSMBJCF86liX6pzFy6OrekksKRhyEy?=
 =?iso-8859-1?Q?pm/gKzZ5cK/8agaIBbFHmHUqrUZElFxnzuarhZJMY3F3Y8WItw5TYWoSrK?=
 =?iso-8859-1?Q?un7uDb/a+0jC4kzFaKhpnBIFS0AHTqVOEo6GG5e6PqN9fSs3NffoSwa55o?=
 =?iso-8859-1?Q?fZzdtsuv0Li1CHViUUJIZuDTHrMpbL6s/kZyyRaigi0bvwl273OHK5jxjN?=
 =?iso-8859-1?Q?Gi1+KcF7IPvgl0o8JRTKc+UkO93dhBUGQbPDcHj6O0KzZAubWEymWukV3T?=
 =?iso-8859-1?Q?gfqz2B55fdbEfsFtaWopj0G40PNv/DV8BmJPv2fEsfd4Y0ycIQfuVV+ls1?=
 =?iso-8859-1?Q?FeRlfapfW4n5bCMWdio8YSoAsUUbXfJjqs8qwPIEA88gJpcKsocfjt8tl9?=
 =?iso-8859-1?Q?pcgA2SeskR1sAVfU7boU5OCpILuQAq8C1C6+EjiNHxmcdT6cdGGxeN7+u8?=
 =?iso-8859-1?Q?+BZzdbOrsSjdnc7SBiMc+3137MVtwZfM4KSWAo+lJ4+/gs+4av7qPeskGa?=
 =?iso-8859-1?Q?xpdT+qK63u1gEDiuodj8uTWUOu3TUpmVXLoZaKRpkg8E52W6yzkzgrZ0q5?=
 =?iso-8859-1?Q?bme4K/RTuxbxknsOWCJPvjxhg+AC7LMSrv5eG2iPmy7f6fsnpaK12Nk9Cr?=
 =?iso-8859-1?Q?SLU0gNJwVHVVYc/z8gvDkXQCtoXim5/fk8QLEqBte2P89cdEaZU0nh0AN+?=
 =?iso-8859-1?Q?FjoguqZ0fbdO5PTJKMuHgboYsgPvO+CjP8sCAUVfvqPSlRaJoqcOgxqFd1?=
 =?iso-8859-1?Q?UdgDs9JkJ/gJlxNBQk6ugo8yLw+woMs9DROXyf0wAKTTi428UgTNttSSLJ?=
 =?iso-8859-1?Q?HhHRKQcWDk7u75sUv8JCWrcDtdUTOcOkgeyQuyWEvy0MnEnIGTznXBq2Vs?=
 =?iso-8859-1?Q?d9QkrbyYMbdT2eGdLryVXetfvaEVJ7i0pLn+qBxeSoES8QG0VvPJcBgz2o?=
 =?iso-8859-1?Q?QeAKHAigh1kj9xA11gUraChwbge20wjQKWcOAwHDxWmEehq7h82pTnPeLz?=
 =?iso-8859-1?Q?j5ySRs1+JZ38sYM+Fhkn5ekpBzZ3Z+HvIJVV1rxpc7AkcUyHNVYghOXIvH?=
 =?iso-8859-1?Q?f+EN/Xx309SHSELDKHwi2VL6Slqid1t8t9URx9rMtVBkvdo8MkZmn25t3c?=
 =?iso-8859-1?Q?1s6rj2NLh5Ydc6ssyCaMfAjEDquzYGnSM+UhR4oESWZ5gQ4bNbGPMoyC+E?=
 =?iso-8859-1?Q?T12DdYlH/xIRx4MVsXeZLnEV2hHAy3mhLUMdoE8tkZUUB86UxIDTqDb/Vs?=
 =?iso-8859-1?Q?uSyct7khY6hVOTFLk66aVRXiY++52/jQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oC1ic8fDRZg0jUm5UjILBPC9sDpSvrzhGJbHq0JQifpzrGTTZZGoWmip2p?=
 =?iso-8859-1?Q?9Ri4YlEb2kqxVUkeLhkg/Iw8N80stLTB4KqJY5LT76gWN6Mb7kIu7GalU3?=
 =?iso-8859-1?Q?i++gxRAcT2Qc6quTET4l3NSGXrdiklHsRFVM8USIOvl5f+VA+zG9Cx2WKG?=
 =?iso-8859-1?Q?8wGqLAN3TiZVql+J2PO7dvI4yCXM6FibwLFzLyUfjf7r7sQLR4V4qWGc95?=
 =?iso-8859-1?Q?0udD45O85AKIB2nkZ0RgbRKx1oDRghMYvMFuogTrJMI0Udf24xz0hX55DP?=
 =?iso-8859-1?Q?voLexWJZbqOpc1uyJNDTW4cKdL2qdprHNgjDiA8zYr5DwQMjlAYG2sf3R8?=
 =?iso-8859-1?Q?L8dGldDKANdeen62lK4OPrqqi2+/uAeuOVV3V2c7NKzxCeXc2n0rZTI+LY?=
 =?iso-8859-1?Q?0WB8fnMz9EUyZp1WPrnIX4uajLwZcvu9YTP/JnBLeSwbAAXCXSjQXvSynM?=
 =?iso-8859-1?Q?ZyB2RjX3QZ045+wW83qYcRzt7Ew8v43XenF859O38jfTvJQ4q+Pxi5NKMH?=
 =?iso-8859-1?Q?TqiuLcMZjQ6j6e6u3saTegiMVnlAMxgUHY5B9A2btyMqmBGUl0th7yhJc7?=
 =?iso-8859-1?Q?PV0AkjPf3MD8pJICM8PSoQEBXBrYckioCVre0PzflaOADDZYL43g3qWJSO?=
 =?iso-8859-1?Q?HXrkQUQbZLWXf6kpNdhHQC64rTnfzd2Y1Q9CnLTzII9Oc0CIvOQwgZPjNM?=
 =?iso-8859-1?Q?7kdRI6kR039S76OLljlJyk92ScPdrGcnpDKBYWSzjOM525S1WFeD2oDIG6?=
 =?iso-8859-1?Q?CNVk0SaTxyuzwlTaeITDZMVW9ahFXfNAtagKoEP9bHA0CwYkrbGAgioCth?=
 =?iso-8859-1?Q?VmdwP/GGg/+Qr+PNVctBzbyPGdz69FD1GnlQppC/zy3CZcPU0Zii2FgFud?=
 =?iso-8859-1?Q?edXBKr8nALEpQcdzIjfVNq8hq3LcAmmLSh8n9WZ/2j2M9xKCZZDJrvZVNl?=
 =?iso-8859-1?Q?D1SKAkGprOMqxk4y3B/JIy7mMrxSPTb+C3npa7XWvEYTLF5i1mCT7mpuRl?=
 =?iso-8859-1?Q?oV/OOUu253Wqt87ZMN8y5CP9TAGV5osTHRa+UesO6LPh8hEoBjIm9p8SRc?=
 =?iso-8859-1?Q?/GdSLSYvLG6/l4LizPp2Ek+ZXAxQOF5Z1G1lfJg9I9txvgjRQxu7BVsDd8?=
 =?iso-8859-1?Q?gfPI1T3j881SZugcRI30awKcfKBptW7ecH9yi+y24/5QS9Lk4Y8D5XkoXl?=
 =?iso-8859-1?Q?liXY44C3AJIBwpkvSUYEcDAF5Ik5gyEe4HamQVxQDX7kjVC+r0EKSo7ofl?=
 =?iso-8859-1?Q?6ODGlxjeezOFbFaxj8VtvHH4b7L9YgNlEvvgxhwadY3HPgGoicmq7Y9Z95?=
 =?iso-8859-1?Q?EBOV63wpDTrdr4fqLyPlezbilMWj2Y7Dv4+6O0kMxUpJsPpG3p/bsLjIaV?=
 =?iso-8859-1?Q?vvRB8umpP/JIRr4I54Mo5vyOprNdVccOJVCKvQejZ8o/+u0ALEU5wQRlTi?=
 =?iso-8859-1?Q?ZSeiDSW7zmHIGTyRPfdeMsUD3ftgQyXlGu4qQvjTdiVkIkCHMPx1fPBEeu?=
 =?iso-8859-1?Q?xAg1933GPwwHELTXY6KsmLEnVWA1oWH85wgxH62BkhtVIrQtvVUPHdFaYW?=
 =?iso-8859-1?Q?BgWfqyrtPSd9mlNseUv1+y65kWk2ujckA8mkU5HzAtSbhqYLijIT1i1mUd?=
 =?iso-8859-1?Q?QOyKIZAYt563r3kho1791r+LRKVvrzHLA/ougur35SSUR5vueusmlG0Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e18bfb-12d6-4860-cdc8-08dc63bcee68
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:43:48.7222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bea7/f3CL7zAiZEsJ/cNvglogmIcFvoHB28W4t8PDbvagwTYQxrelhxMhMPInJOjBshSzmZFRRrrFLlDe8Otlhv5ANYhqW2f+hUJVd2iU2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6371
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

On Mon, Apr 22, 2024 at 11:10:43AM GMT, Belgaumkar, Vinay wrote:
>
>On 4/22/2024 11:09 AM, Lucas De Marchi wrote:
>>On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
>>>This WA requires us to limit media GT frequency requests to a certain
>>>cap value during driver load as well as after driver unload. Freq limits
>>>are restored after driver load completes, so perf will not be
>>>affected during normal operations.
>>>
>>>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_device.c |  6 +++++
>>>drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
>>>drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
>>>drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
>>>4 files changed, 55 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>>b/drivers/gpu/drm/xe/xe_device.c
>>>index d85a2ba0a057..e29c152a6c4e 100644
>>>--- a/drivers/gpu/drm/xe/xe_device.c
>>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>>@@ -30,6 +30,7 @@
>>>#include "xe_gsc_proxy.h"
>>>#include "xe_gt.h"
>>>#include "xe_gt_mcr.h"
>>>+#include "xe_guc_pc.h"
>>>#include "xe_hwmon.h"
>>>#include "xe_irq.h"
>>>#include "xe_memirq.h"
>>>@@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
>>>{
>>>    const unsigned int flr_timeout = 3 * MICRO; /* specs recommend 
>>>a 3s wait */
>>>    struct xe_gt *gt = xe_root_mmio_gt(xe);
>>>+    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>    int ret;
>>>
>>>    if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>>>@@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
>>>        return;
>>>    }
>>>
>>>+    /* Set requested freq to mert_freq_cap before FLR */
>>>+    if (xe_guc_pc_needs_wa_22019338487(pc))
>>>+        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), 
>>>pc->rpe_freq));
>>>+
>>>    drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>>>
>>>    /*
>>>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>>index 60202b903687..556e73fca813 100644
>>>--- a/drivers/gpu/drm/xe/xe_gsc.c
>>>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>>>@@ -19,6 +19,7 @@
>>>#include "xe_gt.h"
>>>#include "xe_gt_mcr.h"
>>>#include "xe_gt_printk.h"
>>>+#include "xe_guc_pc.h"
>>>#include "xe_huc.h"
>>>#include "xe_map.h"
>>>#include "xe_mmio.h"
>>>@@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
>>>    struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
>>>    struct xe_gt *gt = gsc_to_gt(gsc);
>>>    struct xe_device *xe = gt_to_xe(gt);
>>>+    struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>    u32 actions;
>>>    int ret;
>>>
>>>@@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
>>>    if (actions & GSC_ACTION_SW_PROXY)
>>>        xe_gsc_proxy_request_handler(gsc);
>>>
>>>+    /* Revert the min/max freq limits as we're done with 
>>>GSC/driver load */
>>>+    if (xe_guc_pc_needs_wa_22019338487(pc)) {
>>>+        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
>>>+        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
>>>+    }
>>>+
>>>out:
>>>    xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
>>>    xe_pm_runtime_put(xe);
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c 
>>>b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>index 521ae24f2314..7f82b6c2ad3c 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>@@ -40,6 +40,8 @@
>>>#define GT_FREQUENCY_MULTIPLIER    50
>>>#define GT_FREQUENCY_SCALER    3
>>>
>>>+#define LNL_MERT_FREQ_CAP    800
>>>+
>>>/**
>>> * DOC: GuC Power Conservation (PC)
>>> *
>>>@@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct 
>>>xe_guc_pc *pc, bool enable)
>>>    xe_mmio_write32(gt, RP_CONTROL, state);
>>>}
>>>
>>>-static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>>+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>>>{
>>>    struct xe_gt *gt = pc_to_gt(pc);
>>>    u32 rpnswreq;
>>>@@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct 
>>>xe_guc_pc *pc)
>>>        tgl_init_fused_rp_values(pc);
>>>}
>>>
>>>+bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
>>>+{
>>>+    struct xe_gt *gt = pc_to_gt(pc);
>>>+    struct xe_device *xe = gt_to_xe(gt);
>>>+
>>>+    if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
>>
>>that's what xe_wa_oob.rules is for. Why are you adding it as a separate
>>function that won't allow debugfs/.../workarounds to match reality?
>
>The workarounds are not initialized at this point, this is early in 
>the driver load process.

ugh... the _early() variant was supposed to be the sw part with
minimal hw. Now we added a few super_early(),
no_I_mean_earlier_than_super_early() variants... but with other names.

How do we call xe_force_wake_init_gt() and xe_pcode_init() passing the
gt without the gt even be initialized? Are we trying to create a house
of cards? This init order is in an awful state :(. We should stop
pretending we are getting the engine info from hwconfig and just fix the
ordering so we can call xe_gt_init_early() and it really happens before
things like loading guc.

Lucas De Marchi
