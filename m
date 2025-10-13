Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34727CCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 16:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB11C10E43D;
	Mon, 13 Oct 2025 16:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKfjyqIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F5510E43D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760374441; x=1791910441;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xbOoZ7QBXjTWiPFI0ZGYOUNoDl0Bj4abizerCVMO+xo=;
 b=SKfjyqIZdLNtjiyj9+sAzQlybWxR+T06B9sbRRelkqD4Tgh0O0KZp5TC
 HfIFsb4QpspsIxB8qzIhAsx4PMWx/vcjZAkEKfSjbKR3GD+eP7gEBh4dr
 f+mRay74ZFLaXCJIJym7/yvnh9qOBjxm4tH4unMTjhscOS5bTujnYxpVP
 4dK2LrgQZcId3+sb9bhOGmiNk6/SFp84HX8BUF5kbaXn0q8jv8bwNgcFz
 90dC2b0s3DU30eDj7nu5f2YXeFht0gYCHINQE0Dgftuu55iBCi9BtoruZ
 rJo9+/CYSJHVq3+9rqzzVrnNGmHPYOCMMjqiNjM7686UdR3ZLKFPuCnN+ w==;
X-CSE-ConnectionGUID: 2K9p9pY/S8a9qBf7g/xziQ==
X-CSE-MsgGUID: eAkKnXOkQ4SRsmBTODT3uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73864033"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73864033"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:54:00 -0700
X-CSE-ConnectionGUID: AB0AiziiRpig1accQIEk4A==
X-CSE-MsgGUID: k/zdqt7FSmKtcWuHWRn2MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="182071213"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:53:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:53:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 09:53:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:53:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8mU8/NWtBX1QcymEQV2G1rOK5Y0DouJtCxeZHq1jonDNTgYAPDOFm+Ty9sPXZqsNiYyTFzpO8XXW1OTZBEV3H0LZsYZ1lI1zql2vwzwrTtjZvOIbkr8oTOX8yEi3ESAh7WcUq7ZXXk7/HwL2pJLCVi3a5JVgn7KuzyTCCNvyVXF7W/uYKGwxr0c6CtA7LxXF1WYt/ZEzSZDrM4kzhQfElrjk5k2GzDB1TU+CBSfeNkd6aMewj9cd6rfFaVBrEtHsOE7DdNfq5Kzz2O07LNfLZf4iGJdUYg9bega2dnZr6csRSmkOBN5BdkxM3VLoweY33c/TtkU0j4WsfM7Zg/Thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbOoZ7QBXjTWiPFI0ZGYOUNoDl0Bj4abizerCVMO+xo=;
 b=IeYRcXjMUO7+88z57NbEtSwtfaBxL5qNjucFNKOfW36JGFkkmuEHki9/pUOr6yj01K4q+nzPIOQsnfi9t+ubyZeYizc8CETLGIKohkQp+6EEanmapU4zsQVviyPScNY63OmuS2Ass+qdiK9wYY64pRfu59Wkf9kwuJ9RdhrO9oxs9wYhd9HjIBmY1O7cntA56bN+lYrQCj5yqqNgJcKdpt7HRaTdgrMlIKEhgFNdkBj1nccKhOZm/dz6YTa/+lpFG6voxXGH+r8VDF9aMYY9pyeuUbDfMKeEqs8G3z3RCT73lIazfrSYa/XTqzYK9xnSxIDS1Xv6luXdj+Ee50pHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Mon, 13 Oct 2025 16:53:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:53:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "simon.richter@hogyros.de" <simon.richter@hogyros.de>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/2] drm/xe: Fix build_pt_update_batch_sram for non-4K
 PAGE_SIZE
Thread-Topic: [PATCH v5 1/2] drm/xe: Fix build_pt_update_batch_sram for non-4K
 PAGE_SIZE
Thread-Index: AQHcO/PqpwgaMoDyhUCjTENe4NrMeLTATASA
Date: Mon, 13 Oct 2025 16:53:56 +0000
Message-ID: <2e20ff5a11f48968e4affba9c1576d9dc82e227f.camel@intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
 <20251013034555.4121168-2-matthew.brost@intel.com>
