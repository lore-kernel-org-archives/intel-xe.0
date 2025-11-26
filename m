Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B42BD11195
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 20:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA8810E008;
	Wed, 26 Nov 2025 20:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8oddWfA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2DC10E68E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 20:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764189896; x=1795725896;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=0iglHPri7XXzaAmx3QKEOuzxd7rpJB7uWhs7fqcXkyU=;
 b=N8oddWfAnHfzm2+fhu9bQgR4Uvb+nzE6LihJ0wbgmVvfw43kw7V0SUzH
 UyzY4pAF4o7zB1/UedBlIVVRG5nyqbWt6z2YPUpwzOEqe6/lfJd/1T3Mt
 1AgNPZ9sPu4yU2jkyny9LDS2mSGnvTrnNANT7IgD2jEtxVqsOrz0F9rIE
 JWlBc0YQw0lNUiCepHGpZYT0n1NKW2EXTo5pQAPEwV01Jqah7sY9q+L91
 UJVXk/eM+XW3IuCQtsyvNhnp9tOC+MdA5FmZ+bqOMeHnXiv9f3aZft83a
 EXPmcTXQi2zdULDogZ0M+/5zmZVG8LShi7dVylwayOh8abiUEaMFMf3/5 Q==;
X-CSE-ConnectionGUID: ms/2Yuu1RwiJXPtum0lcrg==
X-CSE-MsgGUID: 64HcNA3LT9SwNKbw7SYXFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77342964"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="77342964"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:44:56 -0800
X-CSE-ConnectionGUID: 22HWORJnSh+nKudUPqaSwQ==
X-CSE-MsgGUID: VuWnzySQR4mfvGr54AF9EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193143215"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 12:44:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 12:44:54 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 12:44:54 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 12:44:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhGGOsvGgMGiz4CFunBj8rA0maoxBFs2OiJyVoADSHVN88ZrajtixVFZwmqVd2e+zpCB69b42UK4+nIAZoWkHd1F1dOhy9zd1i1F9hZclkz+SO57wCLMe/Czvn6Svj8qjKxr0GG114Zu+/I0Q3oJT3UQphexHDNQmo7Ws6S1tZhAySs7LhaKSsWLhqWFI+KiOdVAukq2MxjJ61iX5no1ugsoKS7sjh+WE/V61bgRj90Gxb4EGSJvRH9ZgWPdrdKppPW3Eck12j8gOzYNH6qs5Raxx7cYCmIzYS4X2E8Dg0uGldbiGH61fZYwa4TMVRDXaibL+xixeaizbVNtQS1Uhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iglHPri7XXzaAmx3QKEOuzxd7rpJB7uWhs7fqcXkyU=;
 b=c4WMRuaSeuyftQ7FPgxRzu4JWZxI4OslBojuBWlSAI/B5lgzkKxrg4jL8maw4fbacNxKnC3obxS8miZeZpqqDBgJHi0fuwY/ZJoz2lPV9PCRQ0H+LkG8jTbCItHzMpoFLj4dOpjgMNgpztfg5zMkHqrj4d5axGYSOKbHLPgAFnsGhMFYxQLixfE2ZDcmPjNE56+ZcQhUSS8rSd++z9uCr8bD2DEXsqhkuuRbfQpacndstoRhP4uVoLHuROQ9VYZA6Mq1BMPNs8bppgWkLvq/ikCU6eayorcYYaP4GN3eaQ+kYKMBEpCg44oeP9O1NELBZ6OZoELHsYAjQJYAzpGZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA1PR11MB6664.namprd11.prod.outlook.com (2603:10b6:806:258::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 20:44:51 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::7396:3750:f6eb:4765%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 20:44:51 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH v5 7/9] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Thread-Topic: [PATCH v5 7/9] drm/xe/uapi: Add
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
Thread-Index: AQHcXwb6/oQ0sUeOK0mxSQWmkLBfZbUFbKUA
Date: Wed, 26 Nov 2025 20:44:51 +0000
Message-ID: <1f5e8d8de449590f4ac85cf74e1feda2e1373c89.camel@intel.com>
References: <20251126185952.546277-1-matthew.brost@intel.com>
 <20251126185952.546277-8-matthew.brost@intel.com>
