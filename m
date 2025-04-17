Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC8FC369CB
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 18:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABDF10E39A;
	Thu, 17 Apr 2025 18:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z31UUaNN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C57810E39A
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 18:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744914012; x=1776450012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OsqdQRDX4OQzGUEQoaA2UcZBJ3+NTRO7Mykix5m7Y44=;
 b=Z31UUaNNUVqCngoJrtIqWQZlPa/WIKKTSzunczAtPn0kcfKJ4gQ+wWyj
 ao08nGiPmnMO2vU+bVeCod+PckOhHV8kw/2QS70/lrw1WKYsOAd1cvawQ
 ziAq2VRsBfj298IW/wRqwaZhVTu9kZBBH1wnYHx5KmOKqCWARSYVuSMXx
 ULw9qaAA5dDeV4hX1v2LZeaj6h8ZWWRWdirOoEBsi7aQsQnhnMJcpO6L4
 HChwR+tbCHSuPhSO/tWX407FzE4U/cWdDc97C9aIVpLEgNLgEJbzlYmN8
 17FrrHRaheuHehurzgKLMYhctT6hsgaDwup9SVAnManQMV9PdK8+h2Jn0 g==;
X-CSE-ConnectionGUID: YzNMc12ASfiCDk7HTMAOOw==
X-CSE-MsgGUID: gEu498dFRdeXQm+deCdfDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46447180"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="46447180"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 11:20:12 -0700
X-CSE-ConnectionGUID: qSefLLyMTvKY0ekEfhbpBQ==
X-CSE-MsgGUID: tAz/2IxmSuacetIYzZcfcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="131201544"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 11:20:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 11:20:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 11:20:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 11:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPy4i3iW1cUQGajlaYIcv4AbQOJ3j7dgf7qgt6SztTUAYoN1KVjfz9ah/syMQVepDg0+641VM1mzsOr5N+J98yXLxMoKblZZKRZabsVKqmh+Mp/D7fQcr1ZP10N08Penp6cewbUxYsg7yuUevK3IGhDYqMCFS3bo49aJPX339wpCHLIP7YV3MD/hUzZP2b/VnneElpypIlBHl0PbnfmgBXGvI88RXTDRzRcE0D/LE2UOoKX/U1HDL0T3Yny7Bagy69j44biNXTPZkyR8TE1jcJ4EMd1buay7MjJpzPbdQNmti0Kjw7o6imRHQcb5EEAUvVv/Jwfu9XiuIuUpTIzzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsqdQRDX4OQzGUEQoaA2UcZBJ3+NTRO7Mykix5m7Y44=;
 b=CYV25rz+2FJS+hE6NjIzWC8gmCo/v3PG3niqNwvAYQUEJHXbcARjwCwPaan2pP06f4NN4o3xwnZFmznk1gCJR0q2yylhr7AVAcc/Z4+0HYJE7mrZBaAV2gNGYs+BRuxlvCN21n9iuN2QWHkmw6ZfbDSNxcRsVtYy7NPKh5S6u0TUqPceF4wBycjeG6vvhp1vi1ru52CnotemUpLiZ/0Oav1DsfJEnyBEPephP6kprqBgz1XaUrqDOzAcV78lHbX9D4yW3suSDlzH9vbsA6AJo385yN1jGCDhETm+T+QlzIe9+GzTdz9hsdn6gICgMB9seplSrYMsAcXfBVzIlXSjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:19:54 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%6]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 18:19:54 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Thread-Topic: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Thread-Index: AQHbp6Lu7DD/vlYFq0a8UzzQfyhwEbOoO1iA
