Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8D8E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 13:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5107E10E351;
	Tue,  7 Jan 2025 13:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DR7RMaeX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C031C10E351;
 Tue,  7 Jan 2025 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736257273; x=1767793273;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8aRnOV3ick2bFmPfJLrkzCrz5cgoKoB+ToW4tcfYREk=;
 b=DR7RMaeXVyyvV/V5Bl2/klOGxj4kyWEaFFIQcnesw2qxI7R4zZ4wxVxU
 gUQzpmJhiv/RuiSnZMmrgodnpo5gTsQ1LOZU4GeQmSVa2HNthq7rMrbRK
 TjQsCX0dc097b4NNFA+nvQtAHjG/IsQCAxTnBqUnAz1lugXs4qAOMX8XK
 2/WBD0wDtiTcEuVKynn9teTgCgHvVYpSUG05upq60i8HJf6hNkk+iy0hU
 PwnjUhIakWAp3q6hfKl60HNcoQ0gYOdmYIwCd7Yj/d/BWugg4tNzjOv9S
 JPehiNJg9eFgCZ7ffdZwf6w2sNU1PGHI5UiSalE/G5oTHD0oyOZR0nDmI Q==;
X-CSE-ConnectionGUID: ykYOddmxR1S8BteHROmuLA==
X-CSE-MsgGUID: hXptLA0UTnK+z7t9AKoUhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="39264789"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="39264789"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 05:41:12 -0800
X-CSE-ConnectionGUID: hAAr31tnRzquuOJkvsoCNQ==
X-CSE-MsgGUID: jS9TFlj/T4y6EI+Uqjnr+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="102841687"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 05:41:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 05:41:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 05:41:11 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 05:41:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1+zcSh6hIhQCScK1v/lP54k6v7dZFuX2BhKVi8ie2e3cKcwgQKATyiWZj2DyXwqpJ1XKmxEgEWCGfy6A4a6dDiILFK2tQ29RBxGWU6IerETFJVZJ+UKWTv6VszSUWQhVzigcIN9dIm9j2Graef9dbB7VeCfQXq1C09jGNv7bE4zC2Vw1iFTV5iv670Utjql/dxsxl0uGI7xf4iTFM3fQKHZQjGh4AQ4LRl/ptl3Sm0Aw1e4MDr1V0FiaL+RZw4vVG+tiZVlUpaUREoNbf3Qrhg1gdWSMgFYjbhVhr+Gh2vJl0jScL1LVgXAMf0Kw8yrsJO3q79omLSEwfiqjXO6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aRnOV3ick2bFmPfJLrkzCrz5cgoKoB+ToW4tcfYREk=;
 b=u+gQXztKzc4G7vitCJWR6KoyYt+JztOL4EUcR+7HvAh+ln7+mTsTSsif2ePd62juQej8ANMFSohMmrRknoy6kOj7sCFa31sBzceATEy1FpQgm5MpkRqM9gdGCsNSSF5TQiltPCqxJAFdQEdvj7yXhQCVQsxgz9yV5eisEBe/NykSxYACd88w5i02aS4tWiAKu3txMdYpUsxYK9qDKUpzQpvNj5hR2ITf6lXg5yPIFBK+aPe9lW4sBbKInQettEUlls4FdmJH58RfRGer2UgzZIPK6Bn+d0oIEQFVhSqyiTObojCA/T6IeVrv1hy30DKYHuENKHmFsO/Kx3ploNip2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 13:40:22 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%3]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 13:40:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH V7 4/4] tests/xe/mmap: add tests for pci mem barrier
Thread-Topic: [PATCH V7 4/4] tests/xe/mmap: add tests for pci mem barrier
Thread-Index: AQHbYQkUpswdfNhHO0uNb8aadJ7N+bMLULEQ
Date: Tue, 7 Jan 2025 13:40:22 +0000
Message-ID: <SJ1PR11MB620488E2F12DEAE62DACAC1181112@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250106151441.2598949-1-tejas.upadhyay@intel.com>
 <20250106151441.2598949-5-tejas.upadhyay@intel.com>
 <610855ba-d86b-4a95-87c0-6c45616c3604@intel.com>
