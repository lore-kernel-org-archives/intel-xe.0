Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20BEC02183
	for <intel-xe@archiver.kernel.org>; Fri, 17 Jan 2025 01:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853FF10E2E0;
	Fri, 17 Jan 2025 01:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxBqeHS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F0E10E2E0
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Jan 2025 01:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737076807; x=1768612807;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=66l3VocWPkMNYTX7bDXDo0fqMFi2ifmuVWVYBclaMF4=;
 b=NxBqeHS6sosR2JmmBuJbRlVsbK3sbhrxuLpwp7KepyRFaydKv0nH3nV+
 WwQ5azkyc9Y7A96oUUCCBXbY8zfPC8BIXXvDLZr2zE+UPPXyORXia9eq1
 6I7hDRh4mpSbRRPM1aaeyKQZZcWZ92TfsUfDsG5mITfmt3SbZPtBHt6wF
 SNjJOO3I2CGeZS4Q2tk6o9h857wetsh+PQpbAam7PSoCxk8+u2WNNWc+f
 3qxTNrHZ207m4yIi6+9B6jMONrtbs6fPYNgJs6Ph2GkUwY2BzyUxhJ5+q
 g3Kog/NxeAi6paFqeZEtG7lf0MmcjBPVO/bih8xs9jdTE0KQ4DeaKFDWm A==;
X-CSE-ConnectionGUID: EYqVTiexTeORPIztIkMRWA==
X-CSE-MsgGUID: rrG9aRY0TF+ak92gEkLQNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37407224"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37407224"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 17:20:03 -0800
X-CSE-ConnectionGUID: 4xwbDV9ISZqqnadVF7wrAg==
X-CSE-MsgGUID: wqlq/2KER2CUmCeXY0OFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136533625"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 17:18:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 17:18:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 17:18:46 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 17:18:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdUlMgkyDHQfV3mXj3mXD42p3Jr/LmZIlPWAVBeJUC3qdMIyibBGY0u1rCQ5TgCB50fuuMlZSOBTtxQfFkom4pIuEZzpS95ZGnmmMEIv2IUegRdCvA/n3MaoQSIHpsDREh3pfxI7BA6qjWS+xwSNGEMAq0EFn1hkaX3pPgSg6WMGk0iUvlyhr0sTVLCzLTGZh/6ZMqQSxzGhmIqXTb2Ey/6PMxtWaf7rRMQ7dR3tHyCMFbqoHGzijworWXcQXJUprbutu+5P9vYUUaJs0LCnjOaNRgXY1/Ia9bqPcxjZfPxjRBc2nkwvG2bhzvzf1KUIbwyCb5gMtJd6EvmpXGfCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRnju2gGYKBeYKn+aMJZyhZi9BLOpf0SPBWrCsOrfOg=;
 b=j3fumAl9dsWaFjQhuG9OUjqJnYHcNzLMlNLubS5LVegUUaFiB4TGNoLfMXardlpvPb1GUb4ukeCzhhQC2KG/ZbNa2kQv2ZqpSoq67lcFL/Syyan3Oxtqa6Z02NZg9D7czSAO7yScIrdMhwo79cbNCsu3fnqwxSPxxeBQb/b6yr1Hu2JrAV4SHIljiaToXKbYhk7zZGa2SRlKIP1OBtbZWBc1Oc0QrvwobBzy2hXdoEa1xDNUYWEW2Sppe75lK5ULggwyLoY7TPRPpB0qqmBjdBaWNi4mNliH343zZiHGwurkQvbUdIEKOAnpVB3cdryKFVP657q7Qygi1gkaV0NgNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB7909.namprd11.prod.outlook.com (2603:10b6:208:407::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 01:18:44 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 01:18:44 +0000
Date: Thu, 16 Jan 2025 17:18:38 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <ashutosh.dixit@intel.com>, <john.c.harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v3 09/10] drm/xe/pmu: Add PMU support for
 per-engine-class activity
Message-ID: <Z4mv7kYyeZPHozf9@orsosgc001>
References: <20250106075600.852080-1-riana.tauro@intel.com>
 <20250106075600.852080-10-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250106075600.852080-10-riana.tauro@intel.com>