Date: Thu, 17 Apr 2025 18:19:54 +0000
Message-ID: <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CH3PR11MB8519:EE_
x-ms-office365-filtering-correlation-id: e7f5b0c5-cfee-4c8e-7a77-08dd7ddc738d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NThXUFFOYUwvQS9IWlpWbWlENUhGb0o0cy9MSm5lbDNHdmZZanRIZ3oxazZs?=
 =?utf-8?B?WFpGNUVnQ0FwOTR0Ym1vMWR2R1U5bUF5WEZUbkZYRUd3TUF5eWdZamI0V3ln?=
 =?utf-8?B?ZFU3ckJJMkRPZndDU0IzVUlsK0JyamVBU2ZvK3BESmxKMHBiQ3YwMGRYL3Nz?=
 =?utf-8?B?Wno1T25xdkx4WlpCc2UyTm1XSG00OWFZOUZTQmhCeWhCaFQrWEV3cFMzcjJE?=
 =?utf-8?B?SG04T1RXV0xlVWlWdWF2TDV1MFFYMVppZWhmdlpXc1hCNDBCTldNZzBEdncx?=
 =?utf-8?B?NWVDaUpON1cza0FhbjljTlhWVzcxeldGRzg3TW9NMDNyL2pxTzkwVFRUTEYx?=
 =?utf-8?B?SVl4NzFHZzZuTTdrVTNPdkZuaTNWR2VDclhpYnYxcWkxd1dNM2E0WDFLWlhv?=
 =?utf-8?B?a3NGSU92bHNWbE4yZkJhR0VHRmh2UCtpSHArVWl3Z053dDNOL3lGM3FGSU45?=
 =?utf-8?B?QVBzVGRsZU94clVUQXJib3hFTlFRSThYc3RHVlNJcDNhdVFUQUJLdU40OElr?=
 =?utf-8?B?QXBFQlRLVkE1dlZ4SGRJZkxtS0MrM3YvamU2K0VOTW1oVjVYRGVzZnQzMTVr?=
 =?utf-8?B?K2ZjV2F3ZXNtNFc4ZHdRWUc0MGNHMytOSDlXL2NrZDhkMkRNVlErb2xLd1Bj?=
 =?utf-8?B?cG5LTlNyMDV1aXNRTGhGblB5TUxSbjQrL2RlTGZFTkJPZU5iNGFjdFloYzZM?=
 =?utf-8?B?clFTZ0xJOWlBUDU5V2NETzNUSGhONk9BQWhPSXZEOC84YnpMN250M3ppQXhw?=
 =?utf-8?B?ZUh1Mk1ocHN1ek4xL214N2JTNDY4R0lOWDQ4dk00ZG5ZTFBLeThzb1VkNFI5?=
 =?utf-8?B?WFY0bzVyMFlnZG9vV1MrOXBWQk9MVVNlY01aMkZseU9aajY0YktKblVMQ3hE?=
 =?utf-8?B?SEtqQTVzbHdwUUczbGNBRDM4K20rQ1hKaFh4Mk5nd2dPZWdnOHZGTlFXUDdT?=
 =?utf-8?B?dkN5bDRsYmpORGhFbGNRSE82VUNBalZkdFVWQ29COXlmYjhjTmNkNnN1L1hs?=
 =?utf-8?B?WTFFbFhoT3JQck5VZEgwYnU4SHo5MlRHd2p3bDNFaWY4TTlBa2xKZlIyZG5W?=
 =?utf-8?B?Z3R3RzhqbWYrbkFxdWZGVm1TMFo0ZHNTOWFpbkVGS3FKMVlSNXNnc0FWOU1I?=
 =?utf-8?B?WlVjdmFBNFBiUC8xSmxVaWZpaE5Pdm5xekpxY09pZklYcllUSkt2TW1LWnBr?=
 =?utf-8?B?dEQ0REVPZ3lVSzZpelE1dXg1K0V5d1NhYktKZ3dDc0hWUjFYeXJONG8yUXk4?=
 =?utf-8?B?bkU1azZXNWlKNzdWR1grblNJTkZScUNlbGwrSDArd28zM05Na1JFK2ZnWkI3?=
 =?utf-8?B?emNVT3ZiZG5BZlRQdThFZENVcUtFL1dzTlhiNWE3eXJ3Q1NjMTZRZFRDQjk1?=
 =?utf-8?B?a0U0ajNVdnNud0xDYld4WnhOYTRNM281Rml3MU5lWlgzNGNYcWYyTE1GWnBp?=
 =?utf-8?B?UGRNVnd1dWN1aTh2ZmNjWGFETVMxUGlPVWdJclhoSzZIbmRqTnE2NlNZQ2Zy?=
 =?utf-8?B?RmNkREtwT2YxN1RXd2pNUDJQajR3WFdrN3BSRnFvL2Y4cVEyWllVTEhNWVU5?=
 =?utf-8?B?SE1HejZndnhXVnY0ZHpoOWcxeUlBWXBDVDFuR3cvQyt0Y1VuU1lraHlpSzJa?=
 =?utf-8?B?cDdWL3Fsdkhxd2xiaWppL0NseitBdjZOSWIyaXNWeGV0T0RDTEF2ZDBIaWU4?=
 =?utf-8?B?ZDlsS2FaVjlYd3l3RHcwYTB1WDQ3ai9FblRiTkdSUnN3MDIydWowVm0zRnlt?=
 =?utf-8?B?a3NrdVNLNWRGNDdTKy82T0hZang0YmM2cVJuZHM1c3ZTUEhoNGN5SkpYUmlk?=
 =?utf-8?B?a3FiMzhWbkdwZE1oY2JiTFNwbmR4a1Z0YzhFbzJYaUVoQWVpSVQrRzNMazUy?=
 =?utf-8?B?Q2RZeWlzLzRud2RZK1kydlhMTXZjeUJ1WEpqZUVleEsxRkFreS9ydDFlVm9K?=
 =?utf-8?B?dFZydkR6cGwxVVhFdXFrTkppUVJkeTk5WVpHclNrK3RhWVhFYytDZ1BCVzJa?=
 =?utf-8?B?MmJsVlU4Tit3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmJTcm9zdFdOVkQ0QWlDMGE2UzVpWXRYWDZsTFl0VkF2azVPdFRrVWtlUkRu?=
 =?utf-8?B?SmZHaXlWTnhzSUQxSUhHcHpVL25iZU9CR2ZLS09EejJteHIzQ0daUnVDa3Nn?=
 =?utf-8?B?TlJ1WUVCWTVPWTRKRE5CMkozYXJGQ296eVFrcWJwdUY5S1JQb2NDVS9uUHFu?=
 =?utf-8?B?T2NyUktpeWY0U052U2tsblZpcnlnWEhISTU2cnNDRTdKcG5CU2xZR1FxWDla?=
 =?utf-8?B?bFprZHJVUVdid2Z5dEgvK1BURldUTkk4Q0RWdDlCaFdQMFR4TnUyMXdJQ1BQ?=
 =?utf-8?B?dzhsWlNiMFJHMEQ3VUlDYlpQenk5NjBOeXFpdnVmNURvRVlST3J4UmovVGdI?=
 =?utf-8?B?QjNnSEhmMG1Pc21LTnVBMCtIWUYwOW1nUWgxZ01KTXNnMUkyRU01ZjlCZmhW?=
 =?utf-8?B?MUVNaVByVVdJRmRRSXQxY2ptNTVKNjUxTTBPVnFLbnM5MHpPcmVvc01lVXhZ?=
 =?utf-8?B?aDNTeG03aURiMmJsR1NSS2VsSGJUSk03WWRFRFZudU5vNVYyU3dNbXIwd3lh?=
 =?utf-8?B?ZktOb3BNWnE4dnVkbzlDRlMwdmY2dDZGRkFpQUVnRG56MVdDR0drNWJLalZ1?=
 =?utf-8?B?clFmVHR2SzV5bXYrcGtmaDAvQjRNRUJYYmRzQU9EUnk4dDBseXJvd3BmWmtN?=
 =?utf-8?B?alJhYXovUklzSGYvRE9lOFZIWk0zb3gzQ3NvWXQ1UDRsT05nSFp0RWhqb3F4?=
 =?utf-8?B?QXB5cU5jZGxyWFNabmgvUEtNR2U5QTltNGh0OVdBTnZ2SlV5dkFGY0c2N2Vn?=
 =?utf-8?B?blhiZlJGTjUrNzVYaGdIWUNBYzBPZTE5RG9TTm5mSVZnNy9YTDhybVdCeWhZ?=
 =?utf-8?B?WXhtSEVHeG5FY2xRYVA1VVVHTk9VLzJwM0dxeWZZWnRGKzVuaEJmQ0dSV1l3?=
 =?utf-8?B?RjU0UDhjSzhXWkVjQk55dU9lTkNoN3RqVUZhbTVRWEhEOEY2Q2VReGhyYk5z?=
 =?utf-8?B?dmd2N3VPaFhuRktIdUpnQ1hVbk4vU0txQmJRMEE0b3dtZ1p4UFdDcG9oZlhk?=
 =?utf-8?B?ZGh0ZS91N01qV2gwWERtNkp4eEJZWHBhcjJrVnJhWXpiSTNXSVQ2YXpSS2J0?=
 =?utf-8?B?QjBENXc5VDMxWE1JRWF0bURuakFIa1drSE1EaEFNeXhJRUtRY0VqNjZ2eWE5?=
 =?utf-8?B?dzM3endaYXU2WHk5NGVoYTc5VDhlbnNxcDJ6Wjdxakx5RmwvcDFhWjV1RVlP?=
 =?utf-8?B?ZEJGTm5aS1htWmxXV3pRL1p6Y21xRVY2RVRHQ1lYVG54NlhLZllJNDBzdi8r?=
 =?utf-8?B?Z25vcXVXNVM4MkN3cG5lYkxrcVpKV3hjV2FUNlhVNXNHcDFCZEVERENxY2l3?=
 =?utf-8?B?UDFhZGZTNmZmVklqRWhlbzduN1FSN3dwSTBrclBzOVo2OU9qaUJKdmQ4NUg1?=
 =?utf-8?B?RWlmaDlBUHJ0TmEwWkl5c1lvbW43SnBiR005eVA0b0NacHhZVlN4TktrbCt1?=
 =?utf-8?B?VnFZcUQ5TWUzTTBOb1RRTldQbm9lZlRHcHhGUTNCamNGRW5ldjhxSDJLVk9n?=
 =?utf-8?B?S2w0aFQ0QUlBRUhDOE5pdklUZm4wempsc3NsVjNHcEpiR1ZrdHBhc1d1cjda?=
 =?utf-8?B?SWxMa0xFYVBOSFRyTkdPVUM1ZjN1SlZzdklGNzlJUnpHd0ZHSkkrYno4SG5F?=
 =?utf-8?B?U3BtNHBNOHFzcUR2RGsxSW15YXBJNVhaM2NrcXRTdXZyNnV5ZytpRzVVclAw?=
 =?utf-8?B?d2Z4aVYrakFhNk50ZTFzYS9nekNPSmgwNmFmeXI2UFdvWW1peVU3dEdCWnJ4?=
 =?utf-8?B?aUE2c1RLbEx3THNDcVJqNk5xbU9CSldMeWdUY2wvTkhWdlkrK212WGxHTW4x?=
 =?utf-8?B?K0h3WXcvT0xpZFZSQ0dGUWRZdG1JV0FRS01seEU4TWU2Q1F1bXBUR2JUckVD?=
 =?utf-8?B?VFl2aWorR1FldnN2Uy9Rc2dua2dtQkNjSENXQ0pNR25JSTU0eVFhL1RERFVn?=
 =?utf-8?B?WWZVdm1VWEZrNlZmY29jLzkyNThUOGpPV1NiZFNMVGlrQWtUNWM3MGtFMTdP?=
 =?utf-8?B?VTlSVFNJMFZYSVF3WEY4K25ubWhYaGNaS2dWYTNSbWZqZnY5aUdLWVNyNjhl?=
 =?utf-8?B?c2ZHcWZRcEh2eHc2UHBvSXMreDEySytuNmhaOXQyU3dlR09FVExaUmQ4U2Jv?=
 =?utf-8?B?YXVvT0FodytmUzlHbXFaOG1xKzBmRDlJVnlGRU1iMEtzeExsbWcyU0JVb1Vp?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD95951FC51FCB4FBB984966249D1FF0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f5b0c5-cfee-4c8e-7a77-08dd7ddc738d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 18:19:54.0840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdOZcGQeXJDaqfJit2JmCPjBOFs7tA6ahg2/wD1y4e86CknLigMowg+6A9OwvwvAEx2A0WnTDXEsXtyKctg/Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDE1OjQ3ICswNTMwLCBIaW1hbCBQcmFzYWQgR2hpbWlyYXkg
