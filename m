Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB274CCD1A0
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 12:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4444A10E59F;
	Wed, 18 Sep 2024 12:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xg6tYL23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C52110E596
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726660803; x=1758196803;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=EeIRK+VwFgt9vbRIlQ0PnOXDHypBi3EYbDP7wl5Y0kQ=;
 b=Xg6tYL23Q8OxuiVSMqG1Q4rp9WgiCDFrz7YIsoqGfmoJiLLucivmftq6
 0LxH0SKmKlYcXiNaq9jLpW5RUQuM+TXi9zjsJEGOByeLeuWOJpKklE/eg
 U7NRzMGarcR9EQVRxry4OtEKPq1lbQpqyrBUeiIwLgl6IouE1d4eMXsDi
 SIMLz1/RTSfHSSjGg0UiG25QlxQGFwUhnhS/q0E3jafgCjzARLHcDRZKm
 xsJDNATS26k83VjDNE6CYCqbudvFeCmpBIh9N2bCRmykKjr/1YHFlzW8n
 VzrygYJGADYTXvIs4SyMSv5XrWEmuFj9TJcQymBP+eW7RxBDXnAFfk9WG Q==;
X-CSE-ConnectionGUID: YaY0sWxWS6WNRFNIt5tNug==
X-CSE-MsgGUID: I8OiPrezTSytR/GhbjrqjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25096242"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25096242"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:00:03 -0700
X-CSE-ConnectionGUID: 9IZQuvZTT92sn28eyv0OXQ==
X-CSE-MsgGUID: +QZbMhsqR8SMsqkC0tRtxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69426927"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 05:00:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 05:00:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 05:00:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 05:00:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 05:00:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eR+QBbB+nCGYrlEcTHiwlkjX/VuS+xI6tEguKvtkI5DVw95PyrMD5MATwXSczzLM9gaK7FYnXsXREaPAgXvnSshDtrI+xXrmD0y2eeDaQMqo5lXKhwxgMJmradPSTp60cFEOzkbVFz/igJ3R6gy99DyIf1fV3FAe8Uroau515PWWvAeTqeq0a6TDgFFLjjcyLD0VcVP1z8LFxRFxetiXszmbHmtCc08LhiqIcxJAbj9neBFx11gudEf0wGMNUvRuIqYvRLd8wZmkTqwDtWB678HplERvsoI4+sRpJcMQVhfOf7YTShwCWFewLW4zmq2dturuRtQvDYLK0IpusltqXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeIRK+VwFgt9vbRIlQ0PnOXDHypBi3EYbDP7wl5Y0kQ=;
 b=M1vQ5QCptYV+Z6iOhy8MQb5idulPetd42L+HcLMCdCbB9eQBuA12TTm61witX6cBtS8sdJuVsy6VxjmG1Z25BHnGBJHRanXcskzEx6VherH33cny87BfSR+22JkPwXc0Q+WDSJsVhkLx1FMFPT2Gu0RpbKWIDTSotE55a7V6WkM7mmm3Tsm6+RAESCnBS7cjqIkfbUOUtJOgN7CWX5Oc3GFxkpssT69XumV+370ph+fevN7Gr4S7Yj3Wi6lzZMCdCW2ZjTa2nkzY9+ujAbGuZJKJLRSrUktvl+LkryAD6aLJsyJLiT179JGrSIwPnnGrgrf4QqOiXeOyzAoaovuB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA2PR11MB4809.namprd11.prod.outlook.com (2603:10b6:806:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 11:59:59 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 11:59:59 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/7] drm/xe/oa: Add input fence dependencies
Thread-Topic: [PATCH 3/7] drm/xe/oa: Add input fence dependencies
Thread-Index: AQHa+ypWl11TFLBkXE2lDX5uLkYPjLJdjjkA
Date: Wed, 18 Sep 2024 11:59:59 +0000
Message-ID: <9b011eebe08c4458b48f9248d7e8082cb33a6501.camel@intel.com>
References: <20240830221618.2103948-1-ashutosh.dixit@intel.com>
 <20240830221618.2103948-4-ashutosh.dixit@intel.com>
