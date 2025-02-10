Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B95C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 07:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA4C10E4BC;
	Mon, 10 Feb 2025 07:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmboxMp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F1F10E4BC
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 07:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739173948; x=1770709948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=guRgloE2bj/e1H2nQQPlfkBI0MMphZyCC5N8Tt0+hFE=;
 b=WmboxMp456H0OToaEiqNsJzGlqxKa5Iu+HB+k6cOoYXReedaWbdWZ5Hy
 suuhm/+aqJQ6PcTa50dvOSME8ahrxY0KMko+eejRlQVyDszVkQB3vrjLg
 MPfddZ7PlWWP+ILbHPlvP/VZJCIW32PKSej/RUFmXOzJctBs5U6UfnCoS
 dSnBvLqJS5lJ35X5c+Jy/Ul0hiYIaw5sgDmn2wyUAtrDz6q4j+W3vE0IJ
 bY0Vwt1h5EDBOmp876qki1MtFIyVZ/yf7UuZBssnML5Ku2iU1QFWDEEcC
 RhawJGi2/Y3dV+Z+rIIExZpDWFwPPgqqpn2avUl7plRdolFaW2ZCYt4Jl A==;
X-CSE-ConnectionGUID: Wmp7A6RSQf6g7o/ITooxVw==
X-CSE-MsgGUID: jvOEO0YsRwSCgOw6P4Pmsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39427355"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="39427355"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 23:52:25 -0800
X-CSE-ConnectionGUID: JZnC+T6VTJuDRsJK9JOjCw==
X-CSE-MsgGUID: QhQxbCanTzCGwRtuCh0tPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142995505"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 23:52:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 23:52:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 23:52:23 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 23:52:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtV2Y61xi31aY4zG3B+JzcMSURJhb7ucfV+SAD0abqn7W27htQ8ycN//7De0fL/UQI03HB5xMprwy19+pyKdnb+0Cd7/5HwxwdH53y/tVAd56ZY6uqAKlD2UkGr8fshpdvNoi5o53y9Jn70rhICyEmvOgMQuqJuiimk7khFhCKRzk3ZGfmSSoMPaknBdpgzuUvhnLV3EBtEZ6g9iArtATjU++6KqpNd+H73SOSc3CQMxOWjRyAbmtJgBngK/i34az+tKgch7qowyk5KMHo1vZVSuTb67/JO7ujD5au1xf0eghR4wuJ+6UXG0M2oEdxwIqoVH+vuoC/QJg9iKP63qsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guRgloE2bj/e1H2nQQPlfkBI0MMphZyCC5N8Tt0+hFE=;
 b=juY3U5cEUO+0eUTYDIIalNHOLR2tZooKG9zxd4Sq0H0rA7VsYRAtVtqq6dG1q7/CNeOyJdPP8OISrMMg3pzRB+1Vne875V+BZyeWwgIl7ICGU3uTv/TVSwjtXet4jR0K/f5cGKqDMm10dgEmts9uMObDJw5jQlCT/3j6/GmrTuijgZ6VjGIACF7QlhjYz4ilHhlhiFm1SGWJ4r6ITZyxqVw9wS0zQ4NeurANOH58/le4MG2+MdGGO5UtQ8LWQG7+jroAfiOA1egrwji+G9SnRu5VWCKhsBizfc2mXzjPPDIeHiXC2cLTO/WYwNiJerXMkkL98b4scKbtVATh9t2AVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 07:51:53 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 07:51:52 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Winiarski, Michal"
 <michal.winiarski@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH 1/2] drm/xe/vf: Return EOPNOTSUPP for
 DRM_XE_DEVICE_QUERY_ENGINE_CYCLES if VF
Thread-Topic: [PATCH 1/2] drm/xe/vf: Return EOPNOTSUPP for
 DRM_XE_DEVICE_QUERY_ENGINE_CYCLES if VF