In-Reply-To: <610855ba-d86b-4a95-87c0-6c45616c3604@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MW5PR11MB5788:EE_
x-ms-office365-filtering-correlation-id: c825f58f-34e2-40cb-2822-08dd2f20d56d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UXNURVJlc0plUEFxV3ZPUTljcmNnL1k0UDZ0VTh0eXIyTHdJdlozUmhBTnFW?=
 =?utf-8?B?ZE9NeE16cnhFbkZxNW5qM3M1aHlqVEFHNVRybnJDVDl0SFZRcnRTT0lrK2Er?=
 =?utf-8?B?RXRzL3NDdWErUjBqYjZxak9BNk9ZbTVyTEV3VU9kQ0NZdlV3Ni85WTdRcXQw?=
 =?utf-8?B?VUlucGZmbUtYM08wOWlhS1pXK1YwUGF4L3ZGYldPUkhSUnR6c0ZGZjE3RWJu?=
 =?utf-8?B?R0ducGd6NjFXYi90QTlVOE5lbEpDN3J3OGVPV0xlQ01oemFxVzhHS0p6b2JD?=
 =?utf-8?B?Y0dPRE1ZWkFMOEVvYTBoRDNzOGZFWDF5RGRIV3dsQ3IzbmNoL0RLRkNhalAw?=
 =?utf-8?B?R0w5VWY3RmFxNjdEa003Zkc5YzBkdkVrR3Z5N1FnWEIwQUlxSmVEc2gwem9B?=
 =?utf-8?B?UUlyNGVISzdPd0sxTXNIOVpJQW1hTDBaS3lSTTRjKzlLOGdwYTNOMXgwWEdh?=
 =?utf-8?B?UmI2eHFvMWxhbDZoWDNSNUdGMFRocUtFblZieUo3S0huZ1IxdWp4SXFoQVNs?=
 =?utf-8?B?VWJyaTNkczlERTI4emtDZzdoZkRYTFVXRFRtZUVvclBMMlAvUlJvMG5PaGE2?=
 =?utf-8?B?NVV0NmZoZEVGbm1GS3N6TTFRNDkrTmZkUi9kL3JLWHZxdWNuc0ZzOHI5dWVC?=
 =?utf-8?B?Wm1jUndPSWlRc3MxNis3UTNSVDZPa3RTUmxCeFd4c2xqL2h5YVZuamNId3lZ?=
 =?utf-8?B?dnJ0NXkvUmR2K3BnNlVKTHd6RUsrT2pmZlBVd3RaRW5TMCs5S0NkNGlhV0ZT?=
 =?utf-8?B?enpPVmFNQXA5QlIrYmE1dHh0VEJUK09ETndra2xUbVNPVzVObDNjekFzcE45?=
 =?utf-8?B?NU9Fcm5MTEFBQUFtU1FqRmZ4RFEzZTBmM0NvTnZwOVlaQ1FSSzM1alkyU2xq?=
 =?utf-8?B?U1pOd2tURWhGNW83ZTdYNjIrY1Z4OVR3WEU0QWV6YjVWb0FhNjY4cWZINm80?=
 =?utf-8?B?QnJjcERxK2ExMmdPRjYzL0hLUWpuaWpnVEdRS3UyUUNkZmovRHBqZHZWRUh2?=
 =?utf-8?B?MG9QUjFMUGE1dWQ3NVE0a3RVcllJQm5hdEk5cHBiaHNjekhCRVNqeEhQM1lV?=
 =?utf-8?B?RFBORG4vTkxLN2FVMUtDRVZLcVNZOU03TE5pTnpyTHJzOVN1blJpTGVwM1RD?=
 =?utf-8?B?QVYyTWZKbE1WOUZXdDEzMkozcWk4UWhXLytDaHk1SWFLV1VuczVFdnpyajBT?=
 =?utf-8?B?TDJxV25oTkl0RVorN0VlQjlReGp2bkc2U2sydDQ4Q0s0cW9UYit5bm80WFJ6?=
 =?utf-8?B?c3QrZWNxdzFXSE1rY0pCaldyS1V1a3VxUko2Zk92LzNEMVFXMExOVHczU3pu?=
 =?utf-8?B?b04ra2lZK0dLaXM0NlN1ZE92RmhvMDRKM0RObWtpTVhjVzM2NmJuYUhqSGlm?=
 =?utf-8?B?RUpadE9PNStpQURqSGd0dmRYcmthcklVeWZnSFA2TlFVWk5pYllIdFl2OC95?=
 =?utf-8?B?cmRxV3NvTHFCb2hjRDZjK29aeWJFWUY4RGJ6OHFQVkRadGVROTFrN0p5RnhY?=
 =?utf-8?B?Wk1hemxPcGhSVjlDazJoTFFqcmRYeTJQd3V6b04rTWVQYVMzYWY2Zkt3RGxl?=
 =?utf-8?B?VDlvQ2FtdTRpU3VqVmhWRm4rNVZyZWVERlhJcU9WQi8xY2VJcjdXRTZhV0lZ?=
 =?utf-8?B?ckpNbXVEeFJKaEV5VmRrZmxLLzdrZFMvZC9YRjZCeUJ3RS9LcWZMOGU4bURm?=
 =?utf-8?B?dlorM2oveVVEZUxvMlhXZS9jeERsYmN4TVN2WHY2NkZLTVBCMWVYRVZMU09P?=
 =?utf-8?B?SW52NWhyWkpwRVorZnROb0dQdUd2Y2RzRDZDbWZDRm4xTVRpcitwc2ZxZ0FC?=
 =?utf-8?B?K1RVTVJQc0IrVzJPYTlIa2NzWVhiYjM1Wjd4ZGdTK3RiazZkS2kvTG5mNTZO?=
 =?utf-8?B?aDBnRkpGRXJGSG1iV3ZiTWpaQkRYeUhhaWRsckhKeVNPSDJRU2UvN3FXQWpF?=
 =?utf-8?Q?ghtWO06vC+kb3OVNhutgGbxNE2uoO9+E?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QXFqc3BwcUtaQXJPNjFINHlRR2xpV29Rc2RZb3FrYkRRZzBKMEJxcnlYRVpm?=
 =?utf-8?B?VitqYW1mMzREYldiT2h6SHZFR0lYUm1rMEZkSmd5YmY3SFk1dk0ybEpDc2Q3?=
 =?utf-8?B?YS84TnpleE0vS0JHamFPdEFnVERMSUFhY2x4KzU3NlpIYm1NTUxJRk1JTnA0?=
 =?utf-8?B?NFJXTk5rb0FkZGU5MHc4SVBqYklPNmplWmFDZHFIUG1GYkJKbVFRTHRkVVNr?=
 =?utf-8?B?dmZMbHhFTnByYTl1UTF1UnMzdkZDUktEOXZtQ1l1Nm1IOUpjVWJ2a3lCbWRz?=
 =?utf-8?B?Vy9tVmkxOExjN0lmNVNVN1R6MVpLWG8zSVlUQS9FZHRmUmlQRWQ3dW9pUEtE?=
 =?utf-8?B?L2VJbVVkOXgydUF3WW9UaFRnTFFubjZpUElSK05xY2VuMzhOdWllaFpKMVVm?=
 =?utf-8?B?dHJRQURDWlNZcVJaNUQ0VXMwOVIvYWE1OEtpWExuSktuODZrcDdTaEVIYVdS?=
 =?utf-8?B?d2FuYXo1V1BKc3podHdUaEQzbEFDakM4WXJmYktaTkpwWml0d3dRQy9teEZi?=
 =?utf-8?B?clRSRkxCR0hLSTJ3YnhHOGxWSE5hYzM1QzJ3NXd1MGNhVXpGZ1YvMjlJNEp4?=
 =?utf-8?B?K2xIZ2ZjVGhwbDJHa1ptSWJZWERiQmFPNkdkdm5pMUtuMk9XYWpNTUZDay9I?=
 =?utf-8?B?MnhHTWtQQnV5WHE0ZmpxVTFJcWM4UEVVQ0NzUmRoNmtiZEp3NUVhdWgzUWFj?=
 =?utf-8?B?bUVoZy9sUm1VZFZURjR6WThXLzV1b0NuSWMxb2hhZFZTR3VCU2ZCQU15NjRD?=
 =?utf-8?B?VGlPdXdmU05kREJHWGJaTU15R3NOSUVDaFVIaVVVR0FwY0Y4VUIzU3lpQnVv?=
 =?utf-8?B?MHE5Zmo2RG5xZFVHd0RIQUo0V1M5bnJvMUs2dEVabzZrZDFiOFhiSW5MOVR3?=
 =?utf-8?B?b29vTzZ5MXFEL1N4dkZBRTRGR3NHMmlEUDlhQ3ZZZ1R2MGd6Y0NiOE51dmJW?=
 =?utf-8?B?MExSdVg1ZEtSK2x3dlRYdENGaVdtM2FQSXJqV1ZzdVlWcXB5bTU4TEV5bFdz?=
 =?utf-8?B?U2VmYU4zQWZHYTRyTUZBVlJsZHhWbjdoa2R4VmFMQ0Y1RSsrdVpualRxK3dk?=
 =?utf-8?B?SkdaNmtXeElPSS91aTcvWGhiaERDOUt4NWducHhrd0xoOXNoQWJDRzVrWE41?=
 =?utf-8?B?bFQ1ZVdUOGI0Zm1lS2pVdGRWRGtrSWZHY1Y5Y1JxTkdTOTNHN3BZcDhtNWM2?=
 =?utf-8?B?M2F6d0cvVUpCUkdIQTFsSzNIMGxpMGNOTWZFejUwL2ZZKzlzclhvOEJuYVll?=
 =?utf-8?B?ZGFhb1UxNC9XNTdKYTVQVWF6Znd1WXQzWTBaenF3bkU0Z0lFNmJDTGVRNlMw?=
 =?utf-8?B?Smc1aEF3WjJkMDl3c3gzZWhzWW1pZXFWZVIxR3dQa25MaWx0Q1dOdUpaNG1F?=
 =?utf-8?B?NVg0enRjcGpiY2h4SWx0YWxVVUpwenlqRGo0UlFKWWJ5UEtUcnBucGlSYjdQ?=
 =?utf-8?B?UlFGWi9NcnpzUWozcTZUTVduT1RudVlXNEkwRUNkTktlaDZJcXpzdnBuL2Vi?=
 =?utf-8?B?M2lJTENFYWJCNldPK0V6cjczelU2SjhMNjJvTTZzZ2Q0SGMxTE11RG1kT3pT?=
 =?utf-8?B?T1dYMnI1OGhvSkxYYTBvTGJ5YVI2WGtWNlNuMVUrZnMzSjcxNWhHSGVLNlRa?=
 =?utf-8?B?Qng1emZqMkVKVURDaEZQNW45UGdXZjFhSitvcnRJS2MrbTdXN0lDM2xuN2tP?=
 =?utf-8?B?cGdQL0NXbGRLRytMb3l5ajRVRGlCSlFJaFRCMWFLb0ZDVjA4QWJld2hrbEZK?=
 =?utf-8?B?V25UQUduaW9kaklMNGlmZWpLL211d1hjOURoU1NZdmlZMDZucWw3bmhHQlJl?=
 =?utf-8?B?dVZueStFOEJtWG9Cc1RpOWJWcmx6cFJJMS84YWxvRDU2c1JKLzBpVkg0SG1a?=
 =?utf-8?B?enVOcjl5aERJazQ0TU9hdzZoSHNuQk9vOGVJb3FLRlNOY2JVVmNlb0twdGZW?=
 =?utf-8?B?MC9jclVCMm9vMVBralhpclZzY0hFM3ByRk9mTm5CdXJpb09UM1dvRjZZY3hk?=
 =?utf-8?B?RkQ5eTh4NU16Q0M2RlFUb3l6cjF2UXNIN1ROdHhUalEvRVN4Zzc3OGJpT0pt?=
 =?utf-8?B?aHN2YTNLVEJpcEErZ3c5QUlFcGphQm5sT1F0YTdFYlc0cVV5aDljSWY0bmx3?=
 =?utf-8?Q?Q5QqNd5gK72D9LcIejB5Bmg0M?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c825f58f-34e2-40cb-2822-08dd2f20d56d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 13:40:22.2061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjjsPqhKgPZ2z+VBQfxj14YRtnFvk2/VTfUJSJIB7Fr4gOx0UimkdkVUcfn0nP53Te+sIGiH30gXmm4FLz3st1i5Dd4rfVNgVq2H9lw9WyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSA3LCAyMDI1