d3JvdGU6DQo+IFRoaXMgY29tbWl0IGludHJvZHVjZXMgYSBuZXcgbWFkdmlzZSBpbnRlcmZhY2Ug
dG8gc3VwcG9ydA0KPiBkcml2ZXItc3BlY2lmaWMgaW9jdGwgb3BlcmF0aW9ucy4gVGhlIG1hZHZp
c2UgaW50ZXJmYWNlIGFsbG93cyBmb3IgbW9yZQ0KPiBlZmZpY2llbnQgbWVtb3J5IG1hbmFnZW1l
bnQgYnkgcHJvdmlkaW5nIGhpbnRzIHRvIHRoZSBkcml2ZXIgYWJvdXQgdGhlDQo+IGV4cGVjdGVk
IG1lbW9yeSB1c2FnZSBhbmQgcHRlIHVwZGF0ZSBwb2xpY3kgZm9yIGdwdXZtYS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEhpbWFsIFByYXNhZCBHaGltaXJheSA8aGltYWwucHJhc2FkLmdoaW1pcmF5
QGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIHwgOTcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
OTcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVf
ZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IDljMDg3MzhjM2I5MS4u
YWFmNTE1ZGYzYTgzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+
ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTgxLDYgKzgxLDcgQEAgZXh0
ZXJuICJDIiB7DQo+ICAgKiAgLSAmRFJNX0lPQ1RMX1hFX0VYRUMNCj4gICAqICAtICZEUk1fSU9D
VExfWEVfV0FJVF9VU0VSX0ZFTkNFDQo+ICAgKiAgLSAmRFJNX0lPQ1RMX1hFX09CU0VSVkFUSU9O
DQo+ICsgKiAgLSAmRFJNX0lPQ1RMX1hFX01BRFZJU0UNCj4gICAqLw0KPiAgDQo+ICAvKg0KPiBA
QCAtMTAyLDYgKzEwMyw3IEBAIGV4dGVybiAiQyIgew0KPiAgI2RlZmluZSBEUk1fWEVfRVhFQwkJ
CTB4MDkNCj4gICNkZWZpbmUgRFJNX1hFX1dBSVRfVVNFUl9GRU5DRQkJMHgwYQ0KPiAgI2RlZmlu
ZSBEUk1fWEVfT0JTRVJWQVRJT04JCTB4MGINCj4gKyNkZWZpbmUgRFJNX1hFX01BRFZJU0UJCQkw
eDBjDQo+ICANCj4gIC8qIE11c3QgYmUga2VwdCBjb21wYWN0IC0tIG5vIGhvbGVzICovDQo+ICAN
Cj4gQEAgLTExNyw2ICsxMTksNyBAQCBleHRlcm4gIkMiIHsNCj4gICNkZWZpbmUgRFJNX0lPQ1RM
X1hFX0VYRUMJCQlEUk1fSU9XKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfRVhFQywgc3RydWN0
IGRybV94ZV9leGVjKQ0KPiAgI2RlZmluZSBEUk1fSU9DVExfWEVfV0FJVF9VU0VSX0ZFTkNFCQlE
Uk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1dBSVRfVVNFUl9GRU5DRSwgc3RydWN0
IGRybV94ZV93YWl0X3VzZXJfZmVuY2UpDQo+ICAjZGVmaW5lIERSTV9JT0NUTF9YRV9PQlNFUlZB
VElPTgkJRFJNX0lPVyhEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX09CU0VSVkFUSU9OLCBzdHJ1
Y3QgZHJtX3hlX29ic2VydmF0aW9uX3BhcmFtKQ0KPiArI2RlZmluZSBEUk1fSU9DVExfWEVfTUFE
VklTRQkJCURSTV9JT1dSKERSTV9DT01NQU5EX0JBU0UgKyBEUk1fWEVfTUFEVklTRSwgc3RydWN0
IGRybV94ZV9tYWR2aXNlKQ0KPiAgDQo+ICAvKioNCj4gICAqIERPQzogWGUgSU9DVEwgRXh0ZW5z
aW9ucw0KPiBAQCAtMTk2NSw2ICsxOTY4LDEwMCBAQCBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2V1X3N0
YWxsIHsNCj4gIAlfX3U2NCBzYW1wbGluZ19yYXRlc1tdOw0KPiAgfTsNCj4gIA0KPiArc3RydWN0
IGRybV94ZV9tYWR2aXNlX29wcyB7DQo+ICsJLyoqIEBzdGFydDogc3RhcnQgb2YgdGhlIHZpcnR1
YWwgYWRkcmVzcyByYW5nZSAqLw0KPiArCV9fdTY0IHN0YXJ0Ow0KPiArDQo+ICsJLyoqIEBzaXpl
OiBzaXplIG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcmFuZ2UgKi8NCj4gKwlfX3U2NCByYW5nZTsN
Cj4gKw0KPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUVFJfUFJFRkVSUkVEX0xPQwkwDQo+ICsjZGVm
aW5lIERSTV9YRV9WTUFfQVRUUl9BVE9NSUMJCTENCj4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVFRS
X1BBVAkJMg0KDQpJbiBteSBvcGluaW9uIHdlIHNob3VsZCBkcm9wIERSTV9YRV9WTUFfQVRUUl9Q
QVQgYXMgd2UgY2FuIGFscmVhZHkgY2hhbmdlIHRoZSBQQVQgaW5kZXggYnkgdW5iaW5kaW5nIGFu
ZCBiaW5kaW5nIHRoZSBWTSB3aXRoIHRoZSB3YW50ZWQgUEFUIGluZGV4Lg0KU2ltaWxhciBmb3Ig
RFJNX1hFX1ZNQV9BVFRSX0FUT01JQyBhbmQgRFJNX1hFX1ZNQV9BVFRSX1BSRUZFUlJFRF9MT0Ms
IHdlIGNvdWxkIGhhdmUgdGhvc2UgcHJvcGVydGllcyBpbiB2bSBiaW5kIHVBUEkgYW5kIGlmIG5l
ZWRlZCB0byBjaGFuZ2Ugd2UgY291bGQNCnVuYmluZCBhbmQgYmluZCB0aGUgVk1BIHdpdGggdGhl
IHVwZGF0ZWQgYXR0cmlidXRlcy4NCg0KPiArI2RlZmluZSBEUk1fWEVfVk1BX0FUVFJfUFVSR0VB
QkxFX1NUQVRFCTMNCg0KTWVzYSBjYW4gbWFrZSB1c2Ugb2YgRFJNX1hFX1ZNQV9BVFRSX1BVUkdF
QUJMRV9TVEFURSBidXQgbm90IHRoZSBvdGhlciBvbmVzLCBzbyB5b3Ugd2lsbCBuZWVkIG90aGVy
IFVNRHMgdG8gbGFuZCB0aG9zZS4NCg0KPiArCS8qKiBAdHlwZTogdHlwZSBvZiBhdHRyaWJ1dGUg
Ki8NCj4gKwlfX3UzMiB0eXBlOw0KPiArDQo+ICsJLyoqIEBwYWQ6IE1CWiAqLw0KPiArCV9fdTMy
IHBhZDsNCj4gKw0KPiArCXVuaW9uIHsNCj4gKwkJc3RydWN0IHsNCj4gKyNkZWZpbmUgRFJNX1hF
X1ZNQV9BVE9NSUNfVU5ERUZJTkVECTANCj4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVE9NSUNfREVW
SUNFCTENCj4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9BVE9NSUNfR0xPQkFMCTINCj4gKyNkZWZpbmUg
RFJNX1hFX1ZNQV9BVE9NSUNfQ1BVCQkzDQo+ICsJCS8qKiBAdmFsOiB2YWx1ZSBvZiBhdG9taWMg
b3BlcmF0aW9uKi8NCj4gKwkJCV9fdTMyIHZhbDsNCj4gKw0KPiArCQkvKiogQHJlc2VydmVkOiBS
ZXNlcnZlZCAqLw0KPiArCQkJX191MzIgcmVzZXJ2ZWQ7DQo+ICsJCX0gYXRvbWljOw0KPiArDQo+
ICsJCXN0cnVjdCB7DQo+ICsjZGVmaW5lIERSTV9YRV9WTUFfUFVSR0VBQkxFX1NUQVRFX1dJTExO
RUVECTANCj4gKyNkZWZpbmUgRFJNX1hFX1ZNQV9QVVJHRUFCTEVfU1RBVEVfRE9OVE5FRUQJMQ0K
PiArI2RlZmluZSBEUk1fWEVfVk1BX1BVUkdFQUJMRV9TVEFURV9QVVJHRUQJMg0KPiArCQkvKiog
QHZhbDogdmFsdWUgZm9yIERSTV9YRV9WTUFfQVRUUl9QVVJHRUFCTEVfU1RBVEUgKi8NCj4gKwkJ
CV9fdTMyIHZhbDsNCj4gKw0KPiArCQkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiArCQkJ
X191MzIgcmVzZXJ2ZWQ7DQo+ICsJCX0gcHVyZ2Vfc3RhdGVfdmFsOw0KPiArDQo+ICsJCXN0cnVj
dCB7DQo+ICsJCQkvKiogQHBhdF9pbmRleCAqLw0KPiArCQkJX191MzIgdmFsOw0KPiArDQo+ICsJ
CQkvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiArCQkJX191MzIgcmVzZXJ2ZWQ7DQo+ICsJ
CX0gcGF0X2luZGV4Ow0KPiArDQo+ICsJCS8qKiBAcHJlZmVycmVkX21lbV9sb2M6IHByZWZlcnJl
ZCBtZW1vcnkgbG9jYXRpb24gKi8NCj4gKwkJc3RydWN0IHsNCj4gKwkJCV9fdTMyIGRldm1lbV9m
ZDsNCj4gKw0KPiArI2RlZmluZSBNSUdSQVRFX0FMTF9QQUdFUyAwDQo+ICsjZGVmaW5lIE1JR1JB
VEVfT05MWV9TWVNURU1fUEFHRVMgMQ0KPiArCQkJX191MzIgbWlncmF0aW9uX3BvbGljeTsNCj4g
KwkJfSBwcmVmZXJyZWRfbWVtX2xvYzsNCj4gKwl9Ow0KPiArDQo+ICsJLyoqIEByZXNlcnZlZDog
UmVzZXJ2ZWQgKi8NCj4gKwlfX3U2NCByZXNlcnZlZFsyXTsNCj4gK307DQo+ICsNCj4gKy8qKg0K
PiArICogc3RydWN0IGRybV94ZV9tYWR2aXNlIC0gSW5wdXQgb2YgJkRSTV9JT0NUTF9YRV9NQURW
SVNFDQo+ICsgKg0KPiArICogU2V0IG1lbW9yeSBhdHRyaWJ1dGVzIHRvIGEgdmlydHVhbCBhZGRy
ZXNzIHJhbmdlDQo+ICsgKi8NCj4gK3N0cnVjdCBkcm1feGVfbWFkdmlzZSB7DQo+ICsJLyoqIEBl
eHRlbnNpb25zOiBQb2ludGVyIHRvIHRoZSBmaXJzdCBleHRlbnNpb24gc3RydWN0LCBpZiBhbnkg
Ki8NCj4gKwlfX3U2NCBleHRlbnNpb25zOw0KPiArDQo+ICsJLyoqIEB2bV9pZDogdm1faWQgb2Yg
dGhlIHZpcnR1YWwgcmFuZ2UgKi8NCj4gKwlfX3UzMiB2bV9pZDsNCj4gKw0KPiArCS8qKiBAbnVt
X29wczogbnVtYmVyIG9mIG1hZHZpc2VzIGluIGlvY3RsICovDQo+ICsJX191MzIgbnVtX29wczsN
Cj4gKw0KPiArCXVuaW9uIHsNCj4gKwkJLyoqIEBvcHM6IHVzZWQgaWYgbnVtX29wcyA9PSAxICov
DQo+ICsJCXN0cnVjdCBkcm1feGVfbWFkdmlzZV9vcHMgb3BzOw0KPiArDQo+ICsJCS8qKg0KPiAr
CQkgKiBAdmVjdG9yX29mX29wczogdXNlcnB0ciB0byBhcnJheSBvZiBzdHJ1Y3QNCj4gKwkJICog
ZHJtX3hlX3ZtX21hZHZpc2Vfb3AgaWYgbnVtX29wcyA+IDENCj4gKwkJICovDQo+ICsJCV9fdTY0
IHZlY3Rvcl9vZl9vcHM7DQo+ICsJfTsNCj4gKw0KPiArCS8qKiBAcmVzZXJ2ZWQ6IFJlc2VydmVk
ICovDQo+ICsJX191NjQgcmVzZXJ2ZWRbMl07DQo+ICsNCj4gK307DQo+ICsNCj4gICNpZiBkZWZp
bmVkKF9fY3BsdXNwbHVzKQ0KPiAgfQ0KPiAgI2VuZGlmDQo=