Thread-Index: AQHbeAKyJt8UT3BUgUm+dcSIRvla87NAMPWA
Date: Mon, 10 Feb 2025 07:51:52 +0000
Message-ID: <LV3PR11MB8695160ED15762C0DA4EC6C8F9F22@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250205191644.2550879-1-marcin.bernatowicz@linux.intel.com>
 <20250205191644.2550879-2-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250205191644.2550879-2-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|LV8PR11MB8559:EE_
x-ms-office365-filtering-correlation-id: d6f04213-be54-4c1c-66b7-08dd49a7c886
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RkdKMGJyVlhpUzh3ZlFTL3pLNFBkYUp0eTNJbVlMWlFCdC9JaWZ3NnpzaXBJ?=
 =?utf-8?B?eWIvbld6ZGF5YjV4VExIcXh4UGFZU0R5enp6UDVRM2FmUFhBZUh0TmdwTlc3?=
 =?utf-8?B?OEYzOC9iZ0ttQnUyQzh6Q3Ayb0c0SFNXNkJLTnpLWUNoWFYrU0lITTRLNkcy?=
 =?utf-8?B?aktTY0ZpYS9aTmJOb2VieXF5WDBCbVN1NE1SME5QUFJlRFpqSlNac1grK3hs?=
 =?utf-8?B?SXlXWjBTUVlWVlg3Tml6L2tvRGxVRjlOLzI3ZjJETjJWeHN4M1N0djBIRGNI?=
 =?utf-8?B?anh2eGFGRU5HOVBIMU5jc1gwbTRyTC8yWTR1Y1NNQy9FNjl2c2hGSzhHWGRG?=
 =?utf-8?B?d2o0ZTNOZ1JqMFVMd0d5bUkzbHFueU91Mk85cmxYV1laT0NZU2Y0VXkrR1Zp?=
 =?utf-8?B?MGVoMHplb0dnSXFvdWxUZGpkdGZ4L1dWL3RGS3V1QTJHZURYUytaMjZDa0RM?=
 =?utf-8?B?MXpsU0xRMnQyejdqekYzaEZHK2VxZ0tObXoxTlRza0pubDFmcG9SU2xqZU5i?=
 =?utf-8?B?WFdxWG42QldZQ3ZrNDJ6bW4rSUJVaW9xUTFPUGhIekpXR0g0em5iMm9VSys2?=
 =?utf-8?B?NDk0ZHQxZENkNndsaXdzUWg5cklLWHVwcnNxb0RlSlJmakpRK3dpS25mRWQ1?=
 =?utf-8?B?cHV6Z3M1NTU3NHZ4Y3RFTG9VWW81OUgzZWYveTM2Z2gvQWxtckhTN2llZHBM?=
 =?utf-8?B?QnFNRGliMS9Wa3BxcWpNQjI1ZEphY1UwV1NaQXF1cngvYlVSbk5xK0Rwc3hp?=
 =?utf-8?B?Y3RyNXZKTmNjeFpQSEJGcDZFbjdwbmVFcEFyQXlkSjJSVDkycTNTcVM2TTY0?=
 =?utf-8?B?Lzl1NFdhTkNvSjdDVm5id2JGUEtiSVhuU1M1R0t6c1BMRVFBTVN4RlFBTExk?=
 =?utf-8?B?WENPaGpFbDJTOWlpdUY0V3JPeFU0azF0TFpwRTBFWjhIVHp6M0lpc0k2L1R5?=
 =?utf-8?B?dC9BMHNoZGNXc3hac1hRdG45L0g2dzlXTkZuUjBkYnRYVjlkZWZlNGhXUk9D?=
 =?utf-8?B?b1EwWFdFSGtvZDVJNndKdmtpMUpDeTVVeHo0WGhSVGZ5Z2VHTWZpY3hCMHNm?=
 =?utf-8?B?TFl1bmRqWTQzTXdLaUtJTkhLZm5TMFc5Z1I4MWlQUU1aRllLSXJ3NWdoUnZ6?=
 =?utf-8?B?cnIxN0ljWnpDT0YyczRUNUd3dWRzZ0FQRnpBaTBhQjh0RHZKR1RzUHkrQjhS?=
 =?utf-8?B?b2I0TmxVYTVmVS9xR3VjTGFOWGZpMkphYXdEL1dhTTR5U0Zzb3h6Mi9PbWpQ?=
 =?utf-8?B?VUJGODh3VDNWR1cyekxOcjNCMnE3YVlFSlUyaU9FbWtCUS9OUlZTQWZvejhu?=
 =?utf-8?B?U25mMWhmeU5nUnRYZzhyRU03QWxnbUlTUEtsUEMxaGdJNlhYTUJIT3lNN0Nu?=
 =?utf-8?B?bHIxTHVlaVNva3dFVmlxd3prOEptOUxCNlBDV2tpMmFoRExCVUxMK3lQWVlI?=
 =?utf-8?B?czVVM2J4M3B2YkMreHlvVUhUeUJGWFlLUExGQXlSNm41WmlWK08wYy8wY3FY?=
 =?utf-8?B?RHNucEZqVU5pd25WL3N1bEdobzRMdXBXTldtTmJHUHlhZ1l5aXdXWCsveWo1?=
 =?utf-8?B?dDNyWHpyK1hzWEoyMGFpUXpkVlBhSEdZeDNaaEhZNmJ1ZzE0LzNSNTlxWUpt?=
 =?utf-8?B?Ty82WG5McS95aDFZbW9JRzhFY0VjVDZPZ01Lc1dPb0VnTGtaWEdLZHVlcDI2?=
 =?utf-8?B?Q1paZjlvTEgyS3M2NFZ0SmFrbVVmbDVWZmxmOXNJY21VbEhxNEV3Y0x0Uk9D?=
 =?utf-8?B?eUVqUXVUTmpPalR5TEJNNmlmaXlybGNhcFNkNEVBeTdFbU00d2twcVQxK1NK?=
 =?utf-8?B?bjB4UTB1Yjd5THpxdjR6bjNkUE5oZzZEaS9qZ2dVVThrTlhyWnJlR1B4eTZw?=
 =?utf-8?B?T2p6N3piaWNxaXVyVkRYLzRHVnJPWERCdG5sRlZLWUozMHpwVVdmYnVIbVUx?=
 =?utf-8?Q?7LzQU5reSLOkYW0mHF0keJgDgoKz4zfR?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU00Vy9BakowM1I1RCtZZTVBdTFRVjlYZ2d3Q1o4MmVxU0IrTWR6TEFOdUpH?=
 =?utf-8?B?UW5FNnhMSjd6dmlqbnNVSDJvcVVIY3IyMGhVRXpqMkRFWTU0NVk3Z2s3cVA2?=
 =?utf-8?B?YlFOY1FOZE90b0FSZVNmNjRRL01saFQ5NkhZSWJDT3c3ejZZeUNvM0s2TkpF?=
 =?utf-8?B?enJLak1QSDVHY2k2Si9aSjViLzJEZjJveitnLzh4d05Odzd4QWxmT251K09W?=
 =?utf-8?B?TTVBWHNmT2dVdk0yNzIvakcxY0U1cmtyRG8yUmVsQkRtRUlpbDZadnRNR2NZ?=
 =?utf-8?B?VUE3c0p6WHVQdUwrZHVOQ2ZnSjBkbjJqNWVHdDZvQ0gzKzI0ZWgxbmNBa0ox?=
 =?utf-8?B?M0I1S2pXUmhNenEyV1g3NjVBNzdTZjlJVTliUjhtczFMRlNXMnY2RkFRb3V0?=
 =?utf-8?B?Qm8zT2dBMDlXSit4UEtlYlU0Qm1oSUdwdkErWXVIZ2gwNG4ydVhyY1BWNDdx?=
 =?utf-8?B?SXBmRnpVU1h4eWxEZTFRbUF1aUg0UUFNK3dUcFFUTFZ0MThDM1o1OTFDNjJO?=
 =?utf-8?B?czBBZDJzcnNPRTBkQXRsSDZGc1V5dG9lQUZlV2MzQnFYdmVJYzdXWGtNMUd4?=
 =?utf-8?B?RGRmdXY5am82cmxWWGo5U3BQSTY2RSt6MUYrWWMya2Zyc0Fod3ZCa3lhckNl?=
 =?utf-8?B?dExFbDhGcTk3WDVBVjQ1TW1JSVBVOFlnUU93dWlKOGx5NDNQeTBjeVVjVlRE?=
 =?utf-8?B?bTQzVkJ4T2tVK0t2MGhxQkprT0pBaUFnUTJkWm42dUlNMDN2TURRZ29iVE5p?=
 =?utf-8?B?MGlwTVlHRmpJcSs5T0czbXFIcDVDM0RHZENtb2x3MVJlQ1V6TmRnY3p3NEpr?=
 =?utf-8?B?b3pCWGFaWEx3QXVDMlV4NXhhYlBqTjN0ZEk3ZzJTTzRRNE84RzRleDlWLzRP?=
 =?utf-8?B?TGhWUGFSWnRsK3YyWXA5QVlCV292Zm1Jd2p1UHpyc0wxd2tQZ1d2WDFyNWpu?=
 =?utf-8?B?cURzdEhvZ3FSWTF4OW5vMGdhSms2RFZrM1VrVXJscWgzWmptOFhyMUtqWmRq?=
 =?utf-8?B?ZCs4MnhqejFxR0xxVm9sb3BxNWh6MFVWNnBudHREVGh3ZzJMZDQwSVg4L1cy?=
 =?utf-8?B?WGVUMUhRTmF4ZFhLckpVdG9ra0ZpaURFTVhLOHB0Tk9pWGR4bVRkaHo5ejMv?=
 =?utf-8?B?RW90KzJRWDNzOWFkaDVFUmZYUmFXN1BWSzFoeTg1eUN1VjRMQndkYis5UEIy?=
 =?utf-8?B?aDlWZzlwQnVKTWhEbTQ3eTBSbjV5VUVlc1VuMFIvUHF3VjdPWnRWV1hEOHBI?=
 =?utf-8?B?eW9oTTFQU2JXWllqSWdXWTBaekVuQzRFejlYbHBPUEUzdm83WUJvUnhLZ3JB?=
 =?utf-8?B?Y1djei9SaWpKejlZbFUzeVZaTzdhUG1TM2d1eE1DZjM3SXVIQ3d4a0hhckhR?=
 =?utf-8?B?N0ZQc0hhZTJQaHpkTU9UVVdKZ0ZoTkh1TlNrTUx4cUg5a25mdEFrNVhaaUxz?=
 =?utf-8?B?VTFLQTZZZDRCV1pQTkhpejQxa3hYdzFhQzdXUHdFR3NCZllVam1sMDBKd0gz?=
 =?utf-8?B?cFZnRXh3Z0VJb2llSEVMYXJ4UHMrSWIzNDJLczUxbkk5bjBTQnZONVdmZkU5?=
 =?utf-8?B?YWN3cC9JUVdkeUZ2cW9pOG9LZjVGZ3NuMzRhV0l1R1RlWDg3bklUVEdxQ0lB?=
 =?utf-8?B?ZE5oVk5sb05NUEJaRXJBSEhmY0lsVUQvdkd3Y3hQN3ZLdlhhdHFKNXlRMkhl?=
 =?utf-8?B?K0xHaXRHcUIxK0pQZkdJejExOWZLOTd3VXIxcUJNV1VOYlppWnh2RTZTaHNF?=
 =?utf-8?B?M2FkZ3dMNW13RDdhKzNMUXQvY014ZHQzdlBmUDBHK3owaHlnTWV4dHo3UW80?=
 =?utf-8?B?R04rSVZuOS9aR1BXVDBlOXlXZWwrY3J0MmhSUHJKbElhQkkrZDBDbFNtdkZJ?=
 =?utf-8?B?c3JJa2V5T1V5RFg3SmIyK3lVVGN5R1dqeUk1OThWWmVKakl1T0lmbXo5cW4y?=
 =?utf-8?B?eEp4Q3BtZC9mL3NGRHVacnF3N04rY01oSjIvblFBUVQ2M1hhTy8ybHlZd0Jw?=
 =?utf-8?B?R2dZNG53TURHN0paVEw5SWUzYjhRa0lSbk5VWGh2UDhScklwNkFKNko2L2h3?=
 =?utf-8?B?QXJwZkNJS1JBMjMzcW5mZW14UFY4elR6Vmhpcys5d00rMUVDeG85MTUxRFBs?=
 =?utf-8?B?UktHSjhhN2U3cmZiMDJBWjZrYXFYSExObGF2U2VtRTZBM2x5VmgwWjlCek94?=
 =?utf-8?B?WVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f04213-be54-4c1c-66b7-08dd49a7c886
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 07:51:52.8662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jnSqLcFfttd45rek5o08+oUUk7OY5DQHr48M4eXSBPEDl7VK8OGsyb4veuo7we9rIFMJNk0xsHY4PBwJAxZDjrfIzHyFhp7HhIusJdnQY+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
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

SGkuDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLXhlIDxpbnRl
bC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1hcmNpbg0K
PiBCZXJuYXRvd2ljeg0KPiBTZW50OiBUaHVyc2RheSwgRmVicnVhcnkgNiwgMjAyNSAxMjo0NyBB
TQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBNYXJjaW4gQmVy
bmF0b3dpY3ogPG1hcmNpbi5iZXJuYXRvd2ljekBsaW51eC5pbnRlbC5jb20+OyBXYWpkZWN6a28s
DQo+IE1pY2hhbCA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+OyBXaW5pYXJza2ksIE1pY2hh
bA0KPiA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+OyBOZXJsaWdlIFJhbWFwcGEsIFVtZXNo
DQo+IDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0gg
MS8yXSBkcm0veGUvdmY6IFJldHVybiBFT1BOT1RTVVBQIGZvcg0KPiBEUk1fWEVfREVWSUNFX1FV
RVJZX0VOR0lORV9DWUNMRVMgaWYgVkYNCj4gDQo+IFJJTkdfVElNRVNUQU1QIHJlZ2lzdGVycyBh
cmUgbm90IGF2YWlsYWJsZSBmb3IgVkYgKFZpcnR1YWwgRnVuY3Rpb24pDQo+IGRyaXZlcnMuIFJl
dHVybiAtRU9QTk9UU1VQUCB3aGVuIHRoZQ0KPiBEUk1fWEVfREVWSUNFX1FVRVJZX0VOR0lORV9D
WUNMRVMNCj4gaW9jdGwgaXMgaW52b2tlZCBvbiBhIFZGIGRldmljZS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmNpbiBCZXJuYXRvd2ljeiA8bWFyY2luLmJlcm5hdG93aWN6QGxpbnV4LmludGVs
LmNvbT4NCj4gQ2M6IE1pY2hhbCBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29t
Pg0KPiBDYzogTWljaGHFgiBXaW5pYXJza2kgPG1pY2hhbC53aW5pYXJza2lAaW50ZWwuY29tPg0K
PiBDYzogVW1lc2ggTmVybGlnZSBSYW1hcHBhIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwu
Y29tPg0KPiAtLS0NCkxHVE0uIA0KUmV2aWV3ZWQtYnk6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNh
dHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1
ZXJ5LmMgfCAzICsrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gaW5kZXggMDQyZjg3YTY4OGU3Li5lYmZhZTc0NmY4NjEgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jDQo+IEBAIC0xMjEsNiArMTIxLDkgQEAgcXVlcnlfZW5n
aW5lX2N5Y2xlcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gIAlzdHJ1Y3QgeGVfZ3QgKmd0Ow0K
PiAgCXVuc2lnbmVkIGludCBmd19yZWY7DQo+IA0KPiArCWlmIChJU19TUklPVl9WRih4ZSkpDQo+
ICsJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gKw0KPiAgCWlmIChxdWVyeS0+c2l6ZSA9PSAwKSB7
DQo+ICAJCXF1ZXJ5LT5zaXplID0gc2l6ZTsNCj4gIAkJcmV0dXJuIDA7DQo+IC0tDQo+IDIuMzEu
MQ0KDQo=
