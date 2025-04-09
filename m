Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D9CC36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 21:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A9210E320;
	Wed,  9 Apr 2025 21:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8zdLG/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889BE10E320
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744233014; x=1775769014;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=vl3eXyuuWQmVCMNc/svn8874mavt8HSVK79ncQif0hM=;
 b=a8zdLG/6oT13iVbbnekCO+VyMnBJIOt1c5xf4534R3k1j4ROHtxbnUGZ
 ERsaFd2RpyD3iTe24FavP60159o0TC+zBRRXEmpQ8lYPGtfN2TT2kwv8c
 Yk5g+O/XFpaw7swly94X+fA3Lr+Sc7CpFlMmlNvqB6cy2gp3c9DuLMfYk
 v1qRiupk4VhT7RGCpIK9RxYSdwf1GMPXyv/QY4h780u7RixVaUPgeCVbT
 ffjepp6DGxfkZf6WqG6zpj9mZiyxkn2e/erCvPP+3zP9zg0PPG8ABH6vp
 keDS7Mpk73btLeB9ieYiaCiwoJ5Y1+nIpvNsx5dO6rTOrrywjUAk9iuzG A==;
X-CSE-ConnectionGUID: jBNM/G7gR2uMX0Wy6T8K1w==
X-CSE-MsgGUID: 07vycW3gRm+1+Ndehcmmmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="49392262"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208,217";a="49392262"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 14:10:13 -0700
X-CSE-ConnectionGUID: Jot1b8qFRxG85s+RZDtPKA==
X-CSE-MsgGUID: nLcgGCELQaOeP+QjDsqveA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
 d="scan'208,217";a="128443052"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 14:10:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 14:10:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 14:10:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 14:10:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lkz+jKg3cBL7U1QIofjY57gEt9wWPGrWi+9GYbhxsHj8JcWLqX62kAvzhwI0SUazWGJdN8gVECmMjEldhFmT69+RnSAGDQuEUCUXAHXrIsn81vvqxjDEe0z9HI9/Kw8xfg7Kg5Tlt+gGi2xlQSZEt1j+nyxpqPLAG2+vn7EDhC0iMtVoNxDfdCb0UDW4/9IJStDg3W/C4NaEBeslVKRHrpXZYPSaMTHAdwml9ajCT1+vvShZq67as759Ii9ZGBOlUqBpi4rGLB+2nOmDNfPbeyxngbZXADatXEY4PC3cjNUwXxGJIqWvghNIqKlTJyaG8uAfBnKAJgJoTcpcxlD3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jkdd8Xv1jtguzo7uh8+QiZtTpayOeX8XInOztvwnbuM=;
 b=cySKGHN5k0qKt/Xk7ZYCFbGqJDTsEbpAvizIF+5cJv3RffukROKpdBTuC6/6oin1lUlX7ayjE2NaNApKVqVEOEUk90ug1A6qPI0qQqQ3OmHqvGfZxS6yj/s+s2hRBicb40O00EeRvBQUHd2hgt3zLsrFQQlIyNucdzNHu5McxNzxwXVPt81BrCq97De2kovAFXpJoLPKYtPZWVdtrQqpAPEcMY5R+zpJQlDa8nuKrFZWtM9KWCnPRus3ipiuA+yPOJFM1QZO6HwZ/5oaKNco4m/pIA97JZc9oExDQUxb24DDxmheAKvWBQR+GNXW8np4Brim6Kdj8ePrs4EAhoMRWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 21:09:43 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 21:09:43 +0000
Content-Type: multipart/alternative;
 boundary="------------mdKxmwtal2CN1SCya056J6dj"
Message-ID: <d1c9b224-685b-4f1d-9776-f12131f15331@intel.com>
Date: Wed, 9 Apr 2025 23:09:38 +0200
User-Agent: Mozilla Thunderbird
From: "Lis, Tomasz" <tomasz.lis@intel.com>
Subject: Re: [PATCH v7 4/4] drm/xe/vf: Fixup CTB send buffer messages after
 migration
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
 <20250403184055.2317409-5-tomasz.lis@intel.com>
 <5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com>
