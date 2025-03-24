Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6161BC36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 15:03:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BED10E3BD;
	Mon, 24 Mar 2025 15:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdT6yWPc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1C110E2D8;
 Mon, 24 Mar 2025 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742828602; x=1774364602;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gUQQfNrbuNm89tv2V0t89P5drHYqwKgBnSg359Bh8O0=;
 b=fdT6yWPcTU4y93ihLK3XGA817lRnwppoE7OBqQbKz62bPGxWmZ3WI6TN
 i+mUAANlvx+H+05vm2wLT1XTV2ygAAKjmpvWWjXmKO5XkHvLZR38ZaaE+
 +/A+SUftnxVSw0ND4weA3POno5fpIRObH+tvvvi9Sl+KCLGmLTU3H6R9g
 8plagd6wfV7mAEsI42lNUcVthoSqKAfIswLvywvNVzW6pFR0VgatsoyLS
 GByefdYA1ukasEAraexsTGT9Z0ACkI9XCpGds4sbur5ZYlDKxage5pvCA
 6raVvrm4XusplltRkJP4jHUNesoZUuXEzaxQYyGjHMJmkJBcCe6PtLmzI w==;
X-CSE-ConnectionGUID: Ne+FiZuZRGifcTsHMZoUjw==
X-CSE-MsgGUID: nsXgjXmqRziMFKT2lmV3hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43275907"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="43275907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:03:20 -0700
X-CSE-ConnectionGUID: W7p5516BSouW9iCtnQVlcw==
X-CSE-MsgGUID: 1x8CX3xxTEuI6XTkcUJKBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="154977471"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:03:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 08:03:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 08:03:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 08:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=htLaC130LQbO20T4b/rk4gXDL0LbjC2qvAHUXlJxWrlFHbd1clERbqIQi/mpAOtak09OdgXZiHtF12GJ+OTXfF5LWYtvH8EqpLQW5i/W+oG6fXqVJaJ1zDKHCN1HtJXGHKp+A84TjFeSNhJX30LQLVJQi6el+fPhXdcaH5VR1W8/j16PgGpUX1UpXUpFRGVx1v83j4TIewJdp1OCHyZtCztnNmX2XZxYvfY00VcVp7wjVgvhfG0S2UawRsNIEmxasYC3MfJOnaMaK+0dfeZcry6RDSqXP6EAcfF7AeD8x8Z0T/Ow7LaKaZ6bZvj9YXdYhv24l7JqWHUyG56TeigZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95chZo5fc+MnL0O7h4WsI99GP5uTJ8I0Zh9Z1KNBjaE=;
 b=Qy5HOQdOErPBpc4NQfYKrko9RHFm12JkfmQ3SmS8YB6A29K/bfOkAweKCclfIWya+0P6pnwj6OOxO19XjEcFuaWuV4iANn+ul7VbXX1CvBuGTNJIHyJW+p3qBd3+l8jWElf1sgNQXYTmY56AAyWU4SapwR2fQ0g21M+Q0cCPm1W8dnL3vshCBoF44jFFig9n9WYaEmR6BTKqlWpSbtkMDLeT9btFTnJ9adcwP3a3naCUDen7X7V6BLPrJ3b7DLc/KtSWOHtkCBRVuj/yU1AJTqS33j+iBGMorwqEopB0wNR2xtAAJkz/BE8JguAfz7Hw6XYcONqt5XLZcfMQaEdyMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 15:03:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 15:03:16 +0000
Date: Mon, 24 Mar 2025 10:03:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, <i915-ci-infra@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGRybS94ZS9o?=
 =?utf-8?Q?w=5Fengine=5Fclass=5Fsysfs?= =?utf-8?Q?=3A?= Allow to inject error
 during probe (rev2)
Message-ID: <vdf34l3ivwahsa3fp57jdn27huodlxidtsthardb556t5o5dho@cyioizg5leuf>
References: <20250314105050.636983-1-francois.dugast@intel.com>
 <174198921965.37342.16553574591723215462@18a75f3d1eae>
 <Z-FuEPOop3bZUjY3@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-FuEPOop3bZUjY3@intel.com>
