Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FC0C5AD49
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 00:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D0910E254;
	Wed,  4 Jun 2025 00:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWqSJ9H7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648D010E254
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 00:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748996019; x=1780532019;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h6zBPgy+DEyB2xg/RvOoTo2+mvyMINgZ1Tp7/2Z160w=;
 b=HWqSJ9H7dIQxy3v+cWgXCv+VaHu8Yz6IIODi9gqM1RvNybC5gbmUok9W
 I+m05qF7m1tuz/JoVasfjFGkXwV/of2LHNSglAty3B1xGEFvZTpUetX4g
 55Xxe4GjNpwVjg3zc9tB5WrKTlWd3/f11gTKaSn83zf6Tv66ZyibNCz5W
 FBW8bMS+8NpBU6gj32ZUtWSgALJF2DBAvH72Vx/cPq+Jd795lKcWmYlrV
 OMYEuelxsHpv0fyfHHGqnP+pWlFhouhwkqKL+NrweE2H5/VTibeznXCcP
 iQds8m8bkP65eMZxbL14m6FzfLk2Q5oRsqpY6Qh8CqEGvW+EorTqqH3MH Q==;
X-CSE-ConnectionGUID: xH5qBb0GQB26Sen4HUO7EA==
X-CSE-MsgGUID: Z1gUYm1xSFSUXBT5uSqfKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51202897"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="51202897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:13:39 -0700
X-CSE-ConnectionGUID: bacZIyI2TpSWL3OeJwx2vg==
X-CSE-MsgGUID: +Rvb4Tt2Ryam13Z2aivStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145992561"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 17:13:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 17:13:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 17:13:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.63) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 17:13:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNNCgS7INUJA3Z6lvP5LiQX2SoX+B8dJD8IrsZblCV+XVPZMP4qfq/TiqYtWyCDQ8ilt72Rd1bEXEUe3rR59/Cqi5jIlb2fA7v+xxRDPoXJeV8XSwxwKLO4dI2JmDOYoIhi8Jdm19bs/EZv6vvdMyvNlg5PfnzE5XERw/8IUFn48MmbQAsDqVBeH0kcQb1+FJGweRZGndA28zpbPGy2t2/xyyksl+1+P6q/rVPi+mhIErUJg7yFlNdwRi5tJ8C/BUlAVHTiaDWb36b56P3GQPBfonJSAWeHxTkb7lP7yydQP4W/IBOvJPeB0rW2B+pCD9ANuwoZUBhQrL6/eDSsqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6zBPgy+DEyB2xg/RvOoTo2+mvyMINgZ1Tp7/2Z160w=;
 b=CIzbsoTu/OMD8MHv4cbbQz4wwj+ByNUTmdnseFIOOmpzWs5z+KDVQSBgPvtRboCw9SsDjVHBXG2v/GW++aDOQE12z9FYa7iEX0mChqGTTY842Mnd0Nkb5uNDN9unUWYU96J4bSxsYVLM+AJwrcyPymeIxoUIgfkKN0nhCHOI3+A82n5VB9qta6DKenRJvzW3zdhVRJfHo2VZPyldwFpjWS59Vd1X+2ckxCNa5c4PF2jYzglwlpxMWD1sasjFhTzUEzooapx8yyjWdOb4es86fio4AVU2jCRzzyFvnmH9ci8oaRGUGPvzFx8rtc2zX73z/i9hsdrmemhQsV01TF2jlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.20; Wed, 4 Jun 2025 00:12:50 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 00:12:50 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Move xe_root_tile_mmio() to xe_device.h
Thread-Topic: [PATCH 1/4] drm/xe: Move xe_root_tile_mmio() to xe_device.h
Thread-Index: AQHb1MYrLtJFFPkou06G1+tdrUPturPyIUCA
Date: Wed, 4 Jun 2025 00:12:49 +0000
Message-ID: <eb14616bb45ee258c53d2d8c7fcafec79c620a37.camel@intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
 <20250603202826.681-2-michal.wajdeczko@intel.com>