In-Reply-To: <20251013034555.4121168-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB7996:EE_
x-ms-office365-filtering-correlation-id: f6bf73e3-0a09-4ef3-403e-08de0a791909
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NTczYWJDMUk1R2VyOFIrVFc4bTE2dnpuVzJFMHQ4Si9oSEhtTHhKMjRyTjdJ?=
 =?utf-8?B?Q05NMWNWTzVlU1lHcGtuZHZqRUNJdXYwOGNwZVh0amgybGVTY0tzUVBNeG1o?=
 =?utf-8?B?NUUzaEkwckQ2TlFYNVJmakQxbWtYNi81YUJHV0RhSlZLaTdsN0taV2ZQZlFu?=
 =?utf-8?B?VE91Q3k0TmNhdHY2M3QyQkRGbFFCUTUyTXF5a1hzbEc1T2dGS2pIUlZFRmNx?=
 =?utf-8?B?clc5cDlXN1BRSkdIWXN6RFk3YkorNGpRR3duYzA3SFR0MjFPU2xiV0x6ZkhK?=
 =?utf-8?B?M3pHTVhzR1hxc3c5dXlpUUdad2Z4MWtXVnIrL1lkTXBlbCt2NnhEMUJWNmpO?=
 =?utf-8?B?MzRBZ29uRVp1Y01tV0JnR0l6bWd1NUZMRUNVQVFvYnB4ZG8xUDVtc2Rhc0RD?=
 =?utf-8?B?VEJ0NEZkT2NCK3ZUQzMwMk1jbUROZmpjK3l6b2xYS0h2Mkt3bytmME8xZ200?=
 =?utf-8?B?Ynk4RFNRWlB3NE14d0pBSVFMVGpERjd4SEgwQlI1cEU4clRZam13cU53NGdM?=
 =?utf-8?B?azBib0VLRmx4LzErMDRLS1FaTmRLSnE4RC9NeVo4V0tiZ2ZJWXhCU2lGN1hL?=
 =?utf-8?B?VFlaaTNWRGR5U1FRSWx5S2MwelByaytoYnNGc2JYTGZEdGhLY09QM0MwZUJF?=
 =?utf-8?B?VzFDYXRQaFNNcGU2bXErZjdkM2xPRldXUVRUNVVhQllmR0JwOTFENmVaUWp2?=
 =?utf-8?B?ZDV0UFo5eDlIa3FKUy9QZXF1WHozZ1hmdWhJZmhGRW5RTDBMTmx0Um5taHJm?=
 =?utf-8?B?S3oyRVk4czdmY0lxcUtSTDRISDV5TURxVEJtRndmZXpkV3JvTjU3RnpYOXRr?=
 =?utf-8?B?N243WnpReStRNUdiWVVBOUJBeFFCUksybWovbXhBa3dBUTdiS0wrcWJrUlV5?=
 =?utf-8?B?Mjh0dnFwTEtuZFBiQVJ5YWlWa2lHTWt3KzVSSXJ4dEhFTStpc2w0ZXdxa3Zn?=
 =?utf-8?B?dFk1ZXQ0OGxlTm5EV0VvNWw3RzQ0Y2pza0tYd2Nja1I4bWhEanVKditBOUNG?=
 =?utf-8?B?RUNZTTkrVVRySHp2Q3JraWEzZ2cxL2ErK1Jiai9TSzdYb096NWwxaXdaSDdP?=
 =?utf-8?B?WlVvUDI0dFV2K0lXOE9xVmZlUkh2R3FXQnFKU21MQXpuNm94anVuc1I0V2o4?=
 =?utf-8?B?QXhKMk1pY1FDcGZRN295clhtVjhhZFdXK05yWWlZUktLd2ppTE1JT3A3OUtu?=
 =?utf-8?B?UUltWVhHb3RDOTBuWWlGYUdtc2x1c29YOUd4SnhoWUFVTkRBU3VTWmxhcVJM?=
 =?utf-8?B?RHVwb2VVK21jdFRvUXFOU0piWG1VSW4rRXJ2L0ZuMk8wdElzTW41aGc4N1Zx?=
 =?utf-8?B?VmFpbGgwQXlDRk02OTNqdW1aTFFrK1A5TDZTSTY0ZFc1ZHZlTHE4OTRoL0c5?=
 =?utf-8?B?M29NYjB5WmRPR1JNQzRWUnNRTUxhKzc2SW8xMW9rNEM4VUM2TlZOSWhPK0xl?=
 =?utf-8?B?enRtYkdOZklaR01MV2htZkRtWDJXWWd1Nkt0Ulpsd0hTNzRZYjhPa2FTQ1lB?=
 =?utf-8?B?ajJhbTJsNTJKeElHcW12aXhvN3JzZEp1N1BNemtVajl2S2VrTUIrZVdjTkRG?=
 =?utf-8?B?OTlkKzc3cDFGT1JDajNvN3I5c0lnamdyL1dUVld1K1g0anl6cWMwSW1aVlZU?=
 =?utf-8?B?MkppVFJEOGtoVE84TkFoL1BnZGZJaFBOaHRCRHhQWXhKaGZkZnhjOGREUm1z?=
 =?utf-8?B?QVZJUVF0Sm9BNjlkSGptbUFmQ1NxalN6QUl0bWR3ZWhRVFR5ZHdrMkUvSFZj?=
 =?utf-8?B?ZzluTVpGQlRwYXdtSmxoMkQvS3I2MHg5R1VyaG04MEZDSytqNjd0NTF2Qmxm?=
 =?utf-8?B?Y1NWU1dncFdpWjZvMDNLTC9JS0ordjcxZ2dLNXUrUGpDbkdOaENIekNKVEw0?=
 =?utf-8?B?bjZUMkVNTlRsQzg5eHppRzZndjIyL0ZLUkQxRVVRRUwwM1NRdWlROUFTdlZm?=
 =?utf-8?B?ODh4YlVuVmpsUXkvcWp0NlNQd1ZrTG53QUFEalpvQzdpY0RXdU5iMXhUcGtJ?=
 =?utf-8?B?ZzkrMk5wWHZNZ0dUUDNHOEtXMXpYQ050Nm50VXVuV1ppYWppcEFxWWUvbCtx?=
 =?utf-8?Q?4ojQWH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MExaMXZ5UmVuT1JwSFFaeFFmYWxhOU5jRUxvdU9qSjErTGQ2ay9yQWtNZUtO?=
 =?utf-8?B?ajBnSDdRVzBHSnJ6VXlXcko4VzdTOENCYlNIMk9UbW9aMmVFMXIya3lTS3I0?=
 =?utf-8?B?KzF5NXkvQlNvMnQ4dDAyOUVGNXMrWTJvRWt2am9UcmFsNkdaQmplL00vcmhy?=
 =?utf-8?B?dExWTXdoci84SjZOakNSKzZ6MUJlM1NXTTlMTzhtNTFVN1JPMUVFQzJzcTBr?=
 =?utf-8?B?Z0VMbTVDTHhFa0JpQ0Y4Q2FMdUpkRXZNZTNFazlRNkYveWxJeXpNUG1ybFpl?=
 =?utf-8?B?RGFlNmN4MmtLZ2EyeUprYkdFQTJnUHNLQmF0dDVUcDYxY1VuWlVldys3Smtx?=
 =?utf-8?B?YTluak51V0RNWHJBOFdYZm0ySThRbXFXMTl2OXZKNWpLU2QrR1NURi9ZZTF4?=
 =?utf-8?B?eVdrTGxtK09LVDc0OHVKRFNYSVAyY29sQjZDUml3MVZIb0hTTVpUbGswbnJ6?=
 =?utf-8?B?L21mcy9QZlQxZ1J3MnR6QStzS3I2V2F2dUxSWTlEMXovYk9RaU40TGt2dXZ1?=
 =?utf-8?B?YXB6cmg4bEF4V0tZU1M1ejd3STg4bW03RDJoa1NsdTB3V0p6V1FGVDdEWFRV?=
 =?utf-8?B?WFplbm1wNkcrV05aUGIxUE1KeXhuNGdaLzhyRS9rSllUVlhQdlBleUxvVVY0?=
 =?utf-8?B?Z1kyUTFtaE5OVkNYRkdZcTBuclhuV0hTSGVLY3VaSlFubXBzUjZMUlBGYVdB?=
 =?utf-8?B?QzNobTJNUWFuanFJZ3hLeFdPbVRKTVBnWS9vZWxURG1LMEZWWEFURXBLcWEr?=
 =?utf-8?B?b2syVUFtc1RXRGhKY0JLdzQ3NEcyRmpYUnF6OVhLQWp2MTdLSTZpaDBTSXVl?=
 =?utf-8?B?SUE4a1p3bHZNb2U3QW9KKzJjWXhjNHNvWTNGUWtWOGt0WnF1SlAvRzl2Tmk2?=
 =?utf-8?B?U0hPMnpteFNmUVBqOUxISEllT3NVcVhscCszeW52V3plclpZTmY2WmtVRVBo?=
 =?utf-8?B?dm9sa2ovc0R0aFVpZU10WWpHTGFaR2Jhd1o5ZlA0RnA2K3hvbU8xVFlxZXZu?=
 =?utf-8?B?dUxQazNWck82czNiNHpkOElTdXUraU5GT2FGM3RxK3NsZU91c082dkovaWZ3?=
 =?utf-8?B?Z3ZOZ3JKdThxeHppVloxbHNXcmMxQjBQQWY4OG5rQzcrYmJOQWFMWVlLb3Vq?=
 =?utf-8?B?L0hDTHFQeTRoa0JKbWtaWlJZNVI4THN4TE9yWkpFTFZodGRhZVdFOVpnS0Y5?=
 =?utf-8?B?OHExM0pLalRhZjF6Q2hmdHd2VGJkU3l3RDNKWWQ1QkpBSG5xeHVmbFdBdFo4?=
 =?utf-8?B?NGJkbUlVZ3JaSFJaT0V0UE80YXJFQ0ZyVDVGVW5ja0ttL004OEVSWEFVb3ph?=
 =?utf-8?B?VThDZ1dPUkE3OHNtUE5kSXN1MnF1cVRadnA4SWdwclQ3Z21ldEF4TksyNjlw?=
 =?utf-8?B?Q3pRaTZ4SXJ2WCtyUWdGN2tud1ZTUEhNMURGODVJZS9HZnBCa2ptM1Vkd0hT?=
 =?utf-8?B?ZjUzeERlU2tkZEJuNktBNnF2N0VKTEJGazE3QUt0ckNXOGdjN1Juck14TVVa?=
 =?utf-8?B?cG15ZTdoWjhUMXRBNHRUN1ZOL2ZSbFQ3alIwdVhpcm9JQi94NjJqTXhxL2h4?=
 =?utf-8?B?SXNMSWdrbUhMcFZ6em9mdHdaVTJ1UG91ZzRkZVZvb1hkVm5kNit2NjZkN3pn?=
 =?utf-8?B?N0RLQURJQmxhOURJaUZjbVhsSStkWnlmREg2eEIvQnNrZnJ6TlJZRzR2cWpB?=
 =?utf-8?B?SlA1dDgvM1JZcVZsbmJqT01iaTNIbU16dXdTMmEyanNIN0h1ME9SbDBjaVRs?=
 =?utf-8?B?cFBPVUtXZnJhUmdGQmVOL0JxV2xaRnRkUHI1eVVKUWQ3VXVidU9sL1FFeWhY?=
 =?utf-8?B?SjE4ekxselpweGZxV2V4Zk5NeVpjOVZWanZkdFJ1NmNCNUpRSzdKdFRvWlVa?=
 =?utf-8?B?Vk5LWW9iR0lFZ0ZXQlZHenVWNmNVNE9ueURGZGo2cmpTSHJ2UG01azlmVi9C?=
 =?utf-8?B?SmZ0dm15RXJZczFvWlJpUElmalViek9ZVzFabGhNSUxVL01nOS9YMlM0SlYv?=
 =?utf-8?B?VmJQcTB6YXYrOXBnVWgwemVSZy9jb1lGdE5pUFlRQ09aQW5sbGpyaCtFbFNF?=
 =?utf-8?B?OHpwaitQeVJVMU0zTkRIQkdhSU1paEgrMnFvMGh5MVg5OEQ0eVA4NE13ZDNF?=
 =?utf-8?B?SFdSNzMwTjkwWnlFTE42Q1Mva1JtQ09FS3FoMVRSOUpkdUJ1QUNBVnNkMmNY?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <480EA057187C1F4A81F2D281555D0F64@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bf73e3-0a09-4ef3-403e-08de0a791909
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 16:53:56.0470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EniyFzzRlSPY9m8v9zouVoQZEOS/2tMTXw0kCZg/nXSVrPwP7o5gUGr8CX3zgK/ndbPSTKmo2R93MEA/7TaMv1KUBHYdtuWSWILmyoOxPoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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