Content-Language: en-US
In-Reply-To: <5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com>
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa67486-13ba-4c2f-39a6-08dd77aad96a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eCtHUGs3dmV4Y3F0YzlOb1llZS9ZVi9oQ3pnQjNXMEY2MXUxd0Q0M2xXZ0dK?=
 =?utf-8?B?NHR4bDN0dTVhZ3JYakxZWDBkRWNPV0FNSGx6U0VHeWtTcWhOTWcxcXlqeVdm?=
 =?utf-8?B?d2toTm1xbXdkTkNkanNtZGtIMkJUYzVvdDhBeFZ4R25CYUVFQ2o2TG5JNW9t?=
 =?utf-8?B?aGE3aVliZTBUV3EyRDg1TTNDeWZhNWRIMkZKNUR2Rm9zRlFhTzhpNzBxd2Ra?=
 =?utf-8?B?TytGN2RyRjlpU1N3dnBDOWlGK0ZacGVHem5HUW1kZk9iUDdNbmtaSzlIK1gv?=
 =?utf-8?B?RWkzVzF5V3B2bjd1L0M3V0pXUzR4QXNvTDh0VEpUaE5PamFPYWdIR042Rmhx?=
 =?utf-8?B?WWNZNVNkVmN3bU9pVE5oNm1Ua3BPa0dBdU9ERkVtOHFHQnh1RHhnMWYvKzZW?=
 =?utf-8?B?SXJCR25JQXRBNjBnd0k0cUh4ZzhPRGtISmZZZ2t2ZGRVMTZSOXRMdVFRU0R5?=
 =?utf-8?B?UkFRU0hSQ1g4bE1RWTQzRG9oVmY3QnpuZlVBbFpMT3NjYjg0TUNZS3o0a2NW?=
 =?utf-8?B?dHNiVytjd0h5WUVxckdpZmVBMVh0REpGMGhkTTNiZDJJclpFdnZSMWNkTmNU?=
 =?utf-8?B?ME5udXJyVExQbXMyYUpJdEpBRFl2N2ExUHY5Q2lDamlmQ3Y5a05HcU92M3Nh?=
 =?utf-8?B?aVRyYS9manZFN1dSNU1UdXNrbTVpV01kdVIzM0MyUU5reUZ4YmJHSEhKZmFw?=
 =?utf-8?B?bnVyVUlIY0licE1LZGVPRDFxM2xZYkhNTjRmY2Q4bWRXVGFQeVlpY0Izclpa?=
 =?utf-8?B?VHpqZEo5ZTJTV1J0di9uZFMwTjNnVFh2RldKUnNRdnRJSVNNQURTK1JHSkFm?=
 =?utf-8?B?aEFjakozWDlGektrSGxMUzFUWExaWWpqVUo5N0w4U2xValpmNmxmL0h6YWJM?=
 =?utf-8?B?K0Y4OFJ4K2NmZ250RG56d0JQMnpvTGkyUDh0QThxdHlUeWtYUXAyaTd1bzlm?=
 =?utf-8?B?Q0w0YnFwOFJOUEFmOTY3QXpFRjFjV091amVqd2dSNUlzc1M1ZGl2Skk1Zmsy?=
 =?utf-8?B?MWpMZE9obmZLTzNneVZ5ZTRVcnZXdjZGU2d6RElwQnNnYjM2Y2hOa2FsTWFz?=
 =?utf-8?B?Q2tWQ204c1hJR2V3K1FEVXl0YXgwRE10S01hM3Q1QnVlRVZaSTc2YTBxRDZi?=
 =?utf-8?B?TXJBRWlTbFRvbjVpMDUvOFI5aEk1dnpaVGxaSlhZRE00V0M0Z00xTktqTHVt?=
 =?utf-8?B?V2V3THZnVDBnKzUvUkhHanRpckQxZEp4enl1R1pyTlNKSkFCRXhvMys3dVcw?=
 =?utf-8?B?Q1l5ODdzdituME5QbnpnM241VkVCTHljeEEzcDd6SU1NU2dUVFlUSnd1L2tj?=
 =?utf-8?B?eG41Y3dLQW1Oemp5cTgzMm5BQml4SGk0TkdZQ3pmMVlVNGk5dXd4NVBkTDl1?=
 =?utf-8?B?Q2djMWFTeC9tK2dYTHoyczAybDM1NXI5ZFMyMTN4R215MmdaOGtySnV0ckw4?=
 =?utf-8?B?SzFnM2tPRkxMQ1p0YmMyekZzdzBxNVJWMEloQzFMS29wRFAwR2ZPbGJ4d3J3?=
 =?utf-8?B?RTRra1FHdHNudkc5azhaZC96alRMK3RHdUhORXhRdXdwTWpqT2FxUHU0enUr?=
 =?utf-8?B?STB5REM4djc3UmoyTXQ5L05Zc1hRMy9SSlhFVjQrWVUyZE1pczdEYldoSHZj?=
 =?utf-8?B?OGJrQU90aXgzRVIyaEpNMldnMVRWQ2ZHemQ3a2JqWFpMa3RacFZQNWN3Wkgw?=
 =?utf-8?B?dmlJNTVEREhEYlUwZzNyM1F0dlIyUlVMRGhDTVZYMys4ZXJ2aDc5NUNzY1RX?=
 =?utf-8?B?NXdoZHNrSzE0cEtRR1prQXBCM29EeDJTMldOYm9sUFdHeVhRRHRpVG5Vdm0v?=
 =?utf-8?B?NklaR3llb0NPY1Q2cFFMN1pmL28veWw1Slc3d1l1R1U4ZDIvOGZpUktOVFFm?=
 =?utf-8?Q?98nNtpDQ/JMB4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU0rdTNJVXR4ZmYxamgzT0VpbGdDbkRQMXZZTGZCOVJzM0t1YmlXVDhDa2dj?=
 =?utf-8?B?L2pFaDdNMmV1SHFtVFp2dHdGU3hFRDRzNUIvRk0zQzFKQUpFVkVSb3JQOFl3?=
 =?utf-8?B?UkxUWml2Vi9vLzFsRlRWcUp1elJDemtLZ25MZU1rOGt5NjNObXFxdEVOUDFZ?=
 =?utf-8?B?eCtKT0Y0cUVVaTV4c1JwSkNQWjZscWJFcjFlRkt3Wkd3VkV0bDFIbmMxZ3Ur?=
 =?utf-8?B?ejJaakQvVFNsN3NMMGIrQUo5bDJqYnRKTkJ3bDJHbVBadU16a2xzcTQzeUd1?=
 =?utf-8?B?cnpPZlVTQmpWK3pzdFg3Wk4rWWFhK2tuVm9jaUpLUHNjSFNpclpUb20vVFQ1?=
 =?utf-8?B?ZHRLOEtQWDFiNTZUazcrSEs0d1RMaDQxdGYrSTBRZ2EwaDVJNGFhK0lOQmFq?=
 =?utf-8?B?dDIrdXhyWDFZNVJrdURBM013U0pIVFdyNVVveFNOSnNIVFBYc1FRZkJoVmpN?=
 =?utf-8?B?ejB2dkJFZ0wrZUNwMUhEZUwzdjBWajZWeGU2MUxsRVpkeUx5YVNmS1NqblBH?=
 =?utf-8?B?VUQxU0ZGeWY4NG9PSlN1NWpqbnlJdnZLMmNoNFpRNmNIT0hUTlBLTkdKRlBl?=
 =?utf-8?B?V0h2cFU5dGx6OEpXTjBJNjVZMW9oYzJCNnhqaERBU25adG00QVVyNlNsYzVE?=
 =?utf-8?B?YnUxUmJSMy9GY0dtWmZNakg0RDNsNnFxcThFenEyVWJUak5iNW9LTFhHWVFn?=
 =?utf-8?B?SUJmTVFvUUNHNVBLNWNOVTY1WG1ibVhzN3RxbERsOEFMdVpFODdoWG00bGFP?=
 =?utf-8?B?L1BPTjRLYzUraVJ3SFUvOVZ4eDFlR3AxMzNmUW4vNUxzN3ArUUdOMytiWU45?=
 =?utf-8?B?VVRTZ2Ewa25NUU9Cb2NPVW1mb1FLVFNpMXl2bnJVeUNrY3RXUVRRdWZ0d1pl?=
 =?utf-8?B?U3BUWEJuR2cxZ3ZXQzNOZHlXVnNtQys1VXQ5RW02YWhMSDBPZ0lHdVBjZWkv?=
 =?utf-8?B?TStPOUlDNWhmQXRObzR3RitkbTkvRVd3Q0JvMDF4UkdnRnNMWDUrY1EvZWQr?=
 =?utf-8?B?K1JpT1hNNU8xSmhkTHNCMyt3SHNDRDFYY1ZHc0VEWlI1VFo1Mm9Qc0tJdzl6?=
 =?utf-8?B?aVhhcTdWNHdESUswUHBmaEtkYi9HQmxKN1ZvTTloWktQZG9RYU5teEZaZWcv?=
 =?utf-8?B?dDZLcTA0R1hKeGxLOW1JQ0p5WlpYU3lGWkNRdldIVUVSYW9VNTZ1RVVRUnlP?=
 =?utf-8?B?bFBkVTBIcTF1em9NZlB2SjNDTis0Nm9JdS9tZXo3OEVrVWtObXBjYTVPcmYx?=
 =?utf-8?B?elV6VUUraHpzZDJQSTM4Tlc1ZnNTVURyZ2ZiKzM0bktQd0ZjeWtOcmVPUHpq?=
 =?utf-8?B?UXNoVnNQbllSbmtGWUNBMkZUb0FJeHFlRmFobE03OUgrOVFObUJzd0RXS3dE?=
 =?utf-8?B?RE11TTlGSzVSWWQ5MW1Ub0cwQ0UxVXNPRy9tcTVpN1BoaTJiRWNHYXlkQmlw?=
 =?utf-8?B?STdLS3lEd2NDZHowemRhQm0vazVyd0s3cnNQcENzalhheEJzeW4yV1VNZkc2?=
 =?utf-8?B?RFRTV3MzS21hckxQSEhudkswc254Rk1Sd21qWHdNcmlVRGY1VmJxTWtmTG9S?=
 =?utf-8?B?Wjkxd09hRHMyNGd1RGxDeFYzd0g3ajgzQU5oZVIyYjgvb0pMYkFQZ3NSckhy?=
 =?utf-8?B?cEZ4czRDUkoxRmtURGZBc1FLU25reTB6aTVBT3E4MTdYdmk5QlpYTXhqZ1Ji?=
 =?utf-8?B?aER2M0JNT1hnMXRwd0NjWk1qMXViZzI2OFpIVWkrcW9hejNueUJlUkZ6UmUw?=
 =?utf-8?B?RzlmYnFwN2JKcjhaYm9ueUlXM2FRTWg3LzZweFUrSXhrR2o0bmRyWUQ0d1ht?=
 =?utf-8?B?K05CZEY1cUZ2OXhZdlgrWmMwdVQyOHRmczlBRWx3YkFZRXFTc3h0ZUd6Z1kz?=
 =?utf-8?B?dFJOeTBQTnZ2OUlKQzJ5TEVaSGdIRG5CZlU3Ulp5RXBaRGwvYW9kTXJDV0Jq?=
 =?utf-8?B?RWhCdjJ1d2NpWWpWR0dZOTU1U2hNUlZRTkVTZkZNSVN6THpsZ2ZzL2VrNXI5?=
 =?utf-8?B?eGF3cWEyL1FvcGRMTGs5UU1ISkFma2h1TzdGTmRIditXL3lCbmJqZ2IvZit3?=
 =?utf-8?B?em5DcGYxRVBYcjlBNnl1Rk5QT3NKSHVSVWV3NGVmN0lEaS9QU1dFQTVNZkdS?=
 =?utf-8?Q?Xjew8c/XuYwU26IpseMZUS2UL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa67486-13ba-4c2f-39a6-08dd77aad96a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 21:09:43.5192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibp3wvYhmboCzicXvvhDXQCVsSfHq6okN+G/SHoBGwtQWm+oQe59nEjVBnV2x4oZtcBjSxzai+kGOahcXk/dMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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