In-Reply-To: <20251126185952.546277-8-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA1PR11MB6664:EE_
x-ms-office365-filtering-correlation-id: 21626c8c-5db2-45be-fe86-08de2d2ca5a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ejhaVStWMHdiL1NRbGMrZU5URnZBYWtYRGx3dUNJcmlXaHBLN1l0OGFuT0dV?=
 =?utf-8?B?ZjlPL05pa0c1VDVkV1dhTE9OVVYwOURkclNyaGdnd0JTOWFKWDU1YnphQ0sx?=
 =?utf-8?B?VnQzM1lDVGVrazJlK0VxZEphdkJraDlIT0dReHpaWDNFUWtFazRzaHpIeTEy?=
 =?utf-8?B?TDNxa2ZrTUpVUVNwNnpqRTZ2azVVcHpNcllHbTFreFB0QjBiTVRyaE80aDFw?=
 =?utf-8?B?djN5cExyc3FoRDFFVkxTL0poNG5kcEl0cWxKYlZmalB2S2lDRkNIRzdWY0V5?=
 =?utf-8?B?K211MGZKQytSblpsY0p0MSs5T0pkc0d4K0RJbnhzWGMxQ1lEa3NVNDB1MGJQ?=
 =?utf-8?B?VkdtSFFCQzQ2b1Zueis2d0RXZ2tnQXBYZjVkZEVnQ2tXRWM4b1VQTS92eVQ4?=
 =?utf-8?B?b2NRRkFGVVd4Tm1Xcnp2Y1UxeGtkUlJXeEJzeWFJS1pJYlEvaUFQTWp1WWVL?=
 =?utf-8?B?d1RnY1pOWm1kVWxSRTBpZjJvNlN1dFpDZlBGa0pGWHI5WU53OVAxbTJBTFNT?=
 =?utf-8?B?SVNvR2hyNEdpYnE0K3M5Qm1BY2V2Z0RWSkM4ZldBR2YyWlB4OXZPS3NCdTNl?=
 =?utf-8?B?VjhYOXZFNXpDUlBkdmVTRDBNSTRPNkJQYU9PUzZraDFacVozWXV2TXpVSmZZ?=
 =?utf-8?B?WUZOcEgxVllnVlB1R0hvWlRHYTQ5L3pmdmtzWUhVRGtqZG02a0RMazdLU1o4?=
 =?utf-8?B?L3J4Q05WNkRQOTl3Rlg5cFd4RXo1dzN1Rm1BeUh5WnkzVlhFOCtTbzBiaEtN?=
 =?utf-8?B?bzJja1NZbFJaL3p6dlhYUHlJdStJcWZxb3ZhMnJsWUtINGRBRG9QMmZQTmtF?=
 =?utf-8?B?SnQ4U0VHOUdUS0kxTTlrVHFBcWM2TncraklLbTlza2ZUcEZWVExGdmN3Z2J6?=
 =?utf-8?B?S0o2KzhRTWlkQ0c0THhDYWJZNkljUytpUVZ3S2ZMUnpOSFE1UVlPOFg2VkZ1?=
 =?utf-8?B?L3dTNFBsRk1nVTd2bk5saEFEVzZtTDlBQ0hCYXR2QzFnZWk5d1BZb28xT0cy?=
 =?utf-8?B?UkNPOWdJT3VycjR5SG54RjJPSkZxVDl4VkhnSnhTZnFodmQ1MkFMMlAzV2E0?=
 =?utf-8?B?a0p0Z21JUTk1RWFsOWg4RTlwQ3JSM1I0TExiM1UxWWdXQkxreG4zNEptMHho?=
 =?utf-8?B?MHhrOXN5MTF4dU4wSXYyVUZ5TysxbjdXZGJGN3MrNEpDUmhiNE5xSXlWR0lB?=
 =?utf-8?B?T0VpQW1GS2VITWl3OWxNZWl4RDVYRWdtdVR6RVR6c2lEdDBBMi83QXZSYlNX?=
 =?utf-8?B?UU1lL2VzeVl1MHJGRjU1QmN1OXh3MnF2MEJNUWR0c3pZOWRnVFZMUUlZQnEx?=
 =?utf-8?B?azg3QWJjOFJrMnZ5MDJDdTAySmNDOHBLaGVaamFJZTV6ZEUzMVQ0S3pYZ1Jr?=
 =?utf-8?B?UDFPRVM2T3hLY05XeTkyaklCSG1reitRSzVjU1QvR28raTdJcUs1dE1hZ3VI?=
 =?utf-8?B?S0tVcWpHR2xvU1hlV3pEeit2ZG11emVYbENEOUU2V2NNZFFzOGZSRVBEWkNi?=
 =?utf-8?B?ak9OdFZXUHdLYUtueXJzdmc1SXpUNUFCRVJ3T1FNWGUvVmNCL1ltaGxTTHRz?=
 =?utf-8?B?M3BHNWFuYzExRFYweUNzS2FLUXhzd3RjclVheTR3MzRna01NdnhKekRQdXd5?=
 =?utf-8?B?M0NuSUNIN1JsTzVQOFdCZW9CNStqT211WGtGaFM5dGFRM2VNZk94UDNxckRT?=
 =?utf-8?B?TVZRRktnVFpLeTQ1U3UzL0RmNVVsSE9CNDVLbllNRktia0IrcS96ZEhmN2hL?=
 =?utf-8?B?UW1qM0l1aXY5MGQ4VkdvcUNJRTFWR0pybGNhdk1HUXNTaXdOV3hjaktKRlR6?=
 =?utf-8?B?bzMwd3Fybk9NeExaOVFUNlZ5eFRFS0YwQVZNY0ZmeVVoUjlxTzBNU1NrVjgv?=
 =?utf-8?B?dVJVb2xzRnhRY2RzMGRZK2g3SGJ3Q1JXZHMrQ2NZZk1yQ2g2RklnVTFZT3Rz?=
 =?utf-8?B?dFpuM1RVMVNaOFFndFdvR3R6eFUxalkwK2pZMkpaMWl0RkNRMjZXblZWYlNo?=
 =?utf-8?B?Z0prd0RiRER3M2RHRDg1aDV3TWRuZFBOWlI2SVJXdTNkQnZQdGtZeHowS09n?=
 =?utf-8?Q?ap8J83?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDhNclR1a3U1WUNOVEo5a0VxN3NESllZOG93TXJ4TWIwZ2JkUCtrM2tma01D?=
 =?utf-8?B?Qi9pQ0NVU3g3cWR2QnQ4MWlhVkY2RjNBN0NGVmtGbjVZRyszaDhiSGkrREJx?=
 =?utf-8?B?MGVYMitDWkh6Y3JEcjdHRjRMRnFzNW1FQlVoYjVscENGNVFiSlBHVk9Ubkh6?=
 =?utf-8?B?Rjg5YkZTYmhrUDN5b3dkQ0E0TitVaEhxTG9xaytwNWZmRXZ4OVNlSUFpV0gw?=
 =?utf-8?B?UEV4cUY2RUYvOEd4RmZoSUoyT3Q5c25IcGFReEk3eVJkenRGV1NNSHIwZU0v?=
 =?utf-8?B?N0NZaklNL2l1MHhsV3dOQWFTQUdMUGtGOVBjY3NVMWpPZ2hEMVBCNEV0QnNE?=
 =?utf-8?B?UXl3dUZDM3hmeDNQZmU0MjZRc2hxWXc2VlJwQmxpMlFrRHYrVWxZWkdDUjEr?=
 =?utf-8?B?bFN2eWJWby9OS0tETFN4RjNpUjIwRURYcXlPYnpTTTA3WnV2NEt5aklNNHhO?=
 =?utf-8?B?SjgzUnZVZ0thV1JJZExtWlpKS282MGdTczExN3pmODBrN1Nab1FTTUwvclJx?=
 =?utf-8?B?WHJJelQzbXQrMGpxMWlEekZVZWFsSUc3OGtFenZIUk1KbnBJT1dIT3RjNkt4?=
 =?utf-8?B?aUpyOHJRR0gxZnJpMnBKSWVDUjRaRHdRa1N3Tm9lOGFCeHpFVmE2MVdUK1RX?=
 =?utf-8?B?QUNLcWdla1NVTDl0UGRqN0dCa2RtakVKL2kzUUt4VHNaRUllMG1DQmJGcm1X?=
 =?utf-8?B?U3hGMVdSZ1pKV0pMQzJCcS94NzZBNVlNVUsxLzZML2NSeVBWQ2taNi9BVElm?=
 =?utf-8?B?YmlCdkt2SHVEYWJ4VUYvdU1WekdyMzErKytKV0h6L2RucUNUN0krRFkxdUxR?=
 =?utf-8?B?QnFaNHROUHhERWxraEk5d2hGSG1qOFR2Njhtd09mSWRRQzFoSTAwUEp0cG0z?=
 =?utf-8?B?NjRJSWVISTM5REVIOU5FUFdzWVEwY3dnNUttNmtLMFhLY3MvOTB5ZFlEd2Ft?=
 =?utf-8?B?UkNZZlE3ZmNpQW1USS9pUGZWd2puak1HNlZnVVNGMXU2ODhhZ05FWjNQbjBq?=
 =?utf-8?B?Lzl0bTNhUnNSdlhWZVVuQUF5cm5WMlA5ZEhEZmNoQVB6a3hSeVZCQWxQNzRz?=
 =?utf-8?B?OXFGQ3IvdVRzYnl4ZmhzTXpmSHp5V3M4MEhJWEZSNE9USDRzRlB5MzRKS00x?=
 =?utf-8?B?QjlaVDZvclFTMVRvNW96UmVQMUhKa0dWL1l3UzRCOFBtd1dDRHlaY1AwR0hx?=
 =?utf-8?B?ZS9sd3RnYUI3dkN3RVBmNG5TNXJUSHVqS2FnSkVEUkxQWGVwUTkwSnlOWk5V?=
 =?utf-8?B?TFZHSllrYVY0bWZ4UW03QlIvajNpVEdQQmxrbEcwaTVPWlZDOUNPZzl2VGo4?=
 =?utf-8?B?WkMyaU9UUEFidzN4bHdTZ3J6WTJBTzU1eGhIenBWZTFSZEd1OHVPQi9SVnkw?=
 =?utf-8?B?VTVaWi9tMVBlblJWeXc4ZVU5a1pwaHhRT1NaRWVaZlNVT09QSFlscUhZblpq?=
 =?utf-8?B?RERiazNXMG1Wa3Q3N2JEdXZxdTI2Y2ZLZGpXanBmU1pPYW1mcXBnL2cvTFll?=
 =?utf-8?B?NGh4WEo3R2F6ZXozaGRhYmpwNkFWN0J1MnZ4SEtHaU00TEFUWTFNaEdGYWtF?=
 =?utf-8?B?SStKTU91dlFrQTY5R2VPbG4vMk1pSVpDNHJGVHhwYXlZa0ZSTVc0SkpZWnFF?=
 =?utf-8?B?VUd3R0E1VEhOL3I2UnIvUmFSTFBpdnlxOHp4R3hzTm9Jb25LaGh5akZmNndN?=
 =?utf-8?B?V3BUTHd3V1FLelF5Rm9VeE5VL1NES0s2eVlmaXdpZ2cyUC83Ulg1WHc4bnA5?=
 =?utf-8?B?TVZOVm92SW1QTlZuT3FWVE9oa0VSZ3QrWGc5U0I2aWFHdzhDNXNxR3djRDVo?=
 =?utf-8?B?VThMV05VOTl1VkZXbGVlNjEyRTlua2NPemNkNGoxOE1hR002WUJiOEl4Tkti?=
 =?utf-8?B?MzFEbnMzTU03Q3ZEVlZhVTcwSkZQUmZ5K3M4TTlSVE5rSXhFUkRlTmtlWCts?=
 =?utf-8?B?ZjdNRDhnMnhjV1BWa1JqUnp4c3NQZnFmNjFpL241dkJjR0Q0NGx5Z1Q3UG5B?=
 =?utf-8?B?R0JJMndQd2pQby83NzdlWDhWd3V5cFRkQnRNVUY1N2FJZ0tHUFB1Y3l5MFJr?=
 =?utf-8?B?SlZ1ZHREcWlBTFQ3WXY3VklncEJHMmtRVVFWYk9iTzN6K21Pc0E1VUU0TVJp?=
 =?utf-8?Q?OUsMNefLrest2wz5JNF6VlN8N?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0ACFD1DCC1C5D54494D6399173312B36@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21626c8c-5db2-45be-fe86-08de2d2ca5a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 20:44:51.4138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A/OKc0qBym6nH3lp0IlC0Y8hadX6qrXFC17ojJC14O8JH9g9ADjCa9IL5ZxpgGMnI16c/IwIF+DvK9fIFc4ptw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6664
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