In-Reply-To: <20240830221618.2103948-4-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA2PR11MB4809:EE_
x-ms-office365-filtering-correlation-id: 207758ce-6f00-44f3-af1c-08dcd7d96b89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UVNjejc1YTNEZXN2ME1oREwxbVpiRlhNS0tzWGZUOURTbndOS0FaRkdEcDBa?=
 =?utf-8?B?alJybWsrd3lNcEI3ZnpLbkoxcWZveG1mbElTWmhJUmpDaXVyK25PK2w1SjZB?=
 =?utf-8?B?MC91Zjg1R2V6b1gvQk1ubzdZMXExNkdDWDIvRWFQcTB5dXRidHpDQWN2UlZM?=
 =?utf-8?B?WGErMWFmcmhSSEZsWTI1akZCeHljOXkyRlBwK1VDa1pGS1FXNnBzMkM4bFQ4?=
 =?utf-8?B?ejhjcS85cDg2c1BqNUlpTWtNSjR0WDVGOS94SUQwRkZ2QlIyYWIvSXNoRUZH?=
 =?utf-8?B?ZDF0NGZWS2NySDVaSDMrVzZQY0dpUk5GQ0FRQmxoaHRzMmg5U29aZE12d3B0?=
 =?utf-8?B?bHZhYlZ5VU5KY2pUd2t1Sk93MkRGcFBTMXk0SGgrU3lFVVRibGEzelBKMDky?=
 =?utf-8?B?TW9IRWFBOHFhaHZxVWJ5WTUxSUtrN1ZsM0N6T0RFbXBWOVYzWmFsdEFrSGIy?=
 =?utf-8?B?Z2I1WjJaaTZtSHRXRTZkN1Rtd0JmbFFHVXd5ZnJCb1E2aGQvQnNsaS9sTDdi?=
 =?utf-8?B?ODMwU2t2bkRwVDY4VGN3Z2s1eElkZlJHSWgvSXQ2YmJyUFRSNGJZTFpmVlM3?=
 =?utf-8?B?Tnc0VGlDR1lmK3crZjdiZmRQR0FHWHJGY29aeGovRzV4QVE4VlROZnJhTHl6?=
 =?utf-8?B?amtyUjVNREI4VHlvQVNadWk5WDBvelh1UjVVR0xuVW56c0RhZFpzQUhENnRt?=
 =?utf-8?B?ZVlBdEhVYWI0UWl4a3ZiOXFvYkFxZm0zUk1zbUg1OGUySnhRK2tQdHRPRHI5?=
 =?utf-8?B?aWI4cWVyZVNDREw5Z2NkUTNtcm9lZFFMMnB4ekkrdTliOEpydW5qWmEzT2hM?=
 =?utf-8?B?QjhGOWpQYUZTbnNWOGcxTXFnYTBSQWxvQ0xmUStKaHhQc05hRUZ0eUFIaG1i?=
 =?utf-8?B?ZThkUlUzbFBYSjE1KzBCRldDdmMvdGN0ZjFuZ1NrQjZ2a2RZS3gxYmE5dkd3?=
 =?utf-8?B?K3gvM2dmZ3ZDQXNNajN4a2hpbmtuQ0JrM0R3dE41dEY5Q0o2ZmFWKzRBcXgv?=
 =?utf-8?B?QXlFNDM3Y1BYem9FeU1xYnBoaTc0bHpMdUd1eXNwRStXNzF2enUvVUtKV0FG?=
 =?utf-8?B?MTJ0Qm1JaGdsRVdOU2pTaEtGQ3ZYOU5PbThUYlJmV0o1SmZEK0ZZdEcyWmJ1?=
 =?utf-8?B?K3FKeDExS2EyWUg2OHF3dW1PUkRia1JQK3VIdjcyRk1kMU1rcWRYa09ibzIz?=
 =?utf-8?B?aUhmandLaExPWTBjbjN3UHkrb3BZMG5TdGJQb1BDeXhjcUkzZjluU05RbnZq?=
 =?utf-8?B?eEk2Z0JNdWtMSjRxOE9HL0RJUXMzaUt4QkpvTzZlQ3BqaFdZYUU3Wk5keVBu?=
 =?utf-8?B?RnRoSW13V0F0M1dHcWRWcXU0amQ1Uk1lbTVNb0NvQ2l6eGY2aDV4dURwazFi?=
 =?utf-8?B?Wm9RN3ROMWJCY2pVT3ZGS254NzZSNFFYVzUyTmdVd2pGSno5azI5MERMRDM3?=
 =?utf-8?B?UmhZT21XWCtIWlZBTjh4SWcrTHkyN3U3WkNCNEhxRWx2Z0dSZFRyYWtGemRD?=
 =?utf-8?B?QXpEczNLL09QRkdZNzl4b2VGRjFDTnVpNnpkTTBoYzRZcGMzb2xaQVp1R0ZS?=
 =?utf-8?B?YzlLaVE0RjZlRUd2eUVvL2xreHRxUlBkM2RYb3h3a1l2SkR1SGJKRzY4a2h5?=
 =?utf-8?B?UGo4SVVZM2VyMDNHbXRGREFMNW5xUDlhMzNsdnIxWUNJbnFNeWMrUnJQUWJo?=
 =?utf-8?B?Tld5WG9YejBxTDhYTHNJQWd1TFNJZEVhQXRkbE1MVmJ5T05UY0ovb3RUeWpD?=
 =?utf-8?B?bzk1QXRPaFltREZRWm1jcU9td1lZVGVmeGhHcGY2czh4UFJEY1ZzTGtyc3R3?=
 =?utf-8?B?cVRkcC9JelZpQk9LYlNzSGJ1Mkc5RzkxeDFSNEtUdG16MUFaMyszZENLekNZ?=
 =?utf-8?B?RzM3cHI2Nlc0VUpwUWtnWklDTVVBTm5XTCtzWlBDa05Ianc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alVqSWlxODV5WkgzT2VsdnZ3YUZlcFZaZFZDempKUVBZRkFCWDEyWmJWTU9O?=
 =?utf-8?B?ODBjRDZqUVRraVp5VWF1SitmcXh2S1hyVkdoLzNEQjRWRkQ0WTMxZ3pHa1NT?=
 =?utf-8?B?RFdBQTVVcktheXNWUDRha3RhTDI4UEZwZy9RYkNoS2MrR3pQZTZNdmd1eTVK?=
 =?utf-8?B?UWVraktGMldETzdWMkpONTlyaXo0cEN5bXdsdGRTeUphZkRBU2dSTFZJUWtM?=
 =?utf-8?B?R3RqRnJvdUhsMVB0UU9Vd3NxUUdjUUhtUTBwT3VSUkFtVzV0S0VXOCtPUHVH?=
 =?utf-8?B?OGRGU0ZPMktWQkdyYkhlZ2ovTnp3eFF1UWlLczhqQ0tCb1R5NHIrUG1LZGJI?=
 =?utf-8?B?T3BJaDZMS2RnZloranF0MWZidVlHNG5lZFZUaXFPMm5BWC90cDZZZHZ0c0J5?=
 =?utf-8?B?YkpwUjlkRmNRU2xsZTRDeHhqNXhzaHZBa1FNVzJzNS93RWdoUnVub0wzZklx?=
 =?utf-8?B?RlM2Y0NqeEF3VGVkZVMxQ1ljL0NpVEtTUFBPcE11TndTRExjRzJoMlJLZWlh?=
 =?utf-8?B?SXdTTUFQS3lYMHhPdGJTdkdja2R0bmYwU1ZTZEFINS9oMjJyampMN3NENlp3?=
 =?utf-8?B?UmdERTdhK0w0eTgvTXpWVmV4dUlsZGdjQytzZ0dBYnVuK2dnK3M0bmVnUWt3?=
 =?utf-8?B?SzJZR250ZlIwcVBPMXlJemEyamdUaXdhUnh1d2R5T3JLWERLM1QwTUpWZ1dj?=
 =?utf-8?B?bks1UEowZmNHRHRHK3dBOTRTOUltSFhhUVlQYWtSdUlUWDJJbjE0TG9SUC90?=
 =?utf-8?B?TzIxL3ZtRHFBNzBSMzg5MEFHSzVRSVhJanZOdlNuYVdDRVNyQkxRUGx2TUY3?=
 =?utf-8?B?OS9FK1JidzBoSE9HdW9uUXg3Y2V3R1lkUUFDOGJOdHg2TmNpcHBKUllQSnVq?=
 =?utf-8?B?aXlWOVRSL3dVbUEybWtGSGhQbXpXcEllVXVwYXlPMXRlMzh1a2lBWmMzcG0x?=
 =?utf-8?B?L1g0ZXpIUGhublk2ZlloMnBrMkE1cDFyQU12WmFYUVBXczhZUTY1MzludStj?=
 =?utf-8?B?Z21zVHR0RU1ka0JoSUs1SGxHWlR6T3R1K1lSdThrdkJBT3Fyd016dG80Zzdu?=
 =?utf-8?B?NjgwVHdIM05sdmpMd1k5bFdDdU80cUNzdGRobVhvVlk4Zkp4eDQwNkNZbWtz?=
 =?utf-8?B?aEhQUVVwQXBoaXg2MFFON3JBQW5pL2gwUWtIbGxiQ2hTb0poOEdTTlh4RGZI?=
 =?utf-8?B?a3pOeE1ZSU1aUUV3UGo5aW91M3IxZXp2OEtIM1Y4VE55RHl4ZUI3dFVvcWxH?=
 =?utf-8?B?YitqZ0lHSllSSnhIdTR5Qk9DVHMvdy9RYitsUndvRCtZbk92SjA1U294Y2py?=
 =?utf-8?B?U3QxbEVmL0VScUF5TEFob1dHM0tLOFZxWTdUa3dQTUFVNFcyVEFvK3l4VUJu?=
 =?utf-8?B?NjAwTW1kenBaUDZ2dytxRXRTZlRqaFZYRWszd2tVOFZGK3JqZGF4ek1iWWdZ?=
 =?utf-8?B?VkdJc05NV3FLMUJ6K216N2txRy8ycXV4aVpoT0xPVnFGbEdZNml5S1gzdGc0?=
 =?utf-8?B?Q0pIeWNFSW1KUi9XQzk5alpvMWIvdUpKUVlxRlZPTWxFYm5CdysvVlNIN042?=
 =?utf-8?B?UXVCQjNCdHJVRkpVNHlDRmFVRmRvR1BXMHpLMzZNdlBOcWgxQVVhZmxpTURm?=
 =?utf-8?B?SWVTTGNpVktkTUdtTVZ5bENOM0xOQnZQQkZaRlMya00zNkppOWhEc1k5WDBG?=
 =?utf-8?B?bWwzclZQYW5PMklKWUJGaTk4Yy84bUJHdUlqK045TzFNaWJEYURYcE1yK0Fi?=
 =?utf-8?B?ZFJvaENvUkVrZ0VuOUVDNXJBS0YzSkVXeWRqYzJSbzcyQzlzQ28xbFJtOHZZ?=
 =?utf-8?B?UC9nei96Vkp1Z0pUdTlZYW1IY3pwMzBNak1BNXYyakpSd2xaWkxpSThyQUQx?=
 =?utf-8?B?T2NkVEhmZlhLbXZmM1JxS2U5UTBsVk5ZNW4rVGZoemxxdkxoM1BvK05Xbi8y?=
 =?utf-8?B?cFE1d3MrLzVhU0tiM2lkVG9YMHNnRVZYTnMwVEZ3T3BsVUI3blJVaEhwaUlC?=
 =?utf-8?B?OUNzL05WSVU5aWluQVhMMnU2cWlsRS9VOUJkUUgzQTV4NmVGR2lKQmxDb0Q0?=
 =?utf-8?B?MmdtOG45MVIzZmxuU0M1c0ZLVmVNeGRrRHJzRWg1bnVxM1p3ZEw5dmJ0WHV5?=
 =?utf-8?Q?zPOXJSrIQa01IMAdSNiN4Ydxg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD732E492086DD4ABBCB73712602793E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207758ce-6f00-44f3-af1c-08dcd7d96b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 11:59:59.1780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fPYrrPYwg/IzKiqsuV+Iwu9+k01TlTNKmmp1cT/RdwD5jsSHHZhbZbczmxGYLwTT6+ln4Nb6WfP82nqZqOO4jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4809
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