In-Reply-To: <20250603202826.681-2-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA0PR11MB7356:EE_
x-ms-office365-filtering-correlation-id: f90ee178-ca70-41c5-2c1c-08dda2fc8ac3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V1EyQjJYcm5TTG9qYlA1OTA2Y2FXSEZSbTU4bkUxZklVei9qWEpqdmRJc0ND?=
 =?utf-8?B?Zm1zTUZRbHhoQmJQU3F1VGhSYm11eFUzM3BNellwV2FQZUdxU016UjhMZjds?=
 =?utf-8?B?UGErUmhWczd6U1I4NWRIam5RbldMKy9RaWFYWkM1endYNmZYWnpPQ3BjckpW?=
 =?utf-8?B?M3lKaldNQ1djMi9iNzA5KzJ3QnJaYXY3WFYyRjg3b0hnMnd0MHJ6OHJRc1Ft?=
 =?utf-8?B?clJLMmhPaHUvS21hb0xWQmNvbmU1dnE0YUtJNFRaWHV6NUF1eEEyL2oweU1x?=
 =?utf-8?B?MDlOQmY5YnI2Ym94TmQzL1VsTHlnMU5IbWg0RWlGb1l5N090NWFlaXQwNFJQ?=
 =?utf-8?B?anFyZGdaYXo1Q3VtUVBYSDNjWUwyR2tDMWRHK0RSWVhyeDU2dm0vVExjYXZK?=
 =?utf-8?B?a00wQ0loOFdUUS84dC9Wd3hoUTZlVG9XVmgraG4rMzhOUllqV1p0RERYNDhO?=
 =?utf-8?B?RVFqWndvMnQ2eElTdTIvcWZnYjlhNHlMYTRsWWJKdkFrWC9iZFY1UU8rSUNG?=
 =?utf-8?B?R0c5VlFCWVdteml0ZUJvdjNMWGtQckM3SXRYcHFVYnJRZHZuUkxxejkwNm4v?=
 =?utf-8?B?VGpDNXJhYTl6ZktSV3pxeW9VNHpZTDhmYm9Fai9xQ09kbHpWcnozdFBUUE0w?=
 =?utf-8?B?ZGtWMk5Fa1pBMzVsckZWckZ1N2Q1ck9kb2dBYTIwK2xxZmM1M0NrZVlEeXps?=
 =?utf-8?B?Q1dlanZPeEtMK2NCYXFjVElNT2poSVJWcWhmelBGT081RmF4L2ljWWlmZ1hD?=
 =?utf-8?B?bFNjREpsaVBnRURMY3ZhQkZoWjFtblRETGdCZjM1bFFCN2d6anJKRC92WTcr?=
 =?utf-8?B?ODU2cThxNi9QNVU5NVQ3NTlhTFRjZFZKMG9GQ0RrVHhwWjdkeFRBSFNiOUY2?=
 =?utf-8?B?WEkrVGFTNk5ueVI2Rml6Y0UvMjM4cWc2OUovaTIrL2NxQS9sMWhaWW9KSTA5?=
 =?utf-8?B?L0N2OE9Tb3psVUNRbWcrUWFhRFhIYmhyZ3ZHSGVTL2ZDN3puVE9hVjN3aWFj?=
 =?utf-8?B?bFJwN2poWGI1RGFSaUlMWWhOWjFDd3l4bmxNSnpPMmEwN0hoVWpLNmdRNUx4?=
 =?utf-8?B?RDI5TEhHZEtaZWdweWdaTm1jNlF2ZFpRYlpRZGNCeWpZdFdnZmp1THJzSUox?=
 =?utf-8?B?NlllNk91dS9ESHRMbmhYN0VsUDg3aXRFaVJVVXZURmZTcE1qeUZSZk1aMm1n?=
 =?utf-8?B?VWhtSnJrNEprMlYwOTVMYk50K1MxTnRCa05SRVJFSVRCazM3Qnd3L3RFN2FI?=
 =?utf-8?B?a2Z6Nk0rN2syWUFIYjdOQ2NKVkFJOUJyc1ZJV3FXQ1VuM1dURExQcXF4eU9z?=
 =?utf-8?B?ZXdLN05ZREtiUHNiWCtGM2dMYk9kNFRDRmFqYkFBb2hHRWpQc1VaaWpwSzc1?=
 =?utf-8?B?NVV0NEZLWVZxUFRNNTVzTmo0ejNXSHZiNmVVY2xYeDJyTFBSZWtnN1hKU0tE?=
 =?utf-8?B?dFVCVmR1QTNhblZLcStvSUpaVEZ4eSt3b1hvZ0JHSjd1WFhtdW1pSzBpSUs4?=
 =?utf-8?B?WWp3aGY4S084dCtta1JQazkvbjZta0F6emdIYldWdVRNS1ZqcGdOTEJqOElV?=
 =?utf-8?B?T2EvZDdVcFk3T3FMUisrS1pkdUZRSjRma2I0OUtiWnVJL1gwMzRZK3ZtY3Bu?=
 =?utf-8?B?bWZ4K0lMVVRzUlN6UkVwalVDRTUwZm4rQ1Y1ZkgwUlVzQWlmSlhQMEI3NmhK?=
 =?utf-8?B?ckZEKy9CL2hlTlhIZ2RNN29kMGIzSEpUTDN3alFwNkxJMkxidE9QTXNpWmxa?=
 =?utf-8?B?TjBCVk5uMDV3R3BGdUFISmtnQ29ZVEthUzk0dFlqc0RBclkxV3lTeVI0amlK?=
 =?utf-8?B?b1cvNlpqV0N2MCtzRXplbU54S24rQXltUStIWGhkYUg3a1JoMGtDZEhWenJl?=
 =?utf-8?B?ZTVXWSthQ3JtN2RtNlRqUVNmUk9ZanhRSHZBL0p3RXBVancxL2ZGNGRXLyty?=
 =?utf-8?B?VWNxZ0xObEd2ZWMyY2p2alV6R2FJL0QvRXRYc0hkT05PV3RxNzRXVmFjd0p6?=
 =?utf-8?B?eXV0emV1bkZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUs5QmhreUR1a3gxM3c3T3M3YnE2NnpzQ0FVVkk5ZmkwbVVUeE5PL2syaEtj?=
 =?utf-8?B?RDB5WmRIdmNoajhmbThMSys0dmVQTVhFaDlvTFpGR2RTWEdxK2J6cHQ4a2Vh?=
 =?utf-8?B?VDJCZU1hOXNSWDZJdVNZZ3FmMXRDa0JYcThWaHlERmxhWDdBdjZpeG1EOE9w?=
 =?utf-8?B?RjBoRUdjcWxwbDR0YTF4ZlM0SmkzTHVGRkt4WkVRQ2NYbk9URSs4NDQ1K0lG?=
 =?utf-8?B?emlHU3p5aE44a2xCRHNIK1hNbmU3RklxYkFCZ0lqYjFIN2lWaGJXd0tLMk5C?=
 =?utf-8?B?VmJ1L0NSYzRSTTNzd1Q2Ylc1MjZ5cSsxK0x2ZjA5NnovRHhPakJ4M0JJUk9X?=
 =?utf-8?B?NkNqcnFWdE1kTDNUYTIydkFwejVwQlNJNUErVkJiMm4yVklFSm5ETUpGb2JL?=
 =?utf-8?B?dlN4bzNQbmR1QnhoQ1lacmFaMXA1NHExa0luYUJjRVlOL1hQSFBpS0Z0WDZr?=
 =?utf-8?B?ajErNy9lbC8wNDEwM0hYcEk2bExsS1d6RGNZaVhMMnoxcjdveDRKY3dKeWhi?=
 =?utf-8?B?UGdESW9kdGNBaFo5eU5pTW9DaWxkMXRJZHFETU9Ca2Fna016NmhtRDNMWHZz?=
 =?utf-8?B?TkhpWmwxeCtyRWovYnhMcE9KSStaZXVhRkVtV1JDTmRVOS9tdmdnbnRMYTR6?=
 =?utf-8?B?aDBpckZaWkNBeWdCMXdEcU5FU1h3U2JyUUdLTzNvM3FYNXhPNGw1aHRvR0lV?=
 =?utf-8?B?R3pPbktWeGJVbzgxN3NXTHdDb0szc1AwcTVsWHFFYTFRNFNwTHZaRi9MRW9q?=
 =?utf-8?B?VzZ4K2hocVFIUWI3NWhRYVQ0QVd4bTA4RWREUmhzSkRRc092eWFYbG1zTXRm?=
 =?utf-8?B?ZCtUV2dSMk9ZYjRGaWhNb2VWbGN4SnF4SUwyajc5SGFPTHYyZUhJQVZUQzV4?=
 =?utf-8?B?Sm5YaGJWUTNxUUM1Y3l1dlpHRXo3SXNjTmRvdVlmcC9xZEEza21hdDlxSkRT?=
 =?utf-8?B?YWFpR1J4YVRyMWJqb2FON2VDc2NrWVFEdDlRKzZNd0d1T2JjVVJkWFZoZG5J?=
 =?utf-8?B?SXZnRTRPQmNDRFQ3YlU0UXdhM3FmVG1xbGZGa3ZhSnZZaWN4RXpTVDBmTG40?=
 =?utf-8?B?YWlFNUc3VFlVTm10OFpyOVZzTUN5UHZ6QVpFMTRKeWxSTUJTajM5Z0tuMTR4?=
 =?utf-8?B?MmduWWV6MlNCZ21pYTQzbnNGMjFkV2daK3NNaWoxZ3F5L0ZOaG43MG5BZWFZ?=
 =?utf-8?B?cWFKeGtaZkJsaU8yMUN4ZVptaXdNSE1qd0JRSVZzbU4rbFgvS1RUY0FreE1F?=
 =?utf-8?B?MXdBdGlBREVORHBGYzl1Qldad2NPWnZJcHpyTm9iWnh5T1NObEF0Y2N5Mk1T?=
 =?utf-8?B?VHA3Uks3dFJ1NC9TdmNIQXB5U2RvZ3Q1N1ZYV3JOYjIxcWVzTHlSeUdCZDdq?=
 =?utf-8?B?Sm12SG5YSkVBVUhiWGdGbzVWTjBVcHJOTUxBWHNkZWtkajhMSnA5MFpCRXM2?=
 =?utf-8?B?b0FpZnpEU1pJdCs4UlNqam9zcnp0NzZPNy9mMVVZMHhsam9QM1BEK0xNT3hS?=
 =?utf-8?B?N3QvOTlOSXRRc0FiUXg1WE85SkNwZWNJbTVxcTJSRkxBbXorWHJPWCt5S3M0?=
 =?utf-8?B?bHJEZ3I2QTFMMlR3YzdEVEs0cTFFV01sYjBmTDBHSzJrT3RycjdXMzVEVWZI?=
 =?utf-8?B?Z2ZaYlBucjdyYXZDckl1aWVaa205QXprNVRnOHlncFFzRjUrcitzQmNoRzFt?=
 =?utf-8?B?K2ZsdnZKYTNoUHBMa01uNmdiUzcxRFNhMWFtTSt2Z1NFN2F6L0tsVHpzaGNU?=
 =?utf-8?B?RTN1SnNINkIyNHU2cW41NnNrSXI1T3c2OEdLY3QvbTVXbTUySnBNYXpJcWM5?=
 =?utf-8?B?bmtKWkY5OFFMWHM0Nk94M3pxZEx2Q1dqNXdxZ296TnBOUEhZM1lLU3dwc3p2?=
 =?utf-8?B?VnFML3hTR3Q2MXJBVXp6ZnUzRkcvcXVYV2UyTlRBVUZocVAzQjhxNHRWK2J6?=
 =?utf-8?B?QUlIUS9lTWpBRitpSzVJdVFFRjVLMW8wdncyYnpHYURHaWZaTUV1TEtpTTFS?=
 =?utf-8?B?ZjJQY0xqQ2FTcm03THBkZ3Q3WjJsS0xXaC9aOTZYSHRRNEo4UGZ6U3Bzekor?=
 =?utf-8?B?a3hXYmNveC9adW1DOXYxaGZPQWRCU2Yya1VaRHNKMUZMK25PZ2lIaCtjNXRt?=
 =?utf-8?B?dTA1aU80cnQrREpUTnVVdlZNS1BKYzAzc2huN0RIY3hpZHNZRk5zOFMwLzcr?=
 =?utf-8?B?V0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A0B5CAE99AADC4E975FC128B321BC80@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90ee178-ca70-41c5-2c1c-08dda2fc8ac3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 00:12:49.9769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ogy7c1JpxMmtAWe1oEdwhxX/gu4SPtXjbzHMOXz/VZ0BisZ6GDl0MgpaydG8cFJ3P0h1aW37bb7LfIg5S+U9F6tAYaK/wZSBOf8IG4vq90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