T24gU3VuLCAyMDI1LTEwLTEyIGF0IDIwOjQ1IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IFRoZSBidWlsZF9wdF91cGRhdGVfYmF0Y2hfc3JhbSBmdW5jdGlvbiBpbiB0aGUgWGUgbWlncmF0
ZSBsYXllcgo+IGFzc3VtZXMKPiBQQUdFX1NJWkUgPT0gWEVfUEFHRV9TSVpFICg0SyksIHdoaWNo
IGlzIG5vdCBhIHZhbGlkIGFzc3VtcHRpb24gb24KPiBub24teDg2IHBsYXRmb3Jtcy4gVGhpcyBw
YXRjaCB1cGRhdGVzIGJ1aWxkX3B0X3VwZGF0ZV9iYXRjaF9zcmFtIHRvCj4gY29ycmVjdGx5IGhh
bmRsZSBQQUdFX1NJWkUgPiA0SyBieSBwcm9ncmFtbWluZyBtdWx0aXBsZSA0SyBHUFUgcGFnZXMK
PiBwZXIKPiBDUFUgcGFnZS4KPiAKPiB2NToKPiDCoC0gTWFzayBvZmYgbm9uLWFkZHJlc3MgYml0
cyBkdXJpbmcgY29tcGFyZQo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRo
ZXcuYnJvc3RAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQu
c3VtbWVyc0BpbnRlbC5jb20+Cgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3Jh
dGUuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9t
aWdyYXRlLmMKPiBpbmRleCA3MzQ1YTViNjUxNjkuLjIxNmZjMGVjMmJiNyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX21pZ3JhdGUuYwo+IEBAIC0xNzgxLDEzICsxNzgxLDE1IEBAIHN0YXRpYyB2b2lkIGJ1
aWxkX3B0X3VwZGF0ZV9iYXRjaF9zcmFtKHN0cnVjdAo+IHhlX21pZ3JhdGUgKm0sCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1MzIgc2l6ZSkKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgdTE2IHBhdF9p
bmRleCA9IHRpbGVfdG9feGUobS0+dGlsZSktPnBhdC5pZHhbWEVfQ0FDSEVfV0JdOwo+ICvCoMKg
wqDCoMKgwqDCoHU2NCBncHVfcGFnZV9zaXplID0gMHgxdWxsIDw8IHhlX3B0X3NoaWZ0KDApOwo+
IMKgwqDCoMKgwqDCoMKgwqB1MzIgcHRlczsKPiDCoMKgwqDCoMKgwqDCoMKgaW50IGkgPSAwOwo+
IMKgCj4gLcKgwqDCoMKgwqDCoMKgcHRlcyA9IERJVl9ST1VORF9VUChzaXplLCBYRV9QQUdFX1NJ
WkUpOwo+ICvCoMKgwqDCoMKgwqDCoHB0ZXMgPSBESVZfUk9VTkRfVVAoc2l6ZSwgZ3B1X3BhZ2Vf
c2l6ZSk7Cj4gwqDCoMKgwqDCoMKgwqDCoHdoaWxlIChwdGVzKSB7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB1MzIgY2h1bmsgPSBtaW4oTUFYX1BURV9QRVJfU0RJLCBwdGVzKTsK
PiDCoAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjaHVuayA9IEFMSUdOX0RPV04o
Y2h1bmssIFBBR0VfU0laRSAvIFhFX1BBR0VfU0laRSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBiYi0+Y3NbYmItPmxlbisrXSA9IE1JX1NUT1JFX0RBVEFfSU1NIHwKPiBNSV9T
RElfTlVNX1FXKGNodW5rKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJiLT5j
c1tiYi0+bGVuKytdID0gcHRfb2Zmc2V0Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYmItPmNzW2JiLT5sZW4rK10gPSAwOwo+IEBAIC0xNzk2LDE4ICsxNzk4LDMwIEBAIHN0YXRp
YyB2b2lkIGJ1aWxkX3B0X3VwZGF0ZV9iYXRjaF9zcmFtKHN0cnVjdAo+IHhlX21pZ3JhdGUgKm0s
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdGVzIC09IGNodW5rOwo+IMKgCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB3aGlsZSAoY2h1bmstLSkgewo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTY0IGFkZHIgPSBzcmFt
X2FkZHJbaV0uYWRkciAmIFBBR0VfTUFTSzsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHU2NCBhZGRyID0gc3JhbV9hZGRyW2ldLmFkZHIgJgo+IH4oZ3B1
X3BhZ2Vfc2l6ZSAtIDEpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgdTY0IHB0ZSwgb3JpZ19hZGRyID0gYWRkcjsKPiDCoAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3RpbGVfYXNzZXJ0KG0tPnRpbGUs
IHNyYW1fYWRkcltpXS5wcm90byA9PQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0lOVEVSQ09O
TkVDVF9TWVNURU0pOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX3RpbGVfYXNzZXJ0KG0tPnRpbGUsIGFkZHIpOwo+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWRkciA9IG0tPnEtPnZtLT5wdF9vcHMtPnB0
ZV9lbmNvZGVfYWRkcihtLQo+ID50aWxlLT54ZSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCj4gYWRkciwgcGF0
X2luZGV4LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMCwKPiBmYWxzZSwgMCk7Cj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBiYi0+Y3NbYmItPmxlbisrXSA9IGxvd2Vy
XzMyX2JpdHMoYWRkcik7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBiYi0+Y3NbYmItPmxlbisrXSA9IHVwcGVyXzMyX2JpdHMoYWRkcik7Cj4gwqAKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkrKzsKPiArYWdh
aW46Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdGUg
PSBtLT5xLT52bS0+cHRfb3BzLT5wdGVfZW5jb2RlX2FkZHIobS0KPiA+dGlsZS0+eGUsCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGFkZHIsCj4gcGF0X2luZGV4LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAwLAo+IGZhbHNlLCAw
KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJiLT5j
c1tiYi0+bGVuKytdID0gbG93ZXJfMzJfYml0cyhwdGUpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYmItPmNzW2JiLT5sZW4rK10gPSB1cHBlcl8zMl9i
aXRzKHB0ZSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKGdwdV9wYWdlX3NpemUgPCBQQUdFX1NJWkUpIHsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhZGRyICs9IFhF
X1BBR0VfU0laRTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAob3JpZ19hZGRyICsgUEFHRV9TSVpFICE9IGFkZHIpIHsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2h1bmstLTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z290byBhZ2FpbjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaSsrOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpICs9IGdwdV9wYWdl
X3NpemUgLyBQQUdFX1NJWkU7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB9Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gwqDCoMKg
wqDCoMKgwqDCoH0KPiDCoH0KCg==