--------------mdKxmwtal2CN1SCya056J6dj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 08.04.2025 16:23, Michal Wajdeczko wrote:
> On 03.04.2025 20:40, Tomasz Lis wrote:
>> During post-migration recovery of a VF, it is necessary to update
>> GGTT references included in messages which are going to be sent
>> to GuC. GuC will start consuming messages after VF KMD will inform
>> it about fixups being done; before that, the VF KMD is expected
>> to update any H2G messages which are already in send buffer but
>> were not consumed by GuC.
>>
>> Only a small subset of messages allowed for VFs have GGTT references
>> in them. This patch adds the functionality to parse the CTB send
>> ring buffer and shift addresses contained within.
>>
>> While fixing the CTB content, ct->lock is not taken. This means
>> the only barrier taken remains GGTT address lock - which is ok,
>> because only requests with GGTT addresses matter, but it also means
>> tail changes can happen during the CTB fixups execution (which may
>> be ignored as any new messages will not have anything to fix).
>>
>> The GGTT address locking will be introduced in a future series.
>>
>> v2: removed storing shift as that's now done in VMA nodes patch;
>>    macros to inlines; warns to asserts; log messages fixes (Michal)
>> v3: removed inline keywords, enums for offsets in CTB messages,
>>    less error messages, if return unused then made functs void (Michal)
>> v4: update the cached head before starting fixups
>> v5: removed/updated comments, wrapped lines, converted assert into
>>    error, enums for offsets to separate patch, reused xe_map_rd
>> v6: define xe_map_*_array() macros, support CTB wrap which divides
>>    a message, updated comments, moved one function to an earlier patch
>>
>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c   | 147 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
>>   drivers/gpu/drm/xe/xe_map.h      |  12 +++
>>   drivers/gpu/drm/xe/xe_sriov_vf.c |  18 ++++
>>   4 files changed, 179 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 686fe664c20d..add2d9b12345 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -84,6 +84,8 @@ struct g2h_fence {
>>   	bool done;
>>   };
>>   
>> +#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>> +
>>   static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>>   {
>>   	g2h_fence->response_buffer = response_buffer;
>> @@ -1622,6 +1624,151 @@ static void g2h_worker_func(struct work_struct *w)
>>   	receive_g2h(ct);
>>   }
>>   
>> +static void xe_ring_map_fixup_u64(struct xe_device *xe, struct iosys_map *cmds,
>> +				  u32 size, u32 head, u32 pos, s64 shift)
>> +{
>> +	u32 hi, lo;
>> +	u64 offset;
>> +
>> +	lo = xe_map_rd_array_u32(xe, cmds, (head + pos) % size);
>> +	hi = xe_map_rd_array_u32(xe, cmds, (head + pos + 1) % size);
>> +	offset = make_u64(hi, lo);
>> +	offset += shift;
>> +	lo = lower_32_bits(offset);
>> +	hi = upper_32_bits(offset);
>> +	xe_map_wr_array_u32(xe, cmds, (head + pos) % size, lo);
>> +	xe_map_wr_array_u32(xe, cmds, (head + pos + 1) % size, hi);
>> +}
>> +
>> +/*
>> + * Shift any GGTT addresses within a single message left within CTB from
>> + * before post-migration recovery.
>> + * @ct: pointer to CT struct of the target GuC
>> + * @cmds: iomap buffer containing CT messages
>> + * @head: start of the target message within the buffer
>> + * @len: length of the target message
>> + * @size: size of the commands buffer
>> + * @shift: the address shift to be added to each GGTT reference
>> + */
>> +static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
> s/ct_update_addresses_in_message/ct_fixup_ggtt_in_message
ok
>> +					   struct iosys_map *cmds, u32 head,
>> +					   u32 len, u32 size, s64 shift)
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 action, i, n;
>> +	u32 msg[1];
> 	u32 msg;
> or
> 	u32 msg[GUC_HXG_MSG_MIN_LEN];
I want an array, so will go with 2nd. Though this looks like unjustified 
obfuscation to me.
>> +
>> +	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
>> +			   1 * sizeof(u32));
> please use helpers that you already have:
>
> 	msg[0] = xe_map_rd_array_u32(xe, cmds, head);
ok
>> +	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
>> +	switch (action) {
>> +	case XE_GUC_ACTION_REGISTER_CONTEXT:
> maybe don't super-optimize by hand and just do those 3x fixups here,
> using related XE_GUC_REGISTER_CONTEXT_DATA_xxx definitions?
>
> it looks weird to have 2x "case" statements and then "if (case)" anyway,
> plus mixed enums that just accidentally points to the same offsets

will separate cases. The optimizing compiler will merge them anyway, I 
did one to avoid introducing more barely used enums.

(the ones we introduced in last round)

>> +	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
>> +		xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
>> +				 shift);
>> +		xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
>> +				 shift);
>> +		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
>> +			n = xe_map_rd_array_u32(xe, cmds, head +
>> +				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS);
>> +			for (i = 0; i < n; i++)
>> +				xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +					    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
>> +					    + 2 * i, shift);
>> +		} else {
>> +			xe_ring_map_fixup_u64(xe, cmds, size, head,
>> +					      XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
> s/ct_update_addresses_in_buffer/ct_fixup_ggtt_in_buffer
ok
>> +					 struct guc_ctb *h2g,
> nit: this is redundant
oh I see. by "this" you mean a spaced out separate line.
>> +					 s64 shift, u32 *mhead, s32 avail)
> can you describe what is this mhead?
this is a static function. but ok, will describe its parameters.
>> +{
>> +	struct xe_device *xe = ct_to_xe(ct);
>> +	u32 head = *mhead;
>> +	u32 size = h2g->info.size;
>> +	u32 msg[1];
> 	u32 msg;
> or
> 	u32 msg[GUC_CTB_MSG_MIN_LEN];
> 	
>> +	u32 len;
> please try to order vars in rev-xmas-tree
ok
>> +
>> +	/* Read header */
> you should at least assert that avail > 0 before reading even single u32
>
> 	xe_gt_assert(gt, avail >= GUC_CTB_MSG_MIN_LEN);
This is a static function, and the caller is ensuring that. But sure, I 
can add the assert.
> but since it is called in the loop, more appropriate would be:
>
> 	if (avail < GUC_CTB_MSG_MIN_LEN)
> 		goto broken;

I don't know what you mean by that. There are not that many 
possibilities for an integer value greater than 0 but smaller than 1.

And by the changes I agreed to above and below, we've already ensured 
that GUC_CTB_MSG_MIN_LEN can only be equal to 1.

>> +	xe_map_memcpy_from(xe, msg, &h2g->cmds, sizeof(u32) * head,
>> +			   sizeof(u32));
> 	msg[0] = xe_map_rd_array_u32(xe, cmds, head);
ok
>> +	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>> +
>> +	if (unlikely(len > (u32)avail)) {
>> +		xe_gt_err(ct_to_gt(ct), "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
>> +			  avail, len);
>> +		return 0;
>> +	}
>> +
>> +	head = (head + 1) % size;
> maybe don't update head here as you need to reverse it two lines below?
That value is never being changed again.
> and this magic "1" is GUC_CTB_MSG_MIN_LEN
ok
>> +	ct_update_addresses_in_message(ct, &h2g->cmds, head, len - 1, size, shift);
> msg_len_to_hxg_len() instead of "len - 1" ?
wow, we have a helper even decrementing length? ok, will use.
>> +	*mhead = (head + len - 1) % size;
> maybe it's time to introduce
>
> 	u32 move_head(u32 head, u32 step, u32 size)
We are overdefining a lot of things already. I don't think we should 
press even harder in that direction.
>> +
>> +	return avail - len;
>> +}
>> +
>> +/**
>> + * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
>> + * @ct: pointer to CT struct of the target GuC
>> + * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
>> + *
>> + * Messages in guc-to-host CTB are owned by GuC and any fixups in them
>> + * are made by GuC. But content of the host-to-guc CTB is owned by the
>> + * KMD, so fixups to GGTT references in any pending messages need to be
>> + * applied here.
> s/guc-to-host/H2G
>
> like you have earlier and below
Earlier is a short description. Below I am using shortcut after defining 
it in this line. This is how the long comments should look like, 
abbreviations should be defined.
>> + * This function updates GGTT offsets in payloads of pending H2G CTB
>> + * messages (messages which were not consumed by GuC before the VF got
>> + * paused).
>> + */
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
>> +{
>> +	struct xe_guc *guc = ct_to_guc(ct);
>> +	struct xe_gt *gt = guc_to_gt(guc);
>> +	struct guc_ctb *h2g = &ct->ctbs.h2g;
>> +	u32 head, tail, size;
>> +	s32 avail;
> early exit if shift == 0 ?

There is no need for such optimizations.

-Tomasz

>> +
>> +	if (unlikely(h2g->info.broken))
>> +		return;
>> +
>> +	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
>> +	head = h2g->info.head;
>> +	tail = READ_ONCE(h2g->info.tail);
>> +	size = h2g->info.size;
>> +
>> +	if (unlikely(head > size))
>> +		goto corrupted;
>> +
>> +	if (unlikely(tail >= size))
>> +		goto corrupted;
>> +
>> +	avail = tail - head;
>> +
>> +	/* beware of buffer wrap case */
>> +	if (unlikely(avail < 0))
>> +		avail += size;
>> +	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
>> +	xe_gt_assert(gt, avail >= 0);
>> +
>> +	while (avail > 0)
>> +		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &head, avail);
>> +
>> +	return;
>> +
>> +corrupted:
>> +	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
>> +		 head, tail, size);
>> +	h2g->info.broken = true;
>> +}
>> +
>>   static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>>   							bool want_ctb)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 82c4ae458dda..5649bda82823 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>>   void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>>   void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>>   
>> +void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
>> +
>>   static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
>>   {
>>   	return ct->state == XE_GUC_CT_STATE_ENABLED;
>> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
>> index f62e0c8b67ab..db98c8fb121f 100644
>> --- a/drivers/gpu/drm/xe/xe_map.h
>> +++ b/drivers/gpu/drm/xe/xe_map.h
>> @@ -78,6 +78,18 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
>>   	iosys_map_wr(map__, offset__, type__, val__);			\
>>   })
>>   
>> +#define xe_map_rd_array(xe__, map__, index__, type__)			\
>> +	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
>> +
>> +#define xe_map_wr_array(xe__, map__, index__, type__, val__)		\
>> +	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
>> +
>> +#define xe_map_rd_array_u32(xe__, map__, index__)			\
>> +	xe_map_rd_array(xe__, map__, index__, u32)
>> +
>> +#define xe_map_wr_array_u32(xe__, map__, index__, val__)		\
>> +	xe_map_wr_array(xe__, map__, index__, u32, val__)
>> +
>>   #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
>>   	struct xe_device *__xe = xe__;					\
>>   	xe_device_assert_mem_access(__xe);				\
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index e70f1ceabbb3..2674fa948fda 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -10,6 +10,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_printk.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_guc_ct.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_printk.h"
>> @@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
>>   	return ret;
>>   }
>>   
>> +static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	unsigned int id;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +
>> +	for_each_gt(gt, xe, id) {
>> +		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
>> +
>> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>> +	}
>> +}
>> +
>>   /*
>>    * vf_post_migration_imminent - Check if post-restore recovery is coming.
>>    * @xe: the &xe_device struct instance
>> @@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>>   
>>   	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>>   	/* FIXME: add the recovery steps */
>> +	if (need_fixups)
>> +		vf_post_migration_fixup_ctb(xe);
>> +
>>   	vf_post_migration_notify_resfix_done(xe);
>>   	xe_pm_runtime_put(xe);
>>   	drm_notice(&xe->drm, "migration recovery ended\n");
--------------mdKxmwtal2CN1SCya056J6dj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 08.04.2025 16:23, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <pre wrap="" class="moz-quote-pre">On 03.04.2025 20:40, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">During post-migration recovery of a VF, it is necessary to update
GGTT references included in messages which are going to be sent
to GuC. GuC will start consuming messages after VF KMD will inform
it about fixups being done; before that, the VF KMD is expected
to update any H2G messages which are already in send buffer but
were not consumed by GuC.