X-ClientProxiedBy: MW3PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:303:2a::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: b71cbbeb-717f-4a50-6e18-08dd3694e29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cndZcTMwSUJMVFpZNWgvSHRaMEhHVUgxMG5zSlNFNUFBSlVvYXFlN2E4U1Jq?=
 =?utf-8?B?MUtCQWdlU1dUZXBWdzIwRTQwT0JEb0l5T2ZQRlpST2RUbjNIbnpBQnBJcVJr?=
 =?utf-8?B?WHNOODZBZTFhOVFGaU1nR1pjZ3RFdzJkTGNpWmRrYkYvK1JtVjEzSlJTejFZ?=
 =?utf-8?B?em5IalpqamFjRGxlYzVwU2R2cWRkTWRtMFJBY2hUWFpQTloyc1NSa3lJYnBL?=
 =?utf-8?B?RjFBUk5CclBhNHljSmhqNUpnT1hCNTZNaFgwOStTU1ZoWGpxb2xUZEhSS1N0?=
 =?utf-8?B?SEJhdVhMKzA4TS9Jck8zRHQ0V3Zlb3I4NUw4QXZBRGxBY1NoSmtiaEo3SXpq?=
 =?utf-8?B?T1IrNVIvVmZ1TUR5d25ZK0VqYy9IaUM3QyswQjI4UW0ydlFJc0NSZFA5RlNw?=
 =?utf-8?B?VzgyWi92TFFCYWFjc0NpYVBYNDg2VUVJUGV4M2RYeEVBclpRd2orMDNIb2ln?=
 =?utf-8?B?L1JxSEhRTW5IcjF0b20wOXZnZ1BKMWoyeUxKRnVJRVVycm9ITS82WmdUYnF2?=
 =?utf-8?B?VG55ZHNGbWNQalR2Z0YxZGFITFRwZmREVFhLWXl5eFVwMGNhZ1RFSnltU25F?=
 =?utf-8?B?TVUzVHNvUk9jUk1UQTg4cWtpSEhpTDVrWmw2am1kWnBEeU1jc1h0YTlBdHZE?=
 =?utf-8?B?SjBtblF1MnRYbDRFVm1yekIyd2c5Q3FScUlrZUlhZ09IaGNSMGZzNkMwTFBD?=
 =?utf-8?B?Wlk5c2d5QzRKdG9STlRFL1oyNnJGU1pWZXMwTm1qNXNCWm1SbUFMcWl1bm5F?=
 =?utf-8?B?SjYxWGVySDlHQzZMQTBTcEtIMGZ3YkZqbkRmOWhxVmxIRmUwUkI3TkthU2k4?=
 =?utf-8?B?THRraVBkWjFkRDY3VjNpSXYzRGFGdVNRSlNMVksvWVVHTHhvbURGOUtlTTly?=
 =?utf-8?B?SUZldHQ0V1dpYlVNZW5KOTVPT3ZJUFNDbFpqcDlpTE1RU2NWS3UyWCtzeFhB?=
 =?utf-8?B?dXk3ODl5U0NndUg3aFJ3bnIyZzdHNTFLanhaU0pUTGZmT3RFUDVuR0FjZElQ?=
 =?utf-8?B?cnZTYzRXeDU4MWhqbjJPbVlPYUJIYXBJVkFSYVlRQno2dmlBczJCaE1YMnZS?=
 =?utf-8?B?elkzUG93ZVhZTjFtS3dHc21GRWFXR2lxMHFxOTVBcEFJYU5MeDA0QURQUldh?=
 =?utf-8?B?MTdkeU40RnZVZGlRRi9UYmI2OVR3TlFZRWV4UlVGR2V0VzFRaC96bXdWYzY3?=
 =?utf-8?B?eGpCekk5SXNxM3kvbHJBREExekIyMXNxcXg3ZWwrYUJ4dHBXK3ZLaUZSdDA1?=
 =?utf-8?B?d1NxOXBmTDBwTjhkZjFsTEU0Y1l0WWYvbFlYeFVCeWphbUgwaUl2bzAySVBB?=
 =?utf-8?B?dEtCWS9YSWVOWDZqNWRvV3RncXV1THplc0RpM0ZHRzJWa3dTWjIvSml0cVhD?=
 =?utf-8?B?QVBFYWE2cVdrWktrS0JmaS9jZUl0Q3F3SEk0aU56SDgyaGpJNkxvd3NXOFBX?=
 =?utf-8?B?b015VU90MVVXS3FhR3dxQk9ONWNadmd3cU9FNk9ZN0k0MDIzcVR1cVVqMDdj?=
 =?utf-8?B?WEtPRlg3REpENm9YZUcwMURsd25rSG9IZ1NxWGlxRStkMk9jSUJQWTVxckFJ?=
 =?utf-8?B?NVVqRW1aeWgydmh2ZHV4Z20yUEZSS3daTk01VTA2STVoYmRraENiQmdRV1Ju?=
 =?utf-8?B?SHJqR3F2WkVrd1ozVElXcWljNWlFNnZ2cTJjK2N3TXpnWm81emZlSG1mTHZO?=
 =?utf-8?B?RkpTaTE3UUtyWU13Wm5zbUhrYmpnNHdicWpYQW55bld1R2F4N0lZRFY5cWM4?=
 =?utf-8?B?c1dpYWhhQ1dxdnlBUVVra2dMdFF0QTYvVVFrZW5NbUdOTnRMM1Fic0t1eHFV?=
 =?utf-8?B?WWRCa3BHdVh5aFVucUEvMXJXeUlSaGVZYzlacFpWUENBcEY2bkp2Tm9qQnJt?=
 =?utf-8?Q?AN7owUqbGvQ8B?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFJOSjg2V2Z0VE1rMEdmS2pXRSs1dUhlK0NtR3pFVU40Zk5yejlCYjJNL0M4?=
 =?utf-8?B?VzdwZGdXOWwrd1ZIVVpNS1dTaVdOQm95L1dNRlNlaU4wQ2pXeVVRM2FJRTRi?=
 =?utf-8?B?b0pKMGRVb1ZYYVJBbGFZR09Rb0tEeEZPRUZmS0txOG5sdTZHZEpzZHFRR2c1?=
 =?utf-8?B?NUtPVVFJcHhkMmpHOHRoREp4Qks2Z09mYmdWdlpTcHpBczJ6SFhwVzBjWDIx?=
 =?utf-8?B?ekdraVdTdmtpVnFYME5iQXo2N21oODN2TXVKc3luQTBBOHFheFhVZ2pwOXg3?=
 =?utf-8?B?MUlFbktPbUxGTGlLUHk1ZzFIa0FFOVlUaDBqTGRkUFZxQVFrMHRQRHlQZEFK?=
 =?utf-8?B?RXVNWER0K3prQ09UZlk4M3N4OS9rYnBGVlhZY01NRC94QVQrbHIwNXdvNDJ5?=
 =?utf-8?B?RFpxVFJNUTBCakdsZlJpeW1HOHJrbEZuRTczNC9GYnBXUWJwM0hySmJjK21Q?=
 =?utf-8?B?MmxRelF1b2V6ZmN0b25TT2xtazlFOHBUVVByWkpTeXBLdFJ5eGFsVW1DRFVu?=
 =?utf-8?B?Yk14NXhmK1N4VjZOZGpkT0VOcC9WWm9aekpXTnVwV0dwK1pyWDBjMjZXNmcv?=
 =?utf-8?B?N2xMdllhWDBJeFFiMGlpczdYZ2RXT0tJbFdZeVc3WFlQaU0yL1ZNL0Y2eUcx?=
 =?utf-8?B?b1FYMEVRVVQ4S29jdFFYby9Qb0VERzlxRWtVem5haGk3WGJ1Q2xySFFsOVVN?=
 =?utf-8?B?UXJ2V2dQVXlXTWIwaFJrektRSWkrN0pLdXpybUxJakRTb3Brbms2eE9BV000?=
 =?utf-8?B?clhQWVdPZGVoMGxpZCtKN0E2bno4QzYyb3VNY05EQmJla2dySFh1QjYyTnBS?=
 =?utf-8?B?YzFYc1F0RUt3aGEvNGdEcUNGck9HTEowaU5hZUo2Nk4xWDA5NnpHRlEyZ0lP?=
 =?utf-8?B?dHY2YURSY0UwdE43QkIwaGNIS1M0UWVwciszSXJMQU5qalk3VnJJTnFEdEdJ?=
 =?utf-8?B?Y3lodEJvQzIram9FYjRhSm0wNDlid2tZTUZMajZhTWRIbzcvMHdQK0F6MFZX?=
 =?utf-8?B?TDRGTExvclVEUEZzSXVoODlBeWdHRExqcG9aQXhFOGpud3RKYkdvdWxyZ1Bk?=
 =?utf-8?B?THd3SXpoOUtNYmcwaHBnZ0RHd3RudUFIZmdSbTNnRUt0WkNUSCtVV1lvQm5J?=
 =?utf-8?B?bFBsYmltRTNJa0tid1V2MFhtaTFjNDlhd1lVYXdQdG9ZbCtyQk5Fek5CQytZ?=
 =?utf-8?B?ckNHeDVjWEtWWTA1cmFxRE5DTlFiSzd0bUYxVDBOdEtWbWIyVzlFamZLbTJV?=
 =?utf-8?B?OGZ2aVpzb1BSM1FaOGhKb1FBeWc4RjE2NEs4cXhhWjhMTm0yZGZ6em5IOWdK?=
 =?utf-8?B?VlhsdDgwK1AxUThzb3MrWHQvcnVoWlB5eTdOeEdUNzJIN1hDWGhtekl4WGtD?=
 =?utf-8?B?Q1I1QVIxVkhHOXMrN05OV1gvQzVIQVRkeXVwR1JaVXNpaUxja2F3cDNxcGlC?=
 =?utf-8?B?dFBxUTBHNnl4YjRGdGtMUzd0bVpVWTBTT0Q0dmtmVVliOHllTzRVZG5rK3lJ?=
 =?utf-8?B?MTNVL1Jjc2FHTVBJWW1sL01MQUJHZ1A3TDlkNm1WNmREYi9XVVgyM25NRXda?=
 =?utf-8?B?ZDVudTFkTmVCMC83aHhuY3dzcjd1Q2VNSmQ4SmphVS9wc0Y4VVVVdEJXY3hu?=
 =?utf-8?B?QUJkcmFwL1ByYXZNbDV0RTlkSGpLNHJ1SWdkV2lpckdsdndZQkcyclN6TEQ3?=
 =?utf-8?B?dUxTc3RHbVdUYUY5amlYTDhQazJRcElXQzFxU1BRMkFLcVMrYUgxL2d2QUdN?=
 =?utf-8?B?ZUhGM1I5cUU3T1hIcVJ0UTc1TUY5dmxGWTFtcUhZUXZNOEltcHlUbm5RKzh1?=
 =?utf-8?B?bXNnY0Nvdk5hMTNVREFGdUJodVcvRk83WGlQcjd1U3FGTWhWdnl4ckc3a01p?=
 =?utf-8?B?d3NYNEI3L2k4M2hub3dOeVR1M1FudlhMTiszTEpLQTUrZUQ5azJmdXNKcDg2?=
 =?utf-8?B?U1lHQzAvTTFtTE4xbk9EYXljY0J0VFVFRjJRQWc2WFNDcEcrK2I4ZldWaFdi?=
 =?utf-8?B?d21ZZHI1UDltYnhRZU1aWGk1bEZKMTkrM1BQcEE2ZXRDWU5rVXRScGgvUVU5?=
 =?utf-8?B?UldxY1M4SG13WjNjeXVDOXhFYnA1ZS9IVHRQekhSUjRCb3A4OG5kRzZhWWNv?=
 =?utf-8?B?cStBWlNTemdSZHEraXk2WHNQQnlrQ2Jua2psaXAycHJJSUk4dVFPYndPc3pt?=
 =?utf-8?Q?WoN+FVdcac0Z+b8VJ5+OkNI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b71cbbeb-717f-4a50-6e18-08dd3694e29f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 01:18:44.3476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQl4GP0N6cci7OxD1qMuBvR5iS/neYCIYOOBDAkgdvYs689yKUj0scXrYQbmbHHd8VFQz47fxVhk983RsxgSg12cEfocqeXaz2aZx4pHLYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
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