T24gVHVlLCAyMDI1LTA2LTAzIGF0IDIyOjI4ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiBJdCBzZWVtcyB0byBiZSBhIGJldHRlciBwbGFjZSBmb3IgdGhpcyBoZWxwZXIgZnVuY3Rp
b24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVj
emtvQGludGVsLmNvbT4NCj4gQ2M6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50
ZWwuY29tPg0KPiBDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCg0K
V291bGQgYmUgbmljZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gbWVudGlvbiB0aGlzIGlzIGJl
Y2F1c2UgdGhlIHJlc3QNCm9mIHRoZSBtbWlvIHN0cnVjdHVyZXMgYXJlIHBlci10aWxlLiBUaGF0
IHNhaWQsIHdoeSBub3QgbW92ZQ0KeGVfbW1pb19wcm9iZV9lYXJseSBhbmQgeGVfbW1pb19wcm9i
ZV90aWxlcyBhdCB0aGUgc2FtZSB0aW1lIGZvciBhDQpzaW1pbGFyIHJlYXNvbj8NCg0KUmV2aWV3
ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQoNCj4gLS0t
DQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oIHwgNSArKysrKw0KPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9tbWlvLmjCoMKgIHwgNSAtLS0tLQ0KPiDCoDIgZmlsZXMgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9k
ZXZpY2UuaA0KPiBpbmRleCAwYmMzYmM4ZTY4MDMuLjg4NGU4ZTRmZGRiZiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2UuaA0KPiBAQCAtMTE3LDYgKzExNywxMSBAQCBzdGF0aWMgaW5saW5lIHN0
cnVjdCB4ZV9ndA0KPiAqeGVfcm9vdF9tbWlvX2d0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0KPiDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuIHhlX2RldmljZV9nZXRfcm9vdF90aWxlKHhlKS0+cHJpbWFy
eV9ndDsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZV9tbWlvICp4ZV9y
b290X3RpbGVfbW1pbyhzdHJ1Y3QgeGVfZGV2aWNlDQo+ICp4ZSkNCj4gK3sNCj4gK8KgwqDCoMKg
wqDCoMKgcmV0dXJuICZ4ZS0+dGlsZXNbMF0ubW1pbzsNCj4gK30NCj4gKw0KPiDCoHN0YXRpYyBp
bmxpbmUgYm9vbCB4ZV9kZXZpY2VfdWNfZW5hYmxlZChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4g
wqB7DQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gIXhlLT5pbmZvLmZvcmNlX2V4ZWNsaXN0Ow0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21taW8uaA0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9tbWlvLmgNCj4gaW5kZXggYzE1MWJhNTY5MDAzLi41NDBiYWRlMjQ3OTAg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmgNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX21taW8uaA0KPiBAQCAtMzcsOSArMzcsNCBAQCBzdGF0aWMgaW5s
aW5lIHUzMiB4ZV9tbWlvX2FkanVzdGVkX2FkZHIoY29uc3QNCj4gc3RydWN0IHhlX21taW8gKm1t
aW8sIHUzMiBhZGRyKQ0KPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGFkZHI7DQo+IMKgfQ0KPiDC
oA0KPiAtc3RhdGljIGlubGluZSBzdHJ1Y3QgeGVfbW1pbyAqeGVfcm9vdF90aWxlX21taW8oc3Ry
dWN0IHhlX2RldmljZQ0KPiAqeGUpDQo+IC17DQo+IC3CoMKgwqDCoMKgwqDCoHJldHVybiAmeGUt
PnRpbGVzWzBdLm1taW87DQo+IC19DQo+IC0NCj4gwqAjZW5kaWYNCg0K