Only a small subset of messages allowed for VFs have GGTT references
in them. This patch adds the functionality to parse the CTB send
ring buffer and shift addresses contained within.

While fixing the CTB content, ct-&gt;lock is not taken. This means
the only barrier taken remains GGTT address lock - which is ok,
because only requests with GGTT addresses matter, but it also means
tail changes can happen during the CTB fixups execution (which may
be ignored as any new messages will not have anything to fix).

The GGTT address locking will be introduced in a future series.

v2: removed storing shift as that's now done in VMA nodes patch;
  macros to inlines; warns to asserts; log messages fixes (Michal)
v3: removed inline keywords, enums for offsets in CTB messages,
  less error messages, if return unused then made functs void (Michal)
v4: update the cached head before starting fixups
v5: removed/updated comments, wrapped lines, converted assert into
  error, enums for offsets to separate patch, reused xe_map_rd
v6: define xe_map_*_array() macros, support CTB wrap which divides
  a message, updated comments, moved one function to an earlier patch

Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_ct.c   | 147 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h   |   2 +
 drivers/gpu/drm/xe/xe_map.h      |  12 +++
 drivers/gpu/drm/xe/xe_sriov_vf.c |  18 ++++
 4 files changed, 179 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 686fe664c20d..add2d9b12345 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -84,6 +84,8 @@ struct g2h_fence {
 	bool done;
 };
 