T24gV2VkLCAyMDI1LTExLTI2IGF0IDEwOjU5IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBBZGQgRFJNX1hFX0VYRUNfUVVFVUVfU0VUX0hBTkdfUkVQTEFZX1NUQVRFIHdoaWNoIGFjY2Vw
dHMgYSB1c2VyDQo+IHBvaW50ZXINCj4gdG8gcG9wdWxhdGUgdGhlIGV4ZWMgcXVldWUgc3RhdGUg
c28gdGhhdCBhIEdQVSBoYW5nIGNhbiBiZSByZXBsYXllZA0KPiB2aWENCj4gYSBNZXNhIHRvb2wu
DQo+IA0KPiB2MjogVXBkYXRlIHRoZSB2YWx1ZSBmb3IgSEFOR19SRVBMQVlfU1RBVEUgZmxhZw0K
PiANCg0KQWNrZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwu
Y29tPg0KDQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IENhcmxvcyBTYW50YQ0KPiA8Y2FybG9zLnNhbnRhQGludGVs
LWNvcnAtcGFydG5lci5nb29nbGUuY29tPg0KPiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2aXR0
IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBpbmNsdWRlL3VhcGkvZHJt
L3hlX2RybS5oIHwgOSArKysrKysrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0v
eGVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IDQ3ODUzNjU5YTcw
NS4uMzc4ODFiMWViNmJhIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5o
DQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTIxMCw4ICsyMTAsMTIg
QEAgc3RydWN0IGRybV94ZV9leHRfc2V0X3Byb3BlcnR5IHsNCj4gwqAJLyoqIEBwYWQ6IE1CWiAq
Lw0KPiDCoAlfX3UzMiBwYWQ7DQo+IMKgDQo+IC0JLyoqIEB2YWx1ZTogcHJvcGVydHkgdmFsdWUg
Ki8NCj4gLQlfX3U2NCB2YWx1ZTsNCj4gKwl1bmlvbiB7DQo+ICsJCS8qKiBAdmFsdWU6IHByb3Bl
cnR5IHZhbHVlICovDQo+ICsJCV9fdTY0IHZhbHVlOw0KPiArCQkvKiogQHB0cjogcG9pbnRlciB0
byB1c2VyIHZhbHVlICovDQo+ICsJCV9fdTY0IHB0cjsNCj4gKwl9Ow0KPiDCoA0KPiDCoAkvKiog
QHJlc2VydmVkOiBSZXNlcnZlZCAqLw0KPiDCoAlfX3U2NCByZXNlcnZlZFsyXTsNCj4gQEAgLTEy
OTIsNiArMTI5Niw3IEBAIHN0cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9jcmVhdGUgew0KPiDCoCNk
ZWZpbmXCoMKgIERSTV9YRV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9QUklPUklUWQkJMA0KPiDC
oCNkZWZpbmXCoMKgIERSTV9YRV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9USU1FU0xJQ0UJCTEN
Cj4gwqAjZGVmaW5lwqDCoCBEUk1fWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFlfUFhQX1RZUEUJ
CTINCj4gKyNkZWZpbmXCoMKgIERSTV9YRV9FWEVDX1FVRVVFX1NFVF9IQU5HX1JFUExBWV9TVEFU
RQkJMw0KPiDCoAkvKiogQGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lv
biBzdHJ1Y3QsIGlmDQo+IGFueSAqLw0KPiDCoAlfX3U2NCBleHRlbnNpb25zOw0KPiDCoA0K
