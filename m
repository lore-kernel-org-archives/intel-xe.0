Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19EFCF8854
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 12:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A6010E02B;
	Thu, 20 Nov 2025 12:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIh4AjdA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE3A88D18
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763643283; x=1795179283;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2euMQ7osveYl1YYYHS1v0s5kaDDHDhvCPUbgwM8Dhdg=;
 b=OIh4AjdA3Yjy9VxrBt/hIcrda7lQ094af8wojJLYVwVJKLMNXm2X4OA1
 muPmXYMcC0iwy4pMKEfbnoOfRx0ITcHvuuVru0buo4UJS5JTa8fFpW/fV
 G++Tc3xpkImCrzMI9dOM53m0F6EoFYR5OWQBBjx0kMhe/gL+w+vChTSlL
 txUFIkbRn1mHRf6XD0jgrhy87l9MwEYTO5dA0bBF2VefcRUGXrXKjJQC2
 +N6hH75HxGeuoTz2b5KFeQB7zH+jyVQCUnxmQ+07Nn/HqfoK+/eBabLZw
 ClZwrzeYnPwWVJOBMrDU7fOISnP3S+oJRv6OlsMkxwmaaEErczhcxEEIu A==;
X-CSE-ConnectionGUID: 8yNamqGpS3ici01ujvNyvA==
X-CSE-MsgGUID: LnUSXXqCSE2XczzjUm0U+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="77069305"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="77069305"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 04:54:43 -0800
X-CSE-ConnectionGUID: lR1Vj4/rQ5m+9O8M+JP0MQ==
X-CSE-MsgGUID: y29IqbQhQyana1T3zw9CTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="222289271"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 04:54:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 04:54:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 04:54:41 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 04:54:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAvspc2sSVMDBT7m3qLUgPxLzaTVc3tTtXakCJKwoL51t50lvTp/BHMQ0x0V89+VmtfMW+g85YJhZ1ng5TE5BBRcBlgmm7Rp635NHMNuJyyjqLjqLF8xoBHy5EyHL2eyIL7Lzk6ta4WVkQZSpptvK7vB4MmlrcFUzibqoU6OyosiHaDUoqGPj6Jxbt45wPu5Gzhtpd9BcB1Hpl+CWM/HmNVNYOfKOVQJEd8HgZ5OUI+q1FFSaMpu6qHRKlhU1sw7uVV7mrCAH2AEvk4b0O9Cb+rsMChe5kb9ltiJgyX686aohEUJ0uqyYZY0I7UTplj/ovdCEGcHYPbPWvkcKaiEdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2euMQ7osveYl1YYYHS1v0s5kaDDHDhvCPUbgwM8Dhdg=;
 b=HgvbserQ3oAqQlfWB55uWGIT8fk4xvCUPTLk5osyZ9nIXLbHiHb+6SPFf8KH+2/v3oKCc9Xv+GQFF982QUMvtNiFiwXANUeikgqfMn1kOESmBi3g1AzWs8GQwia+lWoUYs+5s+CmXTxBsBmaj9+efTVBHD6/H62nsNkx34a9GCflhtt1qdvBIJb1+xNm7F7QJbvCTdyEOpXVtXa4HWmO2AC0V9Hzc4K8KCqEJOTnTyemCbdjgcnbb6eVPSBesYOxDeOcBdQ5uXfbyW/oqEn9BSgtUoa+AmoLg49zJlo9b+biOyiOslXwHGndKUtvQ0DqbQe6meMwO8jNkERu0S8FQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by DS0PR11MB9479.namprd11.prod.outlook.com
 (2603:10b6:8:296::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 12:54:32 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::6aaa:cb72:c6c6:5720]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::6aaa:cb72:c6c6:5720%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 12:54:32 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH CI] drm/i915/cx0: Fix port to PLL ID mapping on BMG