+#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) &lt;&lt; 32 | (u32)(lo)))
+
 static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
 {
 	g2h_fence-&gt;response_buffer = response_buffer;
@@ -1622,6 +1624,151 @@ static void g2h_worker_func(struct work_struct *w)
 	receive_g2h(ct);
 }
 
+static void xe_ring_map_fixup_u64(struct xe_device *xe, struct iosys_map *cmds,
+				  u32 size, u32 head, u32 pos, s64 shift)
+{
+	u32 hi, lo;
+	u64 offset;
+
+	lo = xe_map_rd_array_u32(xe, cmds, (head + pos) % size);
+	hi = xe_map_rd_array_u32(xe, cmds, (head + pos + 1) % size);
+	offset = make_u64(hi, lo);
+	offset += shift;
+	lo = lower_32_bits(offset);
+	hi = upper_32_bits(offset);
+	xe_map_wr_array_u32(xe, cmds, (head + pos) % size, lo);
+	xe_map_wr_array_u32(xe, cmds, (head + pos + 1) % size, hi);
+}
+
+/*
+ * Shift any GGTT addresses within a single message left within CTB from
+ * before post-migration recovery.
+ * @ct: pointer to CT struct of the target GuC
+ * @cmds: iomap buffer containing CT messages
+ * @head: start of the target message within the buffer
+ * @len: length of the target message
+ * @size: size of the commands buffer
+ * @shift: the address shift to be added to each GGTT reference
+ */
+static void ct_update_addresses_in_message(struct xe_guc_ct *ct,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">s/ct_update_addresses_in_message/ct_fixup_ggtt_in_message</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+					   struct iosys_map *cmds, u32 head,
+					   u32 len, u32 size, s64 shift)
+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 action, i, n;
+	u32 msg[1];
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">	u32 msg;
or
	u32 msg[GUC_HXG_MSG_MIN_LEN];</pre>
    </blockquote>
    I want an array, so will go with 2nd. Though this looks like
    unjustified obfuscation to me.<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	xe_map_memcpy_from(xe, msg, cmds, head * sizeof(u32),
+			   1 * sizeof(u32));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">please use helpers that you already have:

	msg[0] = xe_map_rd_array_u32(xe, cmds, head);</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