T24gRnJpLCAyMDI0LTA4LTMwIGF0IDE1OjE2IC0wNzAwLCBBc2h1dG9zaCBEaXhpdCB3cm90ZToN
Cj4gQWRkIGlucHV0IGZlbmNlIGRlcGVuZGVuY2llcyB3aGljaCB3aWxsIG1ha2UgT0EgY29uZmln
dXJhdGlvbiB3YWl0IHRpbGwNCj4gdGhlc2UgZGVwZW5kZW5jaWVzIGFyZSBtZXQgKHRpbGwgaW5w
dXQgZmVuY2VzIHNpZ25hbCkuDQo+IA0KPiB2MjogQ2hhbmdlIGFkZF9kZXBzIGFyZyB0byB4ZV9v
YV9zdWJtaXRfYmIgZnJvbSBib29sIHRvIGVudW0gKE1hdHQgQnJvc3QpDQo+IA0KPiBSZXZpZXdl
ZC1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBBc2h1dG9zaCBEaXhpdCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPg0KPiAt
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9vYS5jIHwgMjUgKysrKysrKysrKysrKysrKysr
KysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX29hLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfb2EuYw0KPiBpbmRleCA4YWRhNzRkYTNkYTE5Li5iNGI2ODAxOWQz
NWI3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfb2EuYw0KPiBAQCAtNDIsNiArNDIsMTEgQEANCj4gICNkZWZp
bmUgREVGQVVMVF9QT0xMX1BFUklPRF9OUyAoTlNFQ19QRVJfU0VDIC8gREVGQVVMVF9QT0xMX0ZS
RVFVRU5DWV9IWikNCj4gICNkZWZpbmUgWEVfT0FfVU5JVF9JTlZBTElEIFUzMl9NQVgNCj4gIA0K
PiArZW51bSB4ZV9vYV9zdWJtaXRfZGVwcyB7DQo+ICsJWEVfT0FfU1VCTUlUX05PX0RFUFMsDQo+
ICsJWEVfT0FfU1VCTUlUX0FERF9ERVBTLA0KPiArfTsNCj4gKw0KPiAgc3RydWN0IHhlX29hX3Jl
ZyB7DQo+ICAJc3RydWN0IHhlX3JlZyBhZGRyOw0KPiAgCXUzMiB2YWx1ZTsNCj4gQEAgLTU2OCw3
ICs1NzMsOCBAQCBzdGF0aWMgX19wb2xsX3QgeGVfb2FfcG9sbChzdHJ1Y3QgZmlsZSAqZmlsZSwg
cG9sbF90YWJsZSAqd2FpdCkNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMg
c3RydWN0IGRtYV9mZW5jZSAqeGVfb2Ffc3VibWl0X2JiKHN0cnVjdCB4ZV9vYV9zdHJlYW0gKnN0
cmVhbSwgc3RydWN0IHhlX2JiICpiYikNCj4gK3N0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlICp4ZV9v
YV9zdWJtaXRfYmIoc3RydWN0IHhlX29hX3N0cmVhbSAqc3RyZWFtLCBlbnVtIHhlX29hX3N1Ym1p
dF9kZXBzIGRlcHMsDQo+ICsJCQkJCSBzdHJ1Y3QgeGVfYmIgKmJiKQ0KPiAgew0KPiAgCXN0cnVj
dCB4ZV9zY2hlZF9qb2IgKmpvYjsNCj4gIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsNCj4gQEAg
LTU4MSwxMSArNTg3LDIyIEBAIHN0YXRpYyBzdHJ1Y3QgZG1hX2ZlbmNlICp4ZV9vYV9zdWJtaXRf
YmIoc3RydWN0IHhlX29hX3N0cmVhbSAqc3RyZWFtLCBzdHJ1Y3QgeGVfDQo+ICAJCWdvdG8gZXhp
dDsNCj4gIAl9DQo+ICANCj4gKwlpZiAoZGVwcyA9PSBYRV9PQV9TVUJNSVRfQUREX0RFUFMpIHsN
Cj4gKwkJZm9yIChpbnQgaSA9IDA7IGkgPCBzdHJlYW0tPm51bV9zeW5jcyAmJiAhZXJyOyBpKysp
DQo+ICsJCQllcnIgPSB4ZV9zeW5jX2VudHJ5X2FkZF9kZXBzKCZzdHJlYW0tPnN5bmNzW2ldLCBq
b2IpOw0KDQplcnIgbmVlZHMgdG8gYmUgaW5pdGlhbGl6ZSB0byAwIG90aGVyd2lzZSBpdCBjb3Vs
ZCB0YWtlIHRoZSBlcnJvciBwYXRoIGJlbG93IHdoZW4gdGhlcmUgaXMgbm8gc3luY3Mgc2V0Lg0K
DQo+ICsJCWlmIChlcnIpIHsNCj4gKwkJCWRybV9kYmcoJnN0cmVhbS0+b2EtPnhlLT5kcm0sICJ4
ZV9zeW5jX2VudHJ5X2FkZF9kZXBzIGVyciAlZFxuIiwgZXJyKTsNCj4gKwkJCWdvdG8gZXJyX3B1
dF9qb2I7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gIAl4ZV9zY2hlZF9qb2JfYXJtKGpvYik7DQo+
ICAJZmVuY2UgPSBkbWFfZmVuY2VfZ2V0KCZqb2ItPmRybS5zX2ZlbmNlLT5maW5pc2hlZCk7DQo+
ICAJeGVfc2NoZWRfam9iX3B1c2goam9iKTsNCj4gIA0KPiAgCXJldHVybiBmZW5jZTsNCj4gK2Vy
cl9wdXRfam9iOg0KPiArCXhlX3NjaGVkX2pvYl9wdXQoam9iKTsNCj4gIGV4aXQ6DQo+ICAJcmV0
dXJuIEVSUl9QVFIoZXJyKTsNCj4gIH0NCj4gQEAgLTY2Myw3ICs2ODAsNyBAQCBzdGF0aWMgaW50
IHhlX29hX21vZGlmeV9jdHhfaW1hZ2Uoc3RydWN0IHhlX29hX3N0cmVhbSAqc3RyZWFtLCBzdHJ1
Y3QgeGVfbHJjICpscg0KPiAgDQo+ICAJeGVfb2Ffc3RvcmVfZmxleChzdHJlYW0sIGxyYywgYmIs
IGZsZXgsIGNvdW50KTsNCj4gIA0KPiAtCWZlbmNlID0geGVfb2Ffc3VibWl0X2JiKHN0cmVhbSwg
YmIpOw0KPiArCWZlbmNlID0geGVfb2Ffc3VibWl0X2JiKHN0cmVhbSwgWEVfT0FfU1VCTUlUX05P
X0RFUFMsIGJiKTsNCj4gIAlpZiAoSVNfRVJSKGZlbmNlKSkgew0KPiAgCQllcnIgPSBQVFJfRVJS
KGZlbmNlKTsNCj4gIAkJZ290byBmcmVlX2JiOw0KPiBAQCAtNjkyLDcgKzcwOSw3IEBAIHN0YXRp
YyBpbnQgeGVfb2FfbG9hZF93aXRoX2xyaShzdHJ1Y3QgeGVfb2Ffc3RyZWFtICpzdHJlYW0sIHN0
cnVjdCB4ZV9vYV9yZWcgKnJlDQo+ICANCj4gIAl3cml0ZV9jc19taV9scmkoYmIsIHJlZ19scmks
IDEpOw0KPiAgDQo+IC0JZmVuY2UgPSB4ZV9vYV9zdWJtaXRfYmIoc3RyZWFtLCBiYik7DQo+ICsJ
ZmVuY2UgPSB4ZV9vYV9zdWJtaXRfYmIoc3RyZWFtLCBYRV9PQV9TVUJNSVRfTk9fREVQUywgYmIp
Ow0KPiAgCWlmIChJU19FUlIoZmVuY2UpKSB7DQo+ICAJCWVyciA9IFBUUl9FUlIoZmVuY2UpOw0K
PiAgCQlnb3RvIGZyZWVfYmI7DQo+IEBAIC05NDMsNyArOTYwLDcgQEAgc3RhdGljIGludCB4ZV9v
YV9lbWl0X29hX2NvbmZpZyhzdHJ1Y3QgeGVfb2Ffc3RyZWFtICpzdHJlYW0sIHN0cnVjdCB4ZV9v
YV9jb25maWcNCj4gIAkJZ290byBleGl0Ow0KPiAgCX0NCj4gIA0KPiAtCWZlbmNlID0geGVfb2Ff
c3VibWl0X2JiKHN0cmVhbSwgb2FfYm8tPmJiKTsNCj4gKwlmZW5jZSA9IHhlX29hX3N1Ym1pdF9i
YihzdHJlYW0sIFhFX09BX1NVQk1JVF9BRERfREVQUywgb2FfYm8tPmJiKTsNCj4gIAlpZiAoSVNf
RVJSKGZlbmNlKSkgew0KPiAgCQllcnIgPSBQVFJfRVJSKGZlbmNlKTsNCj4gIAkJZ290byBleGl0
Ow0KDQo=