Hi Riana,

This is part 2 of the review:

On Mon, Jan 06, 2025 at 01:25:58PM +0530, Riana Tauro wrote:
>PMU provides two counters (engine-active-ticks, total-ticks)
>to calculate engine acitivity. When querying engine busyness,
>user must group these 2 counters using the perf_event
>group mechanism to ensure both counters are sampled together.
>
>To list the events
>
>	./perf list
>	  xe_0000_03_00.0/engine-active-ticks/		[Kernel PMU event]
>	  xe_0000_03_00.0/total-ticks/			[Kernel PMU event]

total ticks is also engine specific, so maybe we can use 
engine-total-ticks as the name.

>
>The formats to be used with the above are
>
>	engine_class	- config:12-19
>	engine_instance	- config:20-27
>	gt_id		- config:60-63
>
>The events can then be read using perf tool
>
>./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt_id=0,
>			       engine_class=0,engine_instance=0/,
>	       xe_0000_03_00.0/total-ticks,gt_id=0,
>			       engine_class=0,engine_instance=0/ -I 1000
>

I am also wondering how a user knows what format bits are/are-not 
applicable to each events. For example, if I pass engine class and 
instance to a frequency event, it shows unsupported. How does the 
implementation check for valid config?

>Engine activity can then be calculated as below
>engine activity % = (engine active ticks/total ticks) * 100
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc.c       |   5 ++
> drivers/gpu/drm/xe/xe_pmu.c       | 139 +++++++++++++++++++++++++-----
> drivers/gpu/drm/xe/xe_pmu_types.h |   7 ++
> drivers/gpu/drm/xe/xe_uc.c        |   3 +
> 4 files changed, 131 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 408365dfe4ee..f229745b78b9 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -26,6 +26,7 @@
> #include "xe_guc_capture.h"
> #include "xe_guc_ct.h"
> #include "xe_guc_db_mgr.h"
>+#include "xe_guc_engine_activity.h"
> #include "xe_guc_hwconfig.h"
> #include "xe_guc_log.h"
> #include "xe_guc_pc.h"
>@@ -743,6 +744,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> 	if (ret)
> 		return ret;
>
>+	ret = xe_guc_engine_activity_init(guc);
>+	if (ret)
>+		return ret;
>+
> 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> }
>
>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>index bae8eb38fddd..5bd312b6b8f6 100644
>--- a/drivers/gpu/drm/xe/xe_pmu.c
>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>@@ -12,7 +12,9 @@
> #include "xe_force_wake.h"
> #include "xe_gt_clock.h"
> #include "xe_gt_idle.h"
>+#include "xe_guc_engine_activity.h"
> #include "xe_guc_pc.h"
>+#include "xe_hw_engine.h"
> #include "xe_mmio.h"
> #include "xe_macros.h"
> #include "xe_module.h"
>@@ -90,6 +92,17 @@ static unsigned int xe_pmu_target_cpu = -1;
>  *    1950
>  *    1950
>  *    1950
>+ *
>+ * Engine Activity: PMU provides two counters (engine-active-ticks, total-ticks) to calculate
>+ * engine activity. While querying the engine activity the user should group these two counters
>+ * using the perf_event group mechanism to ensure both counters are sampled together.
>+ *
>+ * To read a engine specific event for a GT of class 1 and instance 0
>+ *
>+ * perf stat -e xe_0000_03_00.0/engine-active-ticks,gt_id=0,engine_class=1,engine_instance=0/,
>+ *		xe_0000_03_00.0/total-ticks,gt_id=0,engine_class=1,engine_instance=0/ -I 1000
>+ *
>+ * engine active % = (engine active ticks/total ticks) * 100
>  */
>
> static struct xe_pmu *event_to_pmu(struct perf_event *event)
>@@ -107,6 +120,33 @@ static u64 config_counter(const u64 config)
> 	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> }
>
>+static u64 engine_event_sample(const u64 config)
>+{
>+	return config_counter(config) & 0xfff;
>+}
>+
>+static u8 engine_event_class(const u64 config)
>+{
>+	return (config_counter(config) >> XE_PMU_CLASS_SHIFT) & 0xff;
>+}
>+
>+static u8 engine_event_instance(const u64 config)
>+{
>+	return (config_counter(config) >> XE_PMU_INSTANCE_SHIFT) & 0xff;
>+}
>+
>+static bool is_engine_event(struct xe_device *xe, const u64 config)
>+{
>+	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
>+	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>+	u64 sample = engine_event_sample(config);
>+
>+	if (!xe_guc_engine_activity_supported(&gt->uc.guc))
>+		return false;
>+
>+	return ((sample == XE_PMU_ENGINE_ACTIVITY_TICKS) || (sample == XE_PMU_TOTAL_TICKS));
>+}
>+
> static unsigned int pm_bit(const u64 config)
> {
> 	unsigned int val;
>@@ -192,6 +232,23 @@ config_status(struct xe_device *xe, u64 config)
> 	return 0;
> }
>
>+static int engine_event_init(struct xe_device *xe, u64 config)
>+{
>+	const unsigned int gt_id = config_gt_id(config);
>+	struct drm_xe_engine_class_instance eci;
>+	struct xe_hw_engine *hwe;
>+
>+	eci.engine_class = engine_event_class(config);
>+	eci.engine_instance = engine_event_instance(config);
>+	eci.gt_id = gt_id;
>+
>+	hwe = xe_hw_engine_lookup(xe, eci);

Getting hwe from the config could be a helper since you have similar 
logic in __xe_pmu_event_read()

>+	if (!hwe || xe_hw_engine_is_reserved(hwe))
>+		return -ENOENT;
>+
>+	return 0;
>+}
>+
> static int xe_pmu_event_init(struct perf_event *event)
> {
> 	struct xe_device *xe =
>@@ -221,7 +278,12 @@ static int xe_pmu_event_init(struct perf_event *event)
> 		return -EINVAL;
>
> 	event_config = event->attr.config;
>-	ret = config_status(xe, event_config);
>+
>+	if (is_engine_event(xe, event_config))
>+		ret = engine_event_init(xe, event_config);
>+	else
>+		ret = config_status(xe, event_config);
>+
> 	if (ret)
> 		return ret;
>
>@@ -300,24 +362,49 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
> 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> 	u64 val = 0;
>
>-	switch (config_counter(config)) {
>-	case XE_PMU_C6_RESIDENCY:
>-		val = get_c6(gt);
>-		break;
>-	case XE_PMU_ACTUAL_FREQUENCY:
>-		val =
>-		   div_u64(read_sample(pmu, gt_id,
>-				       __XE_SAMPLE_FREQ_ACT),
>-			   USEC_PER_SEC /* to MHz */);
>-		break;
>-	case XE_PMU_REQUESTED_FREQUENCY:
>-		val =
>-		   div_u64(read_sample(pmu, gt_id,
>-				       __XE_SAMPLE_FREQ_REQ),
>-			   USEC_PER_SEC /* to MHz */);
>-		break;
>-	default:
>-		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>+	if (is_engine_event(xe, config)) {
>+		struct drm_xe_engine_class_instance eci;
>+		struct xe_hw_engine *hwe;
>+		u64 sample = engine_event_sample(config);
>+
>+		eci.engine_class = engine_event_class(config);
>+		eci.engine_instance = engine_event_instance(config);
>+		eci.gt_id = gt_id;
>+
>+		hwe = xe_hw_engine_lookup(xe, eci);
>+		if (!hwe)
>+			drm_WARN_ON_ONCE(&xe->drm, "unknown engine\n");
>+
>+		if (xe_pm_runtime_suspended(xe))
>+			return 0;
>+
>+		if (sample == XE_PMU_ENGINE_ACTIVITY_TICKS)
>+			val = xe_guc_engine_activity_active_ticks(hwe);
>+		else if (sample == XE_PMU_TOTAL_TICKS)
>+			val = xe_guc_engine_activity_total_ticks(hwe);
>+		else
>+			drm_warn(&xe->drm, "unknown pmu engine event\n");

Maybe also print the unknown sample/value for debug. Same for the else 
section below.

Rest looks good.

Thanks,
Umesh