+	switch (action) {
+	case XE_GUC_ACTION_REGISTER_CONTEXT:
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">maybe don't super-optimize by hand and just do those 3x fixups here,
using related XE_GUC_REGISTER_CONTEXT_DATA_xxx definitions?

it looks weird to have 2x &quot;case&quot; statements and then &quot;if (case)&quot; anyway,
plus mixed enums that just accidentally points to the same offsets</pre>
    </blockquote>
    <p>will separate cases. The optimizing compiler will merge them
      anyway, I did one to avoid introducing more barely used enums.</p>
    <p>(the ones we introduced in last round)<br>
    </p>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
+				 shift);
+		xe_ring_map_fixup_u64(xe, cmds, size, head,
+				 XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
+				 shift);
+		if (action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC) {
+			n = xe_map_rd_array_u32(xe, cmds, head +
+				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS);
+			for (i = 0; i &lt; n; i++)
+				xe_ring_map_fixup_u64(xe, cmds, size, head,
+					    XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
+					    + 2 * i, shift);
+		} else {
+			xe_ring_map_fixup_u64(xe, cmds, size, head,
+					      XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static int ct_update_addresses_in_buffer(struct xe_guc_ct *ct,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">s/ct_update_addresses_in_buffer/ct_fixup_ggtt_in_buffer</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+					 struct guc_ctb *h2g,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">nit: this is redundant</pre>
    </blockquote>
    oh I see. by &quot;this&quot; you mean a spaced out separate line.<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+					 s64 shift, u32 *mhead, s32 avail)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">can you describe what is this mhead?</pre>
    </blockquote>
    this is a static function. but ok, will describe its parameters.<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+{
+	struct xe_device *xe = ct_to_xe(ct);
+	u32 head = *mhead;
+	u32 size = h2g-&gt;info.size;
+	u32 msg[1];
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">	u32 msg;
or
	u32 msg[GUC_CTB_MSG_MIN_LEN];
	
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	u32 len;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">please try to order vars in rev-xmas-tree</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	/* Read header */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">you should at least assert that avail &gt; 0 before reading even single u32

	xe_gt_assert(gt, avail &gt;= GUC_CTB_MSG_MIN_LEN);</pre>
    </blockquote>
    This is a static function, and the caller is ensuring that. But
    sure, I can add the assert.<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <pre wrap="" class="moz-quote-pre">but since it is called in the loop, more appropriate would be:

	if (avail &lt; GUC_CTB_MSG_MIN_LEN)
		goto broken;</pre>
    </blockquote>
    <p>I don't know what you mean by that. There are not that many
      possibilities for an integer value greater than 0 but smaller than
      1.</p>
    <p>And by the changes I agreed to above and below, we've already
      ensured that <span style="white-space: pre-wrap">GUC_CTB_MSG_MIN_LEN can only be equal to 1.</span></p>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	xe_map_memcpy_from(xe, msg, &amp;h2g-&gt;cmds, sizeof(u32) * head,
+			   sizeof(u32));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">	msg[0] = xe_map_rd_array_u32(xe, cmds, head);</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
+
+	if (unlikely(len &gt; (u32)avail)) {
+		xe_gt_err(ct_to_gt(ct), &quot;H2G channel broken on read, avail=%d, len=%d, fixups skipped\n&quot;,
+			  avail, len);
+		return 0;
+	}
+
+	head = (head + 1) % size;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">maybe don't update head here as you need to reverse it two lines below?</pre>
    </blockquote>
    That value is never being changed again.<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <pre wrap="" class="moz-quote-pre">and this magic &quot;1&quot; is GUC_CTB_MSG_MIN_LEN</pre>
    </blockquote>
    ok<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	ct_update_addresses_in_message(ct, &amp;h2g-&gt;cmds, head, len - 1, size, shift);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">msg_len_to_hxg_len() instead of &quot;len - 1&quot; ?</pre>
    </blockquote>
    wow, we have a helper even decrementing length? ok, will use.<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	*mhead = (head + len - 1) % size;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">maybe it's time to introduce

	u32 move_head(u32 head, u32 step, u32 size)</pre>
    </blockquote>
    We are overdefining a lot of things already. I don't think we should
    press even harder in that direction.<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	return avail - len;
+}
+
+/**
+ * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
+ * @ct: pointer to CT struct of the target GuC
+ * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
+ *
+ * Messages in guc-to-host CTB are owned by GuC and any fixups in them
+ * are made by GuC. But content of the host-to-guc CTB is owned by the
+ * KMD, so fixups to GGTT references in any pending messages need to be
+ * applied here.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">s/guc-to-host/H2G

like you have earlier and below</pre>
    </blockquote>
    Earlier is a short description. Below I am using shortcut after
    defining it in this line. This is how the long comments should look
    like, abbreviations should be defined.<br>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * This function updates GGTT offsets in payloads of pending H2G CTB
+ * messages (messages which were not consumed by GuC before the VF got
+ * paused).
+ */
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
+{
+	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct guc_ctb *h2g = &amp;ct-&gt;ctbs.h2g;
+	u32 head, tail, size;
+	s32 avail;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">early exit if shift == 0 ?</pre>
    </blockquote>
    <p>There is no need for such optimizations.</p>
    <p>-Tomasz<br>
    </p>
    <blockquote type="cite" cite="mid:5fe9853a-59df-4cbd-8e3f-4ee015178238@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+
+	if (unlikely(h2g-&gt;info.broken))
+		return;
+
+	h2g-&gt;info.head = desc_read(ct_to_xe(ct), h2g, head);
+	head = h2g-&gt;info.head;
+	tail = READ_ONCE(h2g-&gt;info.tail);
+	size = h2g-&gt;info.size;
+
+	if (unlikely(head &gt; size))
+		goto corrupted;
+
+	if (unlikely(tail &gt;= size))
+		goto corrupted;
+
+	avail = tail - head;
+
+	/* beware of buffer wrap case */
+	if (unlikely(avail &lt; 0))
+		avail += size;
+	xe_gt_dbg(gt, &quot;available %d (%u:%u:%u)\n&quot;, avail, head, tail, size);
+	xe_gt_assert(gt, avail &gt;= 0);
+
+	while (avail &gt; 0)
+		avail = ct_update_addresses_in_buffer(ct, h2g, ggtt_shift, &amp;head, avail);
+
+	return;
+
+corrupted:
+	xe_gt_err(gt, &quot;Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n&quot;,
+		 head, tail, size);
+	h2g-&gt;info.broken = true;
+}
+
 static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
 							bool want_ctb)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 82c4ae458dda..5649bda82823 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -22,6 +22,8 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
 void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
 void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
 
+void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
+
 static inline bool xe_guc_ct_enabled(struct xe_guc_ct *ct)
 {
 	return ct-&gt;state == XE_GUC_CT_STATE_ENABLED;
diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
index f62e0c8b67ab..db98c8fb121f 100644
--- a/drivers/gpu/drm/xe/xe_map.h
+++ b/drivers/gpu/drm/xe/xe_map.h
@@ -78,6 +78,18 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
 	iosys_map_wr(map__, offset__, type__, val__);			\
 })
 