X-ClientProxiedBy: MW4PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:303:8e::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: fa4ea006-1663-45ed-e78d-08dd6ae501a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTV0VlNuUEZFa21QUWl0L0kyakdQMEhnWWx0M0s3RHNXQ3FvK0RiVWlmdHZ6?=
 =?utf-8?B?WFcyaGc0VklGcldsN01EQzU3Ym1MbHRYN3hDelo0S09NSW1JWlQxVi9jMFlB?=
 =?utf-8?B?UE1QVEw3aDRtSnoyeU1nSmtBYjlNcVZ3R3NWTmVmSXZScXdDRFBaaVFlMkJC?=
 =?utf-8?B?LzhUdVJNc1JGcGg4N1lWZUN5bkhCN0ZCcU5sVllCMUViOWxjSCtzQTNSY3VD?=
 =?utf-8?B?UHh3aDNDaFBTOUVqVll3NSs5dnoyTWNCUnd6YkRRUmZVMWlFUVFUV3g1VWJs?=
 =?utf-8?B?N2pBdUhEZmJwS1g0cVptWTZrMU1MVEJGcjkrY2M4cXE5UytIaXdtQzNReEo0?=
 =?utf-8?B?UUdYTTljUUlkUUJpeGRxbzQrdk1Xb1BOOXFyaFFDa1JXME9oYWV1c0lZU2Vw?=
 =?utf-8?B?RWxIZjdzcWZieGdhWDhQNFVsajlMMVRQSHlCaktJTHFOQ05QS1R5RkhyNjVH?=
 =?utf-8?B?UnlPZW13a29BMW4xQm94RmUySlZEK2VvLzJNS3BQbERxU01rT0FnWDRBd3g3?=
 =?utf-8?B?bWFiaTNueGsvNWFpK3FWTEN1SUtIWUZaTE5uMVZkVlh4djIyb08vUFVOelpu?=
 =?utf-8?B?dTduMW1tNmlHd1M1YWNNQ0JqclJ4SDNsWG5Ra2tYRHI4aDJjVFhFclRhKzVw?=
 =?utf-8?B?ZVdxZGI3bSswSXlEWlhLMGg3ckMzWms1MkpvMzlzU0xWTkMyUG9VR1I5bmhN?=
 =?utf-8?B?c2g1R2xjU3JXUituWXl1UzRIYytVNytMYm9CcDVOeEsxRkRSeW9zbG1mK1d2?=
 =?utf-8?B?Q0s4MnhBTVljVHdBeVVJZE5GaGo3MTBMV3JUTHhPSFptQkNnTFdkb3QyRVpE?=
 =?utf-8?B?WER6R3Q3UnpRMEFUZTNsQi9BTlArZkhaWnUxMzlFQWxuUHhsVitqMVEvdkZ6?=
 =?utf-8?B?ZmlRdnBScUJ5ZjJZR0s2RzkzSWViWWg4Skh5S0kzcjNJQ0N4YmpKZVp6cWR1?=
 =?utf-8?B?VXRMcnEvSzdQeWNGd2JVckNPQ1huaWhOZkh6QWlPRnJxaU5wWlM3K0xsdXpa?=
 =?utf-8?B?eXQ0WmFiTHR2QlBHeGRXL0hpRnY2QXhZYkhCV0lTeGp4S0Y1OVlIQTBKd041?=
 =?utf-8?B?eHM4eDQzeHM2VUFKSEYzbDR6ZGJtQjZUYkthZ1JtK2NIUTUwUTY1L2VUWHpp?=
 =?utf-8?B?VnIxNFoyNTRjZjBjOVFUK3dnaWN1aXpiVDVNRjVWa1hqcmVGWFRyeEh4Y3k4?=
 =?utf-8?B?ZnBqTzQrTzBiSTVjenBaa3pHTmt6c1ltN0FLZ0xrYUlaOHFmQ0pFb0orejJy?=
 =?utf-8?B?Q0t3L0luc0hndFNkQlJoWnpLYktqbmRzNUNvTkwzMW9MS3pjM3JYQnFwZm1S?=
 =?utf-8?B?SEFaRUlzSktPSFVCVWRPL2pkTERKNVFZdnZqUmlSZitNSkplSmVBWmtYdEdQ?=
 =?utf-8?B?UEFxVVRKUUpnQzZrd0NLZHFFYlFxeVZEQTdna21UZHVRQXI2RnBoMHZtRnE4?=
 =?utf-8?B?cDU2bzFxRFdjbFB4Vy93dk90SGxwa1lvaWt6ZEk2SXo2NVR3SEQ1UDlybTdm?=
 =?utf-8?B?NmdRTitPcWdYL3F5d2hDb3c0dDZKY24yOFNiOGgrdGNUMFlRYnA5MXAvQjVW?=
 =?utf-8?B?UkRUUHhMZjkxcGUzQ0Zicm9CNEYzc0tkcWdhNEFhNWhCK3BIYUZmNFFCU25X?=
 =?utf-8?B?VWJhTE0rdm90RDhhT0NaQ3QrVFJwWFlwbEVrK25veXNJa2VhSm91OGlNR01h?=
 =?utf-8?B?a3lVajl5RGN5c1Z3cXJTbEVOUnhjVURIWklMWldqbGdZRTVqd3NGTllINTZX?=
 =?utf-8?B?MUhRRk1yRTNPVzd0VWtTZk8xTmkrZlVMQXpuV1dBbldoRTlQWXh4eXl2OTlS?=
 =?utf-8?B?Vk5OS3prWXdUSHVHaVBBSThjZnBRUWhPSW5aUDFSVXpoNE1HeDAxbG8zZ0d0?=
 =?utf-8?Q?ZYJUSKqeyNh+W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVVCVEdGalZZSXJ5SFh6N3Fyc1BmN09tbG12eS90YmlGOGJRQjhia1BCTUFI?=
 =?utf-8?B?Q0hldGlnbXgxZ0svMDUwbDd3VXdhcnoxb1A0bUR1YmVINlJISFJvOURkeStz?=
 =?utf-8?B?TEcxUDUzbW9YR2FiV1dBVlpIZ0J2bEF4c0c5R0JXenRabTN5MmRLV1kwOWFQ?=
 =?utf-8?B?OWpuSTZhQkxUWTlpcWZHN21VeW94cUpsR1Mwdm10dGg1bzVaa1I0TEZmN3Jw?=
 =?utf-8?B?aVo3d3A0cHhxRng0UnhCSENjb0RZWElYNFZyVWZKcmZOY2FVdys2ZisvUUhx?=
 =?utf-8?B?M1dkU05BaUdHOXg5Z2g4UmtaakN6ekdpT2JVdjJ5RkdKU2JTN0FKL0w2SDVD?=
 =?utf-8?B?YUlJeDNMRnVSUmEwZkM0S3ZPNEE5UGxYZ3NERUoxWTV3MzNMQSt0R2Z6OUdv?=
 =?utf-8?B?bWYyT2Q1NXJEN1pvS3BVQXNOQU5vb0pxNFhvNVd4MGtVazlaMW1tK1RNZ1Vs?=
 =?utf-8?B?RWZhaG04SUwxQVlsKy9jOEZFVEYxZnozYTlUQTMzeU1lamFZNld0YnY4S2pl?=
 =?utf-8?B?eDB3Y3NXUy95TUt3anJZY25DU1pjYUErMlNYZjE3NitWTXZhdWIwUC9pR0Np?=
 =?utf-8?B?bFBsMjdLTVhxSnh1Z3pEcVFXQ2lQWWN4R2NoR25OeHdzbllYMXpFajU0Z3JH?=
 =?utf-8?B?Y21rYjV0Tm80MGlmM1lKOE5zamxIVlhZVnZTbmU2QmNXQzVEeENFdklPT2Zh?=
 =?utf-8?B?Z1JmaFJNNnpucDRTSU5raFd2ZXpUSzdwdm5QeVdCT0g5WEpJWFlzMzZybmFJ?=
 =?utf-8?B?eTNNamZHVE9UZmF6SW9uand6dkcrb0UyWS9YdGR1NW8zUkFkNzZkTS93M3kz?=
 =?utf-8?B?bTg0d1BCenNnMGhLNXo1czdPSU1XbUQ1UnF0dVFSZVFIN2lpZEpwWXd6czhJ?=
 =?utf-8?B?MDhJNE9XdHdQdUx1dER1TVQ2R2RYSzR6UzRJbk9lajZRWTcrbk4wcTFQQS9I?=
 =?utf-8?B?ZUJidUNFRkMzeSsrYzRSOUloeU4yQlJERFpPbHNOdldmUlZxalFlME9VMExT?=
 =?utf-8?B?NHZRaXByT1ZTWEw0TmNzenRUb1hGcEVYK0ZZWjEwdGltSGQ0MnVGZmw1UUlG?=
 =?utf-8?B?VGZHeHlvN0NEa2xpeWdQOUpaSkFoMy9hVWdWV241MnhkK1IxQWRlbnp3MGEx?=
 =?utf-8?B?eEgzek1IZXBxalJRVVQxMytQQ1NZTWRMVzUzbldtdmwrQlpUQWk4T0xKRTJK?=
 =?utf-8?B?L3N3UkVTQVJybS8yQzFMRHdaVFM4N3JKbnA5VVZicnA3ZXJtYzV0SUlxdjYz?=
 =?utf-8?B?b3NvR0ozaUc5cE5udlRRampKZU1PRWNYYStZVDJYKzk3SllSSVZDVmJHOHJh?=
 =?utf-8?B?b3E5bmU2SXB4YU9LUlhFRlVQci9aZncyejFUZ2JsdnpKSk1pNEczaFM0eStD?=
 =?utf-8?B?RHVkdkx0MkFxQTNyRkw4TVprMXU3cVB2eHkxaVlqMllFcVlCZmlrYkJ4bHRa?=
 =?utf-8?B?ajlGeE1oOTZoOFFOMCtieEsxY0diYmhETmJMQkVkRDBNUTJrdmZtanAvYW90?=
 =?utf-8?B?aURxVkJwc3M1L0JubFdKbEF3c3NJRXliSFY0UG5pRXc1QThjNkdEdklBbDYv?=
 =?utf-8?B?MXRWcWJxWjhXbHV2MktORE13eU9VQjVnczZiUXM2alhNclJ4NDlPK1pvYXky?=
 =?utf-8?B?bVA3Q2x5MW1XTFAzdnFNc0pDK0FwVGZhU3NCRUd1eHY3MTJGY0xXYlN5dm55?=
 =?utf-8?B?Vi9UdWtLUGdHRVZyR3FDdDVLcGtIblBRcDBLamhiWjhoakVIZVQwa2gzeW1H?=
 =?utf-8?B?Uk5XQ1djTHdCdWFkbHRjT0pjZ24wUnpHWWZTRVdmQVlPdTY1bzNtYk1SdG9m?=
 =?utf-8?B?V2JuN00yZTZyRld5czVBRUhQRFdkZW1xRWxPV2MzM3UzdFhsRzMvQnk1R0ll?=
 =?utf-8?B?bTVtZFAwcVhPcWsrcVFLU1NNa0wwWDJhOUxlbE4rUWpRLzB3SlY5ci92WjUz?=
 =?utf-8?B?ekNUNUpnMFpTTkZrUFphYjRYQ0RjUjRvZko1c2QveWtIWWNobC82am13Q1d2?=
 =?utf-8?B?QWFKRmZ4L1R3Sm03bWVFbGVUem5VTW9ua2xJRVdyb2dKcm1TTEcwQ1ZaWHh0?=
 =?utf-8?B?WVJ4NXhOUTJ3aU1BcXZhSS9RY2pUSnI5b2tnRUdtbU1oOEF4RGhSYVJWeFdx?=
 =?utf-8?B?Z0JsU01CSm5nRHdVWVVrM2hmaW9hWUtIdXR5bkd2emFkTXM3T2FjUWV3SURV?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4ea006-1663-45ed-e78d-08dd6ae501a1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 15:03:16.5635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL5rjLUHqG9cgaT0HoD0Z8KV0FmfPUY3mIBwUX7ujV9C/6ecgDJ+K3lFFIHBmyhV2f+gFZ3Nke/jmlKdhN+WpmID6EdGHrJrgoz3SllUPCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
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

On Mon, Mar 24, 2025 at 10:37:04AM -0400, Rodrigo Vivi wrote:
>> Possible new issues
>>
>>    Here are the unknown changes that may have been introduced in
>>    xe-pw-146307v2_full:
>>
>>   IGT changes
>>
>>     Possible regressions
>>
>>      • igt@kms_flip@2x-blocking-wf_vblank@ab-hdmi-a2-dp2:
>>           • shard-dg2-set2: NOTRUN -> [3]FAIL +2 other tests fail
>
>If we stop considering NOTRUN -> FAIL we shall get a greener full CI!

amen!

I don't think we'd risk introducing regressions and not having a report
since a transition like

	SUCCESS -> NOTRUN -> FAIL

would still have a bug report open on the first transition. I'm not sure
why NOTRUN -> FAIL is classified as regression.

Lucas De Marchi