IDc6MDYgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29t
PjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWNyA0LzRdIHRlc3RzL3hlL21tYXA6
IGFkZCB0ZXN0cyBmb3IgcGNpIG1lbSBiYXJyaWVyDQo+IA0KPiBPbiAwNi8wMS8yMDI1IDE1OjE0
LCBUZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPiBXZSB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IG1t
YXAgZG8gZGlyZWN0IG1hcHBpbmcgb2YgcGh5c2ljYWwgcGFnZSBhdA0KPiA+IGRvb3JiZWxsIHNw
YWNlIGFuZCB3aG9sZSBwYWdlIGlzIGFjY2Vzc2libGUgaW4gb3JkZXIgdG8gdXNlIHBjaSBtZW1v
cnkNCj4gPiBiYXJyaWVyIGVmZmVjdCBlZmZlY3RpdmVseS4NCj4gPg0KPiA+IEZvbGxvd2luZyBz
dWJ0ZXN0cyBhcmUgYWRkZWQsDQo+ID4gLi9idWlsZC90ZXN0cy94ZV9tbWFwIC0tciBwY2ktbWVt
YmFycmllciAuL2J1aWxkL3Rlc3RzL3hlX21tYXAgLS1yDQo+ID4gcGNpLW1lbWJhcnJpZXItcGFy
YWxsZWwgLi9idWlsZC90ZXN0cy94ZV9tbWFwIC0tcg0KPiA+IHBjaS1tZW1iYXJyaWVyLWJhZC1w
YWdlc2l6ZSAuL2J1aWxkL3Rlc3RzL3hlX21tYXAgLS1yDQo+ID4gcGNpLW1lbWJhcnJpZXItYmFk
LW9iamVjdA0KPiA+DQo+ID4gVjcoTUF1bGQpOg0KPiA+ICAgSW4gcGFyYWxsZWwgdGVzdCA6DQo+
ID4gICAtIGNoZWNrIHZhbHVlcyB3aXRoIDEgY2xpZW50IHdyaXRlIGFuZCBvdGhlciByZWFkIGlu
IGxvb3ANCj4gPiAgIC0gTW9kaWZ5IHNlZWQgYW5kIHVwZGF0ZSByYW5kb20gbnVtYmVyIGF0IGV2
ZXJ5IHRlc3QNCj4gPiBWNihNQXVsZCk6DQo+ID4gICAtIGNoZWNraW5nIGRpZmZlcm5ldCBjcm9z
cyBjbGllbnQgdmFsdWUgaXMgZW5vdWdoIGluIHBhcmFsbGVsIHRlc3QNCj4gPiBWNToNCj4gPiAg
IC0gQWRkIHBjaS1tZW1iYXJyaWVyLXBhcmFsbGVsIHRlc3QNCj4gPiBWMyhNQXVsZCk6DQo+ID4g
ICAtIENoZWNrIGlmIHBjaSBtZW1vcnkgYmFycmllciBpcyBzdXBwb3J0ZWQNCj4gPiBWMihNQXVs
ZCkNCj4gPiAgIC0gdXNlIGRvX2lvY3RsIGFuZCByZXBsYWNlIGlndF9zdWJ0ZXN0X2Ygd2l0aCBp
Z3Rfc3VidGVzdA0KPiA+ICAgLSBSZW1vdmUgdW51c2VkIGRlZmluZQ0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCj4gPiAt
LS0NCj4gPiAgIHRlc3RzL2ludGVsL3hlX21tYXAuYyB8IDE3MQ0KPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNzEgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX21tYXAuYyBi
L3Rlc3RzL2ludGVsL3hlX21tYXAuYyBpbmRleA0KPiA+IGQ4MThjYzJmOC4uOWRlN2UwM2M2IDEw
MDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX21tYXAuYw0KPiA+ICsrKyBiL3Rlc3RzL2lu
dGVsL3hlX21tYXAuYw0KPiA+IEBAIC02NCw2ICs2NCwxMTcgQEAgdGVzdF9tbWFwKGludCBmZCwg
dWludDMyX3QgcGxhY2VtZW50LCB1aW50MzJfdA0KPiBmbGFncykNCj4gPiAgIAlnZW1fY2xvc2Uo
ZmQsIGJvKTsNCj4gPiAgIH0NCj4gPg0KPiA+ICsjZGVmaW5lIFBBR0VfU0laRSA0MDk2DQo+ID4g
Kw0KPiA+ICsvKioNCj4gPiArICogU1VCVEVTVDogcGNpLW1lbWJhcnJpZXINCj4gPiArICogRGVz
Y3JpcHRpb246IGNyZWF0ZSBwY2kgbWVtb3J5IGJhcnJpZXIgd2l0aCB3cml0ZSBvbiBkZWZpbmVk
IG1tYXANCj4gb2Zmc2V0Lg0KPiA+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRl
c3QNCj4gPiArICoNCj4gPiArICovDQo+ID4gK3N0YXRpYyB2b2lkIHRlc3RfcGNpX21lbWJhcnJp
ZXIoaW50IHhlKSB7DQo+ID4gKwl1aW50NjRfdCBmbGFncyA9IE1BUF9TSEFSRUQ7DQo+ID4gKwl1
bnNpZ25lZCBpbnQgcHJvdCA9IFBST1RfV1JJVEU7DQo+ID4gKwl1aW50MzJfdCAqcHRyOw0KPiA+
ICsJdWludDY0X3Qgc2l6ZSA9IFBBR0VfU0laRTsNCj4gPiArCXN0cnVjdCB0aW1lc3BlYyB0djsN
Cj4gPiArCXN0cnVjdCBkcm1feGVfZ2VtX21tYXBfb2Zmc2V0IG1tbyA9IHsNCj4gPiArCQkuaGFu
ZGxlID0gMCwNCj4gPiArCQkuZmxhZ3MgPSBEUk1fWEVfTU1BUF9PRkZTRVRfRkxBR19QQ0lfQkFS
UklFUiwNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJZG9faW9jdGwoeGUsIERSTV9JT0NUTF9YRV9H
RU1fTU1BUF9PRkZTRVQsICZtbW8pOw0KPiA+ICsJcHRyID0gbW1hcChOVUxMLCBzaXplLCBwcm90
LCBmbGFncywgeGUsIG1tby5vZmZzZXQpOw0KPiA+ICsJaWd0X2Fzc2VydChwdHIgIT0gTUFQX0ZB
SUxFRCk7DQo+ID4gKw0KPiA+ICsJLyogQ2hlY2sgd2hvbGUgcGFnZSBmb3IgYW55IGVycm9ycywg
YWxzbyBjaGVjayBhcw0KPiA+ICsJICogd2Ugc2hvdWxkIG5vdCByZWFkIHdyaXR0ZW4gdmFsdWVz
IGJhY2sNCj4gPiArCSAqLw0KPiA+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBzaXplIC8gc2l6ZW9m
KCpwdHIpOyBpKyspIHsNCj4gPiArCQkvKiBJdCBpcyBleHBlY3RlZCB1bmNvbmZpZ3VyZWQgZG9v
cmJlbGwgc3BhY2UNCj4gPiArCQkgKiB3aWxsIHJldHVybiByZWFkIHZhbHVlIDB4ZGVhZGJlZWYN
Cj4gPiArCQkgKi8NCj4gPiArCQlpZ3RfYXNzZXJ0X2VxX3UzMihSRUFEX09OQ0UocHRyW2ldKSwg
MHhkZWFkYmVlZik7DQo+ID4gKw0KPiA+ICsJCWlndF9nZXR0aW1lKCZ0dik7DQo+ID4gKwkJcHRy
W2ldID0gaTsNCj4gPiArCQlpZiAoUkVBRF9PTkNFKHB0cltpXSkgPT0gaSkgew0KPiA+ICsJCQl3
aGlsZSAoUkVBRF9PTkNFKHB0cltpXSkgPT0gaSkNCj4gPiArCQkJCTsNCj4gPiArCQkJaWd0X2lu
Zm8oImZkOiVkIHZhbHVlIHJldGFpbmVkIGZvciAlIlBSSWQ2NCJucw0KPiBwb3M6JWRcbiIsDQo+
ID4gKwkJCQkJeGUsIGlndF9uc2VjX2VsYXBzZWQoJnR2KSwgaSk7DQo+ID4gKwkJfQ0KPiA+ICsJ
CWlndF9hc3NlcnRfbmVxKFJFQURfT05DRShwdHJbaV0pLCBpKTsNCj4gPiArCX0NCj4gPiArDQo+
ID4gKwltdW5tYXAocHRyLCBzaXplKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAq
IFNVQlRFU1Q6IHBjaS1tZW1iYXJyaWVyLXBhcmFsbGVsDQo+ID4gKyAqIERlc2NyaXB0aW9uOiBj
cmVhdGUgcGFyYWxsZWwgcGNpIG1lbW9yeSBiYXJyaWVyIHdpdGggd3JpdGUgb24gZGVmaW5lZA0K
PiBtbWFwIG9mZnNldC4NCj4gPiArICogVGVzdCBjYXRlZ29yeTogZnVuY3Rpb25hbGl0eSB0ZXN0
DQo+ID4gKyAqDQo+ID4gKyAqLw0KPiA+ICtzdGF0aWMgdm9pZCB0ZXN0X3BjaV9tZW1iYXJyaWVy
X3BhcmFsbGVsKGludCB4ZSwgaW50IGNoaWxkLCB1bnNpZ25lZA0KPiA+ICtpbnQgaSkgew0KPiA+
ICsJdWludDY0X3QgZmxhZ3MgPSBNQVBfU0hBUkVEOw0KPiA+ICsJdW5zaWduZWQgaW50IHByb3Qg
PSBQUk9UX1dSSVRFOw0KPiA+ICsJdWludDMyX3QgKnB0cjsNCj4gPiArCXVpbnQ2NF90IHNpemUg
PSBQQUdFX1NJWkU7DQo+ID4gKwlzdHJ1Y3QgZHJtX3hlX2dlbV9tbWFwX29mZnNldCBtbW8gPSB7
DQo+ID4gKwkJLmhhbmRsZSA9IDAsDQo+ID4gKwkJLmZsYWdzID0gRFJNX1hFX01NQVBfT0ZGU0VU
X0ZMQUdfUENJX0JBUlJJRVIsDQo+ID4gKwl9Ow0KPiA+ICsJaW50IHZhbHVlOw0KPiA+ICsNCj4g
PiArCWRvX2lvY3RsKHhlLCBEUk1fSU9DVExfWEVfR0VNX01NQVBfT0ZGU0VULCAmbW1vKTsNCj4g
PiArCXB0ciA9IG1tYXAoTlVMTCwgc2l6ZSwgcHJvdCwgZmxhZ3MsIHhlLCBtbW8ub2Zmc2V0KTsN
Cj4gPiArCWlndF9hc3NlcnQocHRyICE9IE1BUF9GQUlMRUQpOw0KPiA+ICsNCj4gPiArCS8qIEl0
IGlzIGV4cGVjdGVkIHVuY29uZmlndXJlZCBkb29yYmVsbCBzcGFjZQ0KPiA+ICsJICogd2lsbCBy
ZXR1cm4gcmVhZCB2YWx1ZSAweGRlYWRiZWVmDQo+ID4gKwkgKi8NCj4gPiArCWlndF9hc3NlcnRf
ZXFfdTMyKFJFQURfT05DRShwdHJbaV0pLCAweGRlYWRiZWVmKTsNCj4gPiArDQo+ID4gKwlpZ3Rf
dW50aWxfdGltZW91dCg1KSB7DQo+ID4gKwkJLyogQ2hlY2sgY2xpZW50cyBzaG91bGQgbm90IGJl
IGFibGUgdG8gc2VlIGVhY2ggb3RoZXIgKi8NCj4gPiArCQlpZiAoY2hpbGQgIT0gLTEpIHsNCj4g
PiArCQkJdmFsdWUgPSBpICsgMTsNCj4gPiArCQkJaWd0X2Fzc2VydF9uZXEoUkVBRF9PTkNFKHB0
cltpXSksIGkpOw0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCXZhbHVlID0gaTsNCj4gPiArCQkJ
aWd0X2Fzc2VydF9uZXEoUkVBRF9PTkNFKHB0cltpXSksIGkgKyAxKTsNCj4gPiArCQl9DQo+ID4g
Kw0KPiA+ICsJCVdSSVRFX09OQ0UocHRyW2ldLCB2YWx1ZSk7DQo+ID4gKwl9DQo+ID4gKwlpZ3Rf
YXNzZXJ0X2VxX3UzMihSRUFEX09OQ0UocHRyW2ldKSwgMHhkZWFkYmVlZik7DQo+IA0KPiBEb2Vz
IHRoaXMgbmVlZCB0aGUgcmV0cnkgbG9vcCBhcyBwZXIgYWJvdmU/DQoNCkp1c3QgbWFraW5nIHN1
cmUsIGFmdGVyIGFsbCB3ZSBoYXZlIHdyaXR0ZW4sIHdlIGFyZSBub3QgcmVhZGluZyBiYWNrIGFu
eXRoaW5nIGVsc2UgdGhhbiAweGRlYWRiZWVmLg0KDQo+IA0KPiA+ICsNCj4gPiArCW11bm1hcChw
dHIsIHNpemUpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogU1VCVEVTVDogcGNp
LW1lbWJhcnJpZXItYmFkLXBhZ2VzaXplDQo+ID4gKyAqIERlc2NyaXB0aW9uOiBUZXN0IG1tYXAg
b2Zmc2V0IHdpdGggYmFkIHBhZ2VzaXplIGZvciBwY2kgbWVtYmFycmllci4NCj4gPiArICogVGVz
dCBjYXRlZ29yeTogbmVnYXRpdmUgdGVzdA0KPiA+ICsgKg0KPiA+ICsgKi8NCj4gPiArc3RhdGlj
IHZvaWQgdGVzdF9iYWRfcGFnZXNpemVfZm9yX3BjaW1lbShpbnQgZmQpIHsNCj4gPiArCXVpbnQz
Ml90ICptYXA7DQo+ID4gKwl1aW50NjRfdCBwYWdlX3NpemUgPSBQQUdFX1NJWkUgKiAyOw0KPiA+
ICsJc3RydWN0IGRybV94ZV9nZW1fbW1hcF9vZmZzZXQgbW1vID0gew0KPiA+ICsJCS5oYW5kbGUg
PSAwLA0KPiA+ICsJCS5mbGFncyA9IERSTV9YRV9NTUFQX09GRlNFVF9GTEFHX1BDSV9CQVJSSUVS
LA0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwlkb19pb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0dFTV9N
TUFQX09GRlNFVCwgJm1tbyk7DQo+ID4gKwltYXAgPSBtbWFwKE5VTEwsIHBhZ2Vfc2l6ZSwgUFJP
VF9XUklURSwgTUFQX1NIQVJFRCwgZmQsDQo+IG1tby5vZmZzZXQpOw0KPiA+ICsJaWd0X2Fzc2Vy
dChtYXAgPT0gTUFQX0ZBSUxFRCk7DQo+ID4gK30NCj4gPiArDQo+ID4gICAvKioNCj4gPiAgICAq
IFNVQlRFU1Q6IGJhZC1mbGFncw0KPiA+ICAgICogRGVzY3JpcHRpb246IFRlc3QgbW1hcCBvZmZz
ZXQgd2l0aCBiYWQgZmxhZ3MuDQo+ID4gQEAgLTEyNiw2ICsyMzcsMjUgQEAgc3RhdGljIHZvaWQg
dGVzdF9iYWRfb2JqZWN0KGludCBmZCkNCj4gPiAgIAlkb19pb2N0bF9lcnIoZmQsIERSTV9JT0NU
TF9YRV9HRU1fTU1BUF9PRkZTRVQsICZtbW8sDQo+IEVOT0VOVCk7DQo+ID4gICB9DQo+ID4NCj4g
PiArLyoqDQo+ID4gKyAqIFNVQlRFU1Q6IHBjaS1tZW1iYXJyaWVyLWJhZC1vYmplY3QNCj4gPiAr
ICogRGVzY3JpcHRpb246IFRlc3QgbW1hcCBvZmZzZXQgd2l0aCBiYWQgb2JqZWN0IGZvciBwY2kg
bWVtIGJhcnJpZXIuDQo+ID4gKyAqIFRlc3QgY2F0ZWdvcnk6IG5lZ2F0aXZlIHRlc3QNCj4gPiAr
ICoNCj4gPiArICovDQo+ID4gK3N0YXRpYyB2b2lkIHRlc3RfYmFkX29iamVjdF9mb3JfcGNpbWVt
KGludCBmZCkgew0KPiA+ICsJdWludDY0X3Qgc2l6ZSA9IHhlX2dldF9kZWZhdWx0X2FsaWdubWVu
dChmZCk7DQo+ID4gKwlzdHJ1Y3QgZHJtX3hlX2dlbV9tbWFwX29mZnNldCBtbW8gPSB7DQo+ID4g
KwkJLmhhbmRsZSA9IHhlX2JvX2NyZWF0ZShmZCwgMCwgc2l6ZSwNCj4gPiArCQkJCSAgICAgICB2
cmFtX2lmX3Bvc3NpYmxlKGZkLCAwKSwNCj4gPiArDQo+IERSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdf
TkVFRFNfVklTSUJMRV9WUkFNKSwNCj4gPiArCQkuZmxhZ3MgPSBEUk1fWEVfTU1BUF9PRkZTRVRf
RkxBR19QQ0lfQkFSUklFUiwNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJZG9faW9jdGxfZXJyKGZk
LCBEUk1fSU9DVExfWEVfR0VNX01NQVBfT0ZGU0VULCAmbW1vLA0KPiBFSU5WQUwpOyB9DQo+ID4g
Kw0KPiA+ICAgc3RhdGljIGptcF9idWYgam1wOw0KPiA+DQo+ID4gICBfX25vcmV0dXJuIHN0YXRp
YyB2b2lkIHNpZ3RyYXAoaW50IHNpZykgQEAgLTI2MCw2ICszOTAsMTYgQEAgc3RhdGljDQo+ID4g
dm9pZCB0ZXN0X2NwdV9jYWNoaW5nKGludCBmZCkNCj4gPiAgIAlhc3NlcnRfY2FjaGluZyhmZCwg
c3lzdGVtX21lbW9yeShmZCksIDAsDQo+IERSTV9YRV9HRU1fQ1BVX0NBQ0hJTkdfV0MgKyAxLCB0
cnVlKTsNCj4gPiAgIH0NCj4gPg0KPiA+ICtzdGF0aWMgYm9vbCBpc19wY2lfbWVtYmFycmllcl9z
dXBwb3J0ZWQoaW50IGZkKSB7DQo+ID4gKwlzdHJ1Y3QgZHJtX3hlX2dlbV9tbWFwX29mZnNldCBt
bW8gPSB7DQo+ID4gKwkJLmhhbmRsZSA9IDAsDQo+ID4gKwkJLmZsYWdzID0gRFJNX1hFX01NQVBf
T0ZGU0VUX0ZMQUdfUENJX0JBUlJJRVIsDQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiArCXJldHVybiAo
aWd0X2lvY3RsKGZkLCBEUk1fSU9DVExfWEVfR0VNX01NQVBfT0ZGU0VULCAmbW1vKSA9PQ0KPiAw
KTsgfQ0KPiA+ICsNCj4gPiAgIGlndF9tYWluDQo+ID4gICB7DQo+ID4gICAJaW50IGZkOw0KPiA+
IEBAIC0yNzgsNiArNDE4LDMyIEBAIGlndF9tYWluDQo+ID4gICAJCXRlc3RfbW1hcChmZCwgdnJh
bV9tZW1vcnkoZmQsIDApIHwgc3lzdGVtX21lbW9yeShmZCksDQo+ID4NCj4gRFJNX1hFX0dFTV9D
UkVBVEVfRkxBR19ORUVEU19WSVNJQkxFX1ZSQU0pOw0KPiA+DQo+ID4gKwlpZ3Rfc3VidGVzdCgi
cGNpLW1lbWJhcnJpZXIiKSB7DQo+ID4gKwkJaWd0X3JlcXVpcmUoaXNfcGNpX21lbWJhcnJpZXJf
c3VwcG9ydGVkKGZkKSk7DQo+ID4gKwkJdGVzdF9wY2lfbWVtYmFycmllcihmZCk7DQo+ID4gKwl9
DQo+ID4gKw0KPiA+ICsJaWd0X3N1YnRlc3QoInBjaS1tZW1iYXJyaWVyLXBhcmFsbGVsIikgew0K
PiA+ICsJCWludCB4ZSA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiANCj4gTW92ZSB0
aGlzIGJlbG93IHRoZSByZXF1aXJlPw0KDQpTdXJlLCB3aWxsIG1vdmUuDQoNClRlamFzDQoNCj4g
DQo+IE90aGVyd2lzZSwNCj4gUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxk
QGludGVsLmNvbT4NCj4gDQo+ID4gKwkJdW5zaWduZWQgaW50IGk7DQo+ID4gKwkJdWludDMyX3Qg
KnB0cjsNCj4gID4gKz4gKwkJaWd0X3JlcXVpcmUoaXNfcGNpX21lbWJhcnJpZXJfc3VwcG9ydGVk
KGZkKSk7DQo+ID4gKwkJc3JhbmQodGltZSgwKSk7DQo+ID4gKwkJaSA9IHJhbmQoKSAlIChQQUdF
X1NJWkUgLyBzaXplb2YoKnB0cikpOw0KPiA+ICsJCWlndF9mb3JrKGNoaWxkLCAxKQ0KPiA+ICsJ
CQl0ZXN0X3BjaV9tZW1iYXJyaWVyX3BhcmFsbGVsKHhlLCBjaGlsZCwgaSk7DQo+ID4gKwkJdGVz
dF9wY2lfbWVtYmFycmllcl9wYXJhbGxlbChmZCwgLTEsIGkpOw0KPiA+ICsJCWlndF93YWl0Y2hp
bGRyZW4oKTsNCj4gPiArDQo+ID4gKwkJY2xvc2UoeGUpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAr
CWlndF9zdWJ0ZXN0KCJwY2ktbWVtYmFycmllci1iYWQtcGFnZXNpemUiKSB7DQo+ID4gKwkJaWd0
X3JlcXVpcmUoaXNfcGNpX21lbWJhcnJpZXJfc3VwcG9ydGVkKGZkKSk7DQo+ID4gKwkJdGVzdF9i
YWRfcGFnZXNpemVfZm9yX3BjaW1lbShmZCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAgCWlndF9z
dWJ0ZXN0KCJiYWQtZmxhZ3MiKQ0KPiA+ICAgCQl0ZXN0X2JhZF9mbGFncyhmZCk7DQo+ID4NCj4g
PiBAQCAtMjg3LDYgKzQ1MywxMSBAQCBpZ3RfbWFpbg0KPiA+ICAgCWlndF9zdWJ0ZXN0KCJiYWQt
b2JqZWN0IikNCj4gPiAgIAkJdGVzdF9iYWRfb2JqZWN0KGZkKTsNCj4gPg0KPiA+ICsJaWd0X3N1
YnRlc3QoInBjaS1tZW1iYXJyaWVyLWJhZC1vYmplY3QiKSB7DQo+ID4gKwkJaWd0X3JlcXVpcmUo
aXNfcGNpX21lbWJhcnJpZXJfc3VwcG9ydGVkKGZkKSk7DQo+ID4gKwkJdGVzdF9iYWRfb2JqZWN0
X2Zvcl9wY2ltZW0oZmQpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAgIAlpZ3Rfc3VidGVzdCgic21h
bGwtYmFyIikgew0KPiA+ICAgCQlpZ3RfcmVxdWlyZSh4ZV92aXNpYmxlX3ZyYW1fc2l6ZShmZCwg
MCkpOw0KPiA+ICAgCQlpZ3RfcmVxdWlyZSh4ZV92aXNpYmxlX3ZyYW1fc2l6ZShmZCwgMCkgPCB4
ZV92cmFtX3NpemUoZmQsIDApKTsNCg0K