+#define xe_map_rd_array(xe__, map__, index__, type__)			\
+	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
+
+#define xe_map_wr_array(xe__, map__, index__, type__, val__)		\
+	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
+
+#define xe_map_rd_array_u32(xe__, map__, index__)			\
+	xe_map_rd_array(xe__, map__, index__, u32)
+
+#define xe_map_wr_array_u32(xe__, map__, index__, val__)		\
+	xe_map_wr_array(xe__, map__, index__, u32, val__)
+
 #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
 	struct xe_device *__xe = xe__;					\
 	xe_device_assert_mem_access(__xe);				\
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index e70f1ceabbb3..2674fa948fda 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -10,6 +10,7 @@
 #include &quot;xe_gt.h&quot;
 #include &quot;xe_gt_sriov_printk.h&quot;
 #include &quot;xe_gt_sriov_vf.h&quot;
+#include &quot;xe_guc_ct.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_sriov_printk.h&quot;
@@ -158,6 +159,20 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void vf_post_migration_fixup_ctb(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+
+	for_each_gt(gt, xe, id) {
+		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
+
+		xe_guc_ct_fixup_messages_with_ggtt(&amp;gt-&gt;uc.guc.ct, shift);
+	}
+}
+
 /*
  * vf_post_migration_imminent - Check if post-restore recovery is coming.
  * @xe: the &amp;xe_device struct instance
@@ -224,6 +239,9 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
+	if (need_fixups)
+		vf_post_migration_fixup_ctb(xe);
+
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&amp;xe-&gt;drm, &quot;migration recovery ended\n&quot;);
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------mdKxmwtal2CN1SCya056J6dj--