Thread-Topic: [PATCH CI] drm/i915/cx0: Fix port to PLL ID mapping on BMG
Thread-Index: AQHcWfGOQjg/oZX9PEGfZlPRi5M03rT7hZ+Q
Date: Thu, 20 Nov 2025 12:54:32 +0000
Message-ID: <DS4PPF69154114FCEB06981486EDB2475B6EFD4A@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20251120073845.1270159-1-imre.deak@intel.com>
In-Reply-To: <20251120073845.1270159-1-imre.deak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|DS0PR11MB9479:EE_
x-ms-office365-filtering-correlation-id: f828dd8b-24e1-4057-67db-08de2833f34a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?NGlCWkdBcmowcHE4b1E3cEJBbGorTlZZd1JmTGd6YURlQU8rOXU1Nk1hemlh?=
 =?utf-8?B?bGJzZ3F4SHlUTFFEaURyQ0tNUkdpTENHREpwS3dZaXNobVJZeVlVVDh1YUFr?=
 =?utf-8?B?VXpFcXhJRFBOd0UzeGhLSXlyRTBQaE0vN3FYV085SEkrWURVWEYwSTBORlNy?=
 =?utf-8?B?TTdaMjVYVWRxY2RpSzNZTndMZjNvUGRzbW1EMXREemt5Z1RZclRhRVhpZFZk?=
 =?utf-8?B?OXNGc1Y2NFdFcFdZdDZuUTdoRkZHbG95VVQvdmkvZHpmVkZCelN4MGpmMFpR?=
 =?utf-8?B?RFc0T0M1MTR6dlM1R2M0ampqVlR0MUZBUXRpUWMyTkJaSW9qRXNyTkpxNlBs?=
 =?utf-8?B?Vm5iVng2R3NJczFVVjBSSWlQQWlIdHZqSXJsNGQ4WHFySUpPc014bFNPTWZa?=
 =?utf-8?B?eXZGNEYvb2JjTFVtWVNkU0cyYjQrelZjdTV2VUJZN2QxZXFaSlJuRU1oK2xI?=
 =?utf-8?B?UW9xb0VYM2lDUWs4RHBLS1JZOFRnclhuTXVaNmlzYkNXV3BNMWxvWWNEcUFx?=
 =?utf-8?B?NnB2TjdDTHdaMUY5bUhrc0NLT3ZlekdaRWFnYlArZFFtZWZMZXArTndwL3Ny?=
 =?utf-8?B?d05iUG5aa1UzODdudEVhQWx6UDUxamtjMEs0K3NhMThscFNUQTJFVit2YnJC?=
 =?utf-8?B?SDd2TVdpUWVsTGViNmlidkxtTXVYT2V0UnpTb0t2cUdPcWVNeDhyUTgxN2FG?=
 =?utf-8?B?a3ptRk9ZRlA1S1hEdENXaU5INmpaMTFwYlhDMnJ1TE82TlQxL3Z6bnJEVFUx?=
 =?utf-8?B?dFd3OThhREUwWnVYMHJaWjZpRlJVRlhVMDZ4ay85YVU2dW40cjNxVk51Ny9l?=
 =?utf-8?B?aklENkEzWXRKRjN2aWpYZG83bUNXRWJiRUE3V2ZpK0VLRFdTRDBBNXhyWmRS?=
 =?utf-8?B?RGhkaFBrS1FuQ3JvbjdtOE0wTUVtVUZnNWt0aEhaanh1SCtQWUxQWWpQaHh1?=
 =?utf-8?B?a0oxYVZYRElYSmYvNHVsUUpGK09vTTkvQTNIZnA5T0xMRVRMUGhkRktXcFBI?=
 =?utf-8?B?bytHcUxra3I5djN4aERDNmZ1Y1doaVNaNU80UmN6b3RLeWc2N1ZidHV2VTMz?=
 =?utf-8?B?ZjJYMFMzTzFqM1BJbU85cSs2NHludWRUN1h0L3FValpsMWNVNHplZllBUmtT?=
 =?utf-8?B?MlB5THZBK3l5VXIxUnVqSEVKVVJIRm9DZ1hoa09rRlJhbk1NdG1LTnBZQndG?=
 =?utf-8?B?ZGNFcU1wM0o4d3BUT21wYnBSQW9oYWp0NlluOW5Yd2pBV0FuNGNNRmh5cWgx?=
 =?utf-8?B?SFg1ZUlaM09JK0EwK00zVmJRVlEzaFp0ZDQrT1l6aWptTHdZcDQrdGkwNHN3?=
 =?utf-8?B?cDBPRVRjMVRydkxyaFBlR21JM3BTTHovbVB6aVRmZnAvNG5jOS9WZ2hOZkcw?=
 =?utf-8?B?NWg1dGpTdnBXampNZzdzcFVYTklhUVpzNWplQmhTc0FqTGRIVTg5aThOSGNW?=
 =?utf-8?B?Q2tFY0dMMWpqTmg1R2xRbjhydjlaV3Fya0hQSld1YjZPZW9ndlZ0NHBDVEFz?=
 =?utf-8?B?YlhMNHdFN3pNTWdvckFKUUFHR214ZFVmNUMrWFQ0L2ljTXRvSCtjMVBOUEZF?=
 =?utf-8?B?cEswY2ttblpKdXJnQWY3d1JaM0JQTW5VMDZadXdBSzNzR1o1WnJiYUI4Sllx?=
 =?utf-8?B?M0tmaDJJc0FwemlHdGhLYW5KTTF0TWdwZGJwRllPdi93V3NsaTlDZFphazJ0?=
 =?utf-8?B?aGIvdVJyRCtXV0ltRDgyZEFibk5hNzdVNTlvQTBnWEdVa1g1ekpGSmRXNTRt?=
 =?utf-8?B?MTZaVERTa0NMSzhWNnU5YzQwdXg4S0xQQmZzaXByaFU3dTB5UGdzRThrTTlx?=
 =?utf-8?B?dTZLQ2pqOXFDT084VW44eXNSWmZ3U0ZIREVqSXBNWW1PY0FEYzMxK1A5a1Ax?=
 =?utf-8?B?REJRYkF4VzdrYzRZUVhzcFpBN3F6MHVlMENWbUNhRFFuY3JDVlpkSzBCS2g3?=
 =?utf-8?B?ZWlzdm9QMmE4OThFdmpoZmZoNmJGMTBSRlBQSGcrUDJIWXBISzVUaGFIWjVy?=
 =?utf-8?B?aFZFeXhnTUVsMjJBVnRvSGhyZEFuTlVMN0puVDlkYjliQkRZbzVJQVUxVUp0?=
 =?utf-8?Q?QBu6kZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXNFd2h3QkFtanc2eTJXU0lhMWRoU2JHSTIxeXRxejFDQXpNZ3lnWWpyTGNp?=
 =?utf-8?B?NjN2RGVpSVhRRUtFMExPSFVIcGZEOG5adS9pMUladmx5UGtYZ0haUG5wemM0?=
 =?utf-8?B?M0ZrN0dTbzZNaGcwS05zV2xLKzRPaG1UcktiN29LbzByblhlQ2JrNnh2dE00?=
 =?utf-8?B?cGpVNHpnUHlsakZWTlVvNW1jd25tZDZxSGpTd3ZybndpR1ZsK05DejRmZjUv?=
 =?utf-8?B?TjB0QXRzWWYvVDA1MTkxYVgrMjVpRk1SRDFWYS9sMWkxZUU1ZlI3dkZzdHI2?=
 =?utf-8?B?emZWYmpxWjZPdkhwWEZXd1pBdVF6OW8yS3BFS0hMTWF6Q1E1dUdTWUxGaDRs?=
 =?utf-8?B?N1lVbU9KRzFKTDNkdnNGWTdKVXNRSDFTTGRBT29zc3FHN1lELzJ6TVBJRE9z?=
 =?utf-8?B?R1NJS0tpMCtjeHZjSUFQSCtVNlNJbjV3bUkxTmRhM0M0MjRZRUhzRWk2VDZI?=
 =?utf-8?B?U28zaHhrUlA1dUNubXZYak1DV1gzUGd2Y0lRa1JMYnI2WHl2eENoa1hvUllV?=
 =?utf-8?B?UnlRRUZhMjZSTm5La3c4ZFpMK3B4ZzdYeFlPV2tEUFozUmJJVVcra3Z3eVdM?=
 =?utf-8?B?bTFXV3p2S2xHS1dON1l5QnBjK2dDOXZpOUFzRXA1QzB6U0svNGZLRHk1WnpN?=
 =?utf-8?B?SVRvUWF2dlBNcVdyM05xVi80em8xem4zZWV5cEV1MmIrcXVlL3hjMjJ2dUtp?=
 =?utf-8?B?WVZjNFo5elg4ak9MRDFPUmg3cUE1T09OT0hPQWNacmZ2enlpVk53dlU0WTVN?=
 =?utf-8?B?MjRyeEZ3QlQxNElMWHlHM05QZG5PTmt2OWN0RzVMRUp2V0ZodTRJOXo3NVZR?=
 =?utf-8?B?WXlCYXZHWTRDalBBSjFUV3V1Vmw3bm5Hb3ZERkVQZWpqeDlndlVJVEcwc2RB?=
 =?utf-8?B?YTRVZHluZFBjZStSNW1HZnUyTFUxamV2RldSeVJtcW4rdUtZTGQ2ZVUxMWx5?=
 =?utf-8?B?RGZqWkJjeXdCNWgwUktCT1dYVDhsT3Y0RWVtY2pYQVh3SXRHOEgxNGR2SUZG?=
 =?utf-8?B?eEJPeFYrWWJxY1hiaDZaYVRJSU1zTzhxTlhSejdpcERCMjVQREIwZ1dWVm5I?=
 =?utf-8?B?RzdQL3dlTnhWajcydU9lSGEzNlMvTGpVOWJhcEkrdmM4SU1lZ2VMcmo0bGpn?=
 =?utf-8?B?OXErMFBmRldpUUE0ZDRtSFVTdS9ONWtIdkVBV0hpbnFmZnhwZVVQRHVNQjJC?=
 =?utf-8?B?bFJ5WWlXT2JYU1FuQWt0bEtjTUlsRXBJSlVtZUNzNUlnMnFHQmxFV1orZVBN?=
 =?utf-8?B?eHlDdm52YUsxSVdFYVZuT29FOFJlU0lLQUtsYUduV0trV0xKWkR4aGRWVVQ2?=
 =?utf-8?B?V2o5TWtpK090SEVaOGNTMytxVVN5dm50SDVmMDVKUHJ2ZG9OS0I0TkdYNE44?=
 =?utf-8?B?aWtUWWEyRkxwaHFNMnY5SncwbVAwa2dnYmZTL2NZaFV4ZUhNZkRFL04rSXJJ?=
 =?utf-8?B?YzlLNDhuOTFHL3hKbXArZ1k5WFZlbTErd3ZOSEdRbDVkWmN4ZVBPZ2FrZFFD?=
 =?utf-8?B?b0dEU2NrWm12TTZKNzZxR21jNXd0YjRoeExJNlNRMURQTGxqUGJiSy9FU2cy?=
 =?utf-8?B?WktrWGR6SU5jRFNxQ2R5cGlHOGV5Mkd4RitXRjlYY2RiVTlMRWVJU005N2JJ?=
 =?utf-8?B?ZmhJKzBDWE1kY00xaytrQXB6STE1alZJQldmSEQyUFI3TGVXb1A2S2JyMDRr?=
 =?utf-8?B?U3d6VklOdDlNbzdQaURRSHp6aHo3NXVvWDk0QTREYzJGZGFJVmJ1dUh1NkNF?=
 =?utf-8?B?aUU5SnV1ZFozLzdXZlZkSmdmZmI0SWpVWWN4UU5FeXBSVm5abFNKd3hIZXcr?=
 =?utf-8?B?QWsrc0hQZUd1V0ZUMy9wMEx0ZjNTMmVaQUNLM2RPQjNLZVQ4Sk93QzV1WEhu?=
 =?utf-8?B?bVFLYjRyMVYwWDVIOGhOcVljSzduMjJzVkZMN3VmWjhwWnliZzF6VmZJTzNu?=
 =?utf-8?B?UGVJcy9kVlQzS2ZVcFVVMCttRElJMjkwVWp5U1dLTVNuRFhmR1B0c0xxekl2?=
 =?utf-8?B?ektUcGlVWVlvaWgyUEVIZi9YNVdnY3Q3ZTlXTEpqT05uMHViS1M0QW5oU1pJ?=
 =?utf-8?B?ZnJYSW4rSCtsNnJkelNKQTJzV1MzR1BDZGo5bFIzM29VcTRVVEFLQzA2VkNl?=
 =?utf-8?Q?+y6n/Xa9RRPCWwRJ6u7bJ2qHK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f828dd8b-24e1-4057-67db-08de2833f34a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 12:54:32.3024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Cvoet7QrtRUq0r/rO1bgJ1ZaQiYJWPDp4NONFihEvzdjhXwM0wRhdDfYD89Hpq9Y12YxXWhGP5KSHQ/FM+BCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9479
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBJbXJlIERlYWsNCj4g
U2VudDogVGh1cnNkYXksIDIwIE5vdmVtYmVyIDIwMjUgOS4zOQ0KPiBUbzogaW50ZWwteGVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCBDSV0gZHJtL2k5MTUvY3gwOiBG
aXggcG9ydCB0byBQTEwgSUQgbWFwcGluZyBvbiBCTUcNCj4gDQoNClJldmlld2VkLWJ5OiBNaWth
IEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEltcmUg
RGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RkaS5jICAgICAgfCA3ICsrKystLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBsbF9tZ3IuYyB8IDkgKysrKystLS0tDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYw0KPiBpbmRleCA5NmZjYWQ2ZGJiMmY0Li44
NDcxYmRhYjVjNjJmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2RkaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGRpLmMNCj4gQEAgLTQyOTQsOSArNDI5NCwxMCBAQCBzdGF0aWMgdm9pZCBtdGxfZGRpX2N4MF9n
ZXRfY29uZmlnKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLCAgfQ0KPiANCj4gIC8qDQo+
IC0gKiBHZXQgdGhlIGNvbmZpZ3VyYXRpb24gZm9yIGVpdGhlciBhIHBvcnQgdXNpbmcgYSBDMTAg
UEhZIFBMTCwgb3IgaW4gdGhlIGNhc2Ugb2YNCj4gLSAqIHRoZSBQVEwgcG9ydCBCIGVEUCBvbiBU
eXBlQyBQSFkgY2FzZSB0aGUgY29uZmlndXJhdGlvbiBvZiBhIHBvcnQgdXNpbmcgYSBDMjANCj4g
LSAqIFBIWSBQTEwuDQo+ICsgKiBHZXQgdGhlIGNvbmZpZ3VyYXRpb24gZm9yIGVpdGhlciBhIHBv
cnQgdXNpbmcgYSBDMTAgUEhZIFBMTCwgb3IgYQ0KPiArIHBvcnQgdXNpbmcgYQ0KPiArICogQzIw
IFBIWSBQTEwgaW4gdGhlIGNhc2VzIG9mOg0KPiArICogLSBCTUcgcG9ydCBBL0INCj4gKyAqIC0g
UFRMIHBvcnQgQiBlRFAgb3ZlciBUeXBlQyBQSFkNCj4gICAqLw0KPiAgc3RhdGljIHZvaWQgbXRs
X2RkaV9ub25fdGNfcGh5X2dldF9jb25maWcoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIs
DQo+ICAJCQkJCSAgICAgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpIGRpZmYg
LS1naXQNCj4gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwbGxfbWdyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwbGxfbWdyLmMNCj4gaW5kZXgg
NmQ3ZDUzOTQ3MTNkNi4uOGFlOGNjN2FkNzlkMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcGxsX21nci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBsbF9tZ3IuYw0KPiBAQCAtMjA2LDcgKzIwNiw3IEBAIGVu
dW0gaW50ZWxfZHBsbF9pZCBpY2xfdGNfcG9ydF90b19wbGxfaWQoZW51bSB0Y19wb3J0IHRjX3Bv
cnQpICBlbnVtIGludGVsX2RwbGxfaWQNCj4gbXRsX3BvcnRfdG9fcGxsX2lkKHN0cnVjdCBpbnRl
bF9kaXNwbGF5ICpkaXNwbGF5LCBlbnVtIHBvcnQgcG9ydCkgIHsNCj4gIAlpZiAocG9ydCA+PSBQ
T1JUX1RDMSkNCj4gLQkJcmV0dXJuIGljbF90Y19wb3J0X3RvX3BsbF9pZChpbnRlbF9wb3J0X3Rv
X3RjKGRpc3BsYXksIHBvcnQpKTsNCj4gKwkJcmV0dXJuIGljbF90Y19wb3J0X3RvX3BsbF9pZChw
b3J0IC0gUE9SVF9UQzEgKyBUQ19QT1JUXzEpOw0KPiANCj4gIAlzd2l0Y2ggKHBvcnQpIHsNCj4g
IAljYXNlIFBPUlRfQToNCj4gQEAgLTM1MDcsOSArMzUwNywxMCBAQCBzdGF0aWMgaW50IGljbF9n
ZXRfdGNfcGh5X2RwbGxzKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLCAgfQ0KPiAN
Cj4gIC8qDQo+IC0gKiBHZXQgdGhlIFBMTCBmb3IgZWl0aGVyIGEgcG9ydCB1c2luZyBhIEMxMCBQ
SFkgUExMLCBvciBpbiB0aGUNCj4gLSAqIFBUTCBwb3J0IEIgZURQIG92ZXIgVHlwZUMgUEhZIGNh
c2UsIHRoZSBQTEwgZm9yIGEgcG9ydCB1c2luZw0KPiAtICogYSBDMjAgUEhZIFBMTC4NCj4gKyAq
IEdldCB0aGUgUExMIGZvciBlaXRoZXIgYSBwb3J0IHVzaW5nIGEgQzEwIFBIWSBQTEwsIG9yIGZv
ciBhIHBvcnQNCj4gKyB1c2luZyBhDQo+ICsgKiBDMjAgUEhZIFBMTCBpbiB0aGUgY2FzZXMgb2Y6
DQo+ICsgKiAtIEJNRyBwb3J0IEEvQg0KPiArICogLSBQVEwgcG9ydCBCIGVEUCBvdmVyIFR5cGVD
IFBIWQ0KPiAgICovDQo+ICBzdGF0aWMgaW50IG10bF9nZXRfbm9uX3RjX3BoeV9kcGxsKHN0cnVj
dCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCQkJCSAgICAgIHN0cnVjdCBpbnRlbF9j
cnRjICpjcnRjLA0KPiAtLQ0KPiAyLjQ5LjENCg0K
