Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D100CA1017
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 23:01:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015D310EC66;
	Fri,  5 Sep 2025 23:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MbhZEW8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E421A10EC66
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 23:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757113281; x=1788649281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=taF74rpc+YJSKaHwh8bdi1Z8B+jWnOdF/5AZweuPccQ=;
 b=MbhZEW8QqbjLxjY2LqxCkR4DEPgmTFCmO3vOgsgF1jO3HykusO9xI+z9
 59cJvt2bCuwb7F4Wy2hIKajALvt3ykVHWDUBs3PlY9qhbMCe6hNjDQPx/
 pytfJdWrQffMHmT0jeOpMRD38gqjMPR+uLoy8U3b/21hP2L0YIvcuz9gf
 Z+b4AJp/Cmv1WTSlMjgdMIj7Wat1eRApNRyN+w0EJcQ1VMf0yUEVk/OhU
 14IZ4e0Jya8k/qjNvFCmflbuFPu6h7kQXqViKn24/Cas6RgZE8bWE8Rib
 yWwvnFKFy4sjveXYPbbUZEBa3kz1zkqLP19yO5Hoha5CUiMMY5WZK02VO w==;
X-CSE-ConnectionGUID: JkxxVQ8kQqqDypB2YOPe8A==
X-CSE-MsgGUID: QC8SPzfETGqhwBRRJBiApw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59325638"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="59325638"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 16:01:20 -0700
X-CSE-ConnectionGUID: VyTtNgCkRbm5+IIIaKJljg==
X-CSE-MsgGUID: LzbbvX+pSh2V+jcaxB1KBw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 16:01:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 16:01:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 16:01:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 16:01:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNZJ5e+JjPmHBhiRE1FhvWNNt6UvDrDPe8/jvZVbpXxDqL4Urx86sZblRZ4x+SFpqrbPO/pTSkKnfiwuuQPbV24oNcc7hes3DaVcnE7xiSZB64Tw3tNuvEMnHitMn6N07iJ7NCZ3DHE2mW2BAE/GbIK1VyQNw54/hI62Ox1t5skwm0EnAL532RavwTKaaC9t782Vgw1UC2PuyHr8aHjzyHj0tt802bDr/78V0FTM/vFtP3icOjv1LjNVokOfcTSbLuAJOPs5eWxbcH5uw7sCRZoldvufWOaklKkdy3D33QsSn1TxvIrDOM5Kp4MDI9+7Oou+W66sS9juU3etQ9X2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taF74rpc+YJSKaHwh8bdi1Z8B+jWnOdF/5AZweuPccQ=;
 b=DeL9QZKOK2/0cEpi3CeNNbDuLukHZmCF8nlYjRO2yQdFnpfepoUZSFB/7O1sV2rEP1Ncc9SgHkagnNx4zFg4+u7zBtjpBIboA+K0jfVNtAX9ZGWDCnR4JrIc+1bYTm6ymUKsaxKiuOkzUpeLzVWjmRskIJ7IcMx6KDVDYPiywgx8SUCi1Ygo9Cytz33IElyC/5jDy9DaxZpVtrVZRaeeuX88xZy3tcyL3lB7jWY0Dg89aS7Pruslh5oHry28v/D/rcE7QNSjz433TkzEhuC26128+EVc2elTN8YcZPgbE2F0ZdudUfZvyE4AUwmLOZCyXln1j8p3B7hXVOwd9ReRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH3PPFE26A71A1E.namprd11.prod.outlook.com (2603:10b6:518:1::d58) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 23:01:16 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 23:01:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bai,
 Zongyao" <zongyao.bai@intel.com>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Thread-Topic: [PATCH] drm/xe/xe_device_sysfs: add cleanup action in
 xe_device_sysfs_init
Thread-Index: AQHcHq1mVlCheXAmIkGs3JHrBG6e1bSFNJMA
Date: Fri, 5 Sep 2025 23:01:09 +0000
Message-ID: <b846e886fbcacb1265a408c8e077a842971e9c1c.camel@intel.com>
References: <20250905213738.2936785-1-zongyao.bai@intel.com>
In-Reply-To: <20250905213738.2936785-1-zongyao.bai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH3PPFE26A71A1E:EE_
x-ms-office365-filtering-correlation-id: 208d74de-f9ab-48a7-fe70-08ddecd01a8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VXgxVi8xeUVacUVOMWFjTWtKV1ZpT2NNTitnWXdTNjNLc3N2R3RScERCbm56?=
 =?utf-8?B?TG1jQmxhdTROK2JLN2JOUEF1T0dSYmo1alhNdVNPdnJKTVhaUlB3VWhCdUVq?=
 =?utf-8?B?cGo5bnY0UzR1Z3F4bjFpYW9pYVc2QUtJRTVVVW81NGlmRGdPWTJrSWlPTy82?=
 =?utf-8?B?MmxTMzQ1VHZvN1hpNE5UU0Ixb0pWV040TkI3RkhZb3dYc3dXaU5hZ1c2V00v?=
 =?utf-8?B?QlN2R1pwQkFrRmp5SjRrMTVHd0hMdEg5UmJJazBJQjJmbG5Jd1d5WUNYVUdo?=
 =?utf-8?B?VVkrVWE0U2hkRHFVZU1wejVnTW9wTHNTYkxkT08zdUREbWF5NGZ3TjFERVIw?=
 =?utf-8?B?Nzg4U2Q0OEgzamZnRUxtZGZpUkk0Qy9YakpHZ3JzODFaU0d3REpVYkVWMzgw?=
 =?utf-8?B?MGFqSXJjTWVxNUMveVIxK2xSMTI3Sko3WFNZVUhpMWhCb25mOGxLQUE5ZXMz?=
 =?utf-8?B?OUhIcVEzcnNMSEdDWldUVkxjQnBvdjROZ0h3K3dWbi9vT2FCN3ZodGdKanp6?=
 =?utf-8?B?eW81M20yZ3ovbTU3aEw3YXlqWStPWEJsYlJkeG9Ua1VUZS9uZExrOUk5TzZO?=
 =?utf-8?B?Y3FTeUM2SUdmRmN5a0JZdEo2NjRIOHRoWm0zMzBnSG1uU09BcFVkTk9lZDVT?=
 =?utf-8?B?QnVUbHhPTnhRS1VEZjBKYkk3NWYxaTlCUzNFK1gxdzJPMXdGKzlWb05pQUZ5?=
 =?utf-8?B?YkxXYktERXdON212OVBtcXJ3UG1LRmhRQ1FpNG5yd0gxYkV4MHczZE9qVmZQ?=
 =?utf-8?B?MHk3MHRNWXM1OEhlUVlRTmxOT1BTYUhhNEdZYTVCUGFBV3VhcG1RclpVYkk5?=
 =?utf-8?B?WE9TS0V2SmFVUnYvYzlGZlU0OGV0QVpQWGpkR3ZJQXJrWm52SUZLdm5RamRG?=
 =?utf-8?B?Q1M0TnduajFMd1E3blVIalpOby9kVHNva0dMTTlncHhHZ2lUdjRsOXBUVVlH?=
 =?utf-8?B?OVU2R09iT2o2aS9Hd1lDU2FzbXNQUDZTek9OSzV4UW1oT1RBaGNaS1NjbzFP?=
 =?utf-8?B?b1BjMTNmREg5Qmt4bThFQWlEMzZWWDJTb2J5UlRob1FMQ2R0SmUwMmJ1ejdq?=
 =?utf-8?B?bXZuOXVhMThXaUxQcHRQRmhKWW0xeWorS2N0WWdjWTd5Z0pFQ3BNVnBkMHNL?=
 =?utf-8?B?NkVSV24zRExyQmI2UkpoMnY2ay9MV3k2Z2FMSDRIWldnc1hXdWJBaDFabFV0?=
 =?utf-8?B?ODBBYjZzWWhIK1VpOTM5TjBlZURmTXh6cmxNYnBrN3VPNjFLVWM1STk5eWk4?=
 =?utf-8?B?WDZBUGVnY1pyVUQ3TG9NcWl6dkE2emJYZ3ErWVBMNThIbndMNk1PMENRc1RT?=
 =?utf-8?B?WndwN2ZYZzJoUm9jNWo1RklIUHkreG9mWTFYK3ltZ1BYSTJYaGE1NmozZktD?=
 =?utf-8?B?SFA0WHNiZDN1Z1U5eWNoRmI4VmsvcFphclNFVzhXaUpDTS9iWWl2Skc4OHlN?=
 =?utf-8?B?aUp3SWphaEQ1NE5yWGUrMVdONk93SzFWSlBVR3pFNWFVZ3Z4TTZldjZUcXM4?=
 =?utf-8?B?NU1McWFqdWtpK2NYdUcrbkdKd2hveUEyd2ZnQ1RVNXlXWVlOT3Z0ZzB1dDgw?=
 =?utf-8?B?SGpPT05XOUtQKzZBVnVLT3dLb3FZdEw5U3hoNHBrL3pySE1ORTdjbnZ1NTh4?=
 =?utf-8?B?UVEwRVRBRHJXTStldkNFZ1g2cStzNXg4NjNFMWZIbWtsamt5aTVReHpFSEdT?=
 =?utf-8?B?VFVCMkhlb1BhMFJrdXpiWUNYNUl2V05jeEx4eUhvK0NlSnhuV1ZSamdvKzJm?=
 =?utf-8?B?NFNTakk4TTRRUDFXZEZ5UnVGT3ZhN1RXMDFJNXBVSUU1SXlZVm9MSEV0NUpC?=
 =?utf-8?B?aDE1d3FTMVQzSTB3cGdtYmp4aXdlYXp0UlN4NStEc3VFOStkNklLZVF3ZUNu?=
 =?utf-8?B?QnF6NjdSdHZ6VG9FTmxYUmF3RGMvcXR0TzNJR25KZDgwQ2EwT2FsQTRrWVhR?=
 =?utf-8?B?NXRRdGxSaE16cFcvbEdtdnROV2IzQ3FqRFp1OUJPRjlUYlpSNGNRRTZBSVBp?=
 =?utf-8?Q?CNt3AwnznpgIG3Pa76+C3qCgc18kKM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVJEM2dyRE5ZR29qbkFrbk1hTkhiKzByN1dmZStiSnhVTDhRcURZV0dWbWxu?=
 =?utf-8?B?TGhwTzcvekhiRlc2dGYxOHoxcTB5MG5rZVprQ0hnMHNhd1VKcWZ4L0RHbU1K?=
 =?utf-8?B?b2NqZXlKZy9Bb09MM0d3Q0R1NklDaXQvUFVMMFZJbU56TFdoT1dOZXYvWGx4?=
 =?utf-8?B?NnVlYkdOODlGUkw1eGwzckE4MzBzUDIycnRBd3JHcTVwTlFxNmlrRjJjZUcy?=
 =?utf-8?B?dGdqSXZCSmhlU1QrN2V6anRoK0k0Q1RkZ1BoRXRHUHNzNjVmQ1RRNkxaMWpB?=
 =?utf-8?B?NWxRbHdQaE5xeVRoOUtUNk9oMXAzTTRZL2haYjJhbGdEMFIxS2greTNzbmMz?=
 =?utf-8?B?S3A0TE1IU0xNRUJSTGRXb2Z6NVZCV2xUelhONnRsM1F6bm9WZ3plRVJJSEVx?=
 =?utf-8?B?VFNzRU9KTDcxN2FXNk1aRnNiS3FCOXJNcFd6NjJWSVU3YkNUUFV2RG0rT3Vy?=
 =?utf-8?B?RjVNdUVQWkxtS1BBTXBzVUNOeE9xdHdFUFdzcllNcmVKWXBwYVl0OUZBSzho?=
 =?utf-8?B?TG9aMGxKcTZZbzV5Vzh2ZHNkbUcxMitJeWwwUkRpTlU2ajRBUXhFTlNKRVYz?=
 =?utf-8?B?MWl2MEs5MW16Y1g0RmxMUTBKYUhUb1FhODhuZmp4N3hncHFDdmxERmM3SFNs?=
 =?utf-8?B?VlJoSm8wVEd4L1ZBR2Nkc00xVUFYRCtjVWpoeHFobVd2dVJFejNxbkg3YXBp?=
 =?utf-8?B?RzYzckVxUzlZL1lYMzJJcjl5bDRNa214VDZFMjArekNyT28rb3FZMzJINERi?=
 =?utf-8?B?Ylo0cDZzZkNPbk52dzc5YThBamhJYms2bmp1YURnZ3JsVWNvQTdlaEJSU3pn?=
 =?utf-8?B?b0dDK1ZMUCtRMnQ3RWV1RTQ4UXpXM29Cbzl5dVRXdG1iYXNlQ0lUZlB2Uk4v?=
 =?utf-8?B?MnBGRlJXb3VvRFJzN0kzaFdEa0Faa2N5dnVhd05Pamt6Zzd5am9hWUlqYmhn?=
 =?utf-8?B?OW9xVSt4di9BN1J3Tmo5R0NGK1BuR3I4Q09IYnp4cE1HN2dLYVJuRXNUUXpS?=
 =?utf-8?B?RXFXWjJVcnZBOHptN0pldHhKMm5wdjNOMjNJSG80R0x1M0NiYU9YazYvWUc4?=
 =?utf-8?B?Ym5Nd3lYdVQyVldOVHI5SG9VYzZnRDBNdmFDMGdnUzUrRGNScW9LZkJzQmIz?=
 =?utf-8?B?N2hXNHI2SUdEanlmZ3JMdEF2VThYUnNCMExsYzlMeEdDVnJ1cjdDY0tVajBE?=
 =?utf-8?B?WU9aNElwYTFFMVpVbzdwRFI2OE1CdzZrbElBQVI3d3VUNWRJWEtVUWprekRr?=
 =?utf-8?B?OEYvNWZ6Qk5GYmZDTzlXZU5VcHpjTDBURWRzSjBqL01lbUtHNEllUFJXSjZ5?=
 =?utf-8?B?N1V0QmhSbSt4Z1U5cnRNRUlmWHlZNFBCSWlEMXIrdHUxWDJ4cUVDVUdkQTY2?=
 =?utf-8?B?anBMRUVndjh1RzhGN1ZpZ05kRms4VjBMbFVUSUphQnV4SThVc3ltUzIvcEUy?=
 =?utf-8?B?MDNzV0ZsTWdwQlhKWmdzekpXNjUyYnI2eC9ucHI1VkQrakZFMWZzdDB1RVpn?=
 =?utf-8?B?L3NBbG5IbDNkTDQ1RnFXbEhyV0JYc1VySWhGT2JOR2hPU0dRWHVHR28raFRo?=
 =?utf-8?B?ZEtjSmZkV0xXM01pcS9OTWlvYkFpQng5WFhXdkdPQ3Y1QmE1emNmRzlMcGVO?=
 =?utf-8?B?V3hDdG03SENrSGE3VEkzaXpwR1B5Slc0QURLWEtBcnBOYmtGM2t0bC9LV291?=
 =?utf-8?B?Smd4NnhBdWRuWUFIR2R6MzI2YjJzRzAyZndLOXNBcDR4bFdjZ2FDYVBCeEpT?=
 =?utf-8?B?dERwQWZMeEZsOWdiRUpVVUpOZUJsajRlL0RjUUUza1YxdzJNZ2hsNmxZNldy?=
 =?utf-8?B?MVFyZ1ZlOUlVWjNYenREQmFUR2MvQU85ZEFaN2VjWlVrRVQzTnoyUldFRi9D?=
 =?utf-8?B?dmlVcUNTUGlJM3haYWlhSjNDU0U5Z1F2b0ZXUytYVkxIYy80VXNRRTFqMTlW?=
 =?utf-8?B?TENVZ3VUelhaOWxweGFSVjd3WDE5S2ZPSDJmSVh4VDB1YTN1elZGS20zbEZV?=
 =?utf-8?B?ZmNrR2FXWjVGT2x1VGJEamhtYWx3cnBWajM1ck5SdEtrL05pZ1JjVnhsTUdM?=
 =?utf-8?B?RGg3c1cxRUdBVThRUEliNTF4UzN2TDR1VytXWG9xeDdSVGdXLzZDb3ZYRFRQ?=
 =?utf-8?B?VEYvcSt5enpWcXB4Tys1SFBxY3RFc2JjT0pIeHdwaEZGRnk1dEhGSFRDZk9y?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CAB20658834CE4FBFA326FC193308B1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208d74de-f9ab-48a7-fe70-08ddecd01a8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 23:01:09.9299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3KXrLzLsSyItL21miJDT+Q2ERVCW7ea1pEDLa6Vz2HsvChvjnHi0jJVQFe/+tKr+wTkW/xl0zhWXmgSgAik2WnvrwDc/6r4hlcefePgdwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE26A71A1E
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

T24gU2F0LCAyMDI1LTA5LTA2IGF0IDA1OjM3ICswODAwLCBab25neWFvIEJhaSB3cm90ZToNCj4g
eGVfZGV2aWNlX3N5c2ZzX2ZpbmkoKTogc3dpdGNoIHRoZSBvcmRlciBvZiBsYXRlX2JpbmRfcmVt
b3ZlX2ZpbGVzDQo+IGFuZCBzeXNmc19yZW1vdmVfZmlsZXMgdG8gZm9sbG93IHRoZSBydWxlIHRo
YXQgZmlsZXMgY3JlYXRlIGxhdGVzdA0KPiBkZWxldGVkIGZpcnN0LihMSUZPKQ0KPiANCj4geGVf
ZGV2aWNlX3N5c2ZzX2luaXQoKTogb24gcGFydGlhbCBmYWlsdXJlLCBhbnkgc3lzZnMgZmlsZXMg
Y3JlYXRlZA0KPiBiZWZvcmUgdGhlIGZhaWx1cmUgd2lsbCBiZSBjbGVhbmVkIHVwIHZpYSB4ZV9k
ZXZpY2Vfc3lzZnNfZmluaSwNCj4gZW5zdXJpbmcgbm8gbGVha2VkIHN5c2ZzIGVudHJpZXMNCj4g
QWRkIGZ1bmN0aW9uIGRlc2NyaXB0aW9uIGNvbW1lbnRzIGZvciB4ZV9kZXZpY2Vfc3lzZnNfaW5p
dCgpLg0KPiANCj4gRml4ZXM6IDBlNDE0YmY3YWQwMSAoImRybS94ZTogRXhwb3NlIFBDSWUgbGlu
ayBkb3duZ3JhZGUgYXR0cmlidXRlcyIpDQoNCkkgcmVhbGl6ZSB0aGUgZXhhY3QgbGluZSB3YXMg
YWRkZWQgaW4gdGhpcyBwYXRjaCwgYnV0IHRoZSBsYXRlIGJpbmRpbmcNCnBhdGNoIGlzIHRoZSBv
bmUgdGhhdCBpbnRyb2R1Y2VzIHRoZSBvcmRlcmluZyBpc3N1ZS4gU28gSSB0aGluayB5b3UNCnNo
b3VsZCBtYXJrIHRoaXMgYWdhaW5zdDoNCmNvbW1pdCBjZGMzNmI2NmNkNDFkMGY2ZTE4ZTg2ZDdh
YTUwNTU0Yzg1MmY5N2UyDQpBdXRob3I6IFJhYWcgSmFkYXYgPHJhYWcuamFkYXZAaW50ZWwuY29t
Pg0KRGF0ZTogICBXZWQgSnVsIDkgMjI6MTI6MjQgMjAyNSArMDUzMA0KDQogICAgZHJtL3hlOiBF
eHBvc2UgZmFuIGNvbnRyb2wgYW5kIHZvbHRhZ2UgcmVndWxhdG9yIHZlcnNpb24NCiAgICANCiAg
ICBBZGQgc3lzZnMgYXR0cmlidXRlcyBmb3IgbGF0ZSBiaW5kaW5nIGZlYXR1cmVzIHdoaWNoIGV4
cG9zZSBib3VuZA0KdmVyc2lvbg0KICAgIHRvIHRoZSB1c2VyLg0KICAgIA0KICAgIHYyOiBSZXdv
cmsgYXR0cmlidXRlIGFuZCBtYWNybyBuYW1pbmcgKEJhZGFsKQ0KICAgIHYzOiBEcm9wIGZhbmN5
IGZvcm1hdHRpbmcgKFJvZHJpZ28pDQogICAgdjQ6IEZvcm0gdmVyc2lvbiBzdHJpbmcgdXNpbmcg
bG9jYWwgdmFyaWFibGVzIChSb2RyaWdvKQ0KICAgIA0KICAgIFNpZ25lZC1vZmYtYnk6IFJhYWcg
SmFkYXYgPHJhYWcuamFkYXZAaW50ZWwuY29tPg0KICAgIFJldmlld2VkLWJ5OiBSb2RyaWdvIFZp
dmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQogICAgTGluazoNCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNTA3MDkxNjQyMjQuMjY3NjA4Ni0xLXJhYWcuamFkYXZAaW50ZWwuY29tDQog
ICAgU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0K
DQoNCj4gU2lnbmVkLW9mZi1ieTogWm9uZ3lhbyBCYWkgPHpvbmd5YW8uYmFpQGludGVsLmNvbT4N
Cj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNmcy5jIHwgMjIgKysr
KysrKysrKysrKysrKysrKy0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kZXZpY2Vfc3lzZnMuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMu
Yw0KPiBpbmRleCA2ZWU0MjI1OTRiNTYuLjI3YjZkOTBhMDAwOSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV9zeXNmcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0KPiBAQCAtMjkyLDExICsyOTIsMjMgQEAgc3RhdGljIHZv
aWQgeGVfZGV2aWNlX3N5c2ZzX2Zpbmkodm9pZCAqYXJnKQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHN5c2ZzX3JlbW92ZV9maWxlKCZ4ZS0+ZHJtLmRldi0+a29iaiwNCj4gJmRl
dl9hdHRyX3ZyYW1fZDNjb2xkX3RocmVzaG9sZC5hdHRyKTsNCj4gwqANCj4gwqDCoMKgwqDCoMKg
wqDCoGlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9CQVRUTEVNQUdFKSB7DQo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzeXNmc19yZW1vdmVfZmlsZXMoJnhlLT5kcm0uZGV2LT5r
b2JqLA0KPiBhdXRvX2xpbmtfZG93bmdyYWRlX2F0dHJzKTsNCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBsYXRlX2JpbmRfcmVtb3ZlX2ZpbGVzKHhlLT5kcm0uZGV2KTsNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN5c2ZzX3JlbW92ZV9maWxlcygmeGUtPmRybS5k
ZXYtPmtvYmosDQo+IGF1dG9fbGlua19kb3duZ3JhZGVfYXR0cnMpOw0KPiDCoMKgwqDCoMKgwqDC
oMKgfQ0KPiDCoH0NCj4gwqANCj4gKy8qKg0KPiArICogeGVfZGV2aWNlX3N5c2ZzX2luaXQgLSBJ
bml0aWFsaXplIHN5c2ZzIGF0dHJpYnV0ZXMgZm9yIHRoZSBYZQ0KPiBkZXZpY2UNCj4gKyAqIEB4
ZTogUG9pbnRlciB0byB0aGUgWGUgZGV2aWNlIHN0cnVjdHVyZQ0KPiArICoNCj4gKyAqIENyZWF0
ZXMgYW5kIHJlZ2lzdGVycyBzeXNmcyBhdHRyaWJ1dGVzIGZvciBkZXZpY2Utc3BlY2lmaWMNCj4g
Y29udHJvbHMgYW5kIHN0YXR1cywNCj4gKyAqIGluY2x1ZGluZyBWUkFNIEQzY29sZCB0aHJlc2hv
bGQgYW5kIFBDSWUgbGluayBkb3duZ3JhZGUNCj4gY2FwYWJpbGl0aWVzLCBkZXBlbmRpbmcNCj4g
KyAqIG9uIGRldmljZSBjYXBhYmlsaXRpZXMgYW5kIHBsYXRmb3JtIHR5cGUuDQo+ICsgKg0KPiAr
ICogT24gcGFydGlhbCBmYWlsdXJlLCBhbnkgc3lzZnMgZmlsZXMgY3JlYXRlZCBiZWZvcmUgdGhl
IGZhaWx1cmUNCj4gd2lsbCBiZSBjbGVhbmVkIHVwDQo+ICsgKiB2aWEgeGVfZGV2aWNlX3N5c2Zz
X2ZpbmkuDQo+ICsgKi8NCj4gKw0KPiDCoGludCB4ZV9kZXZpY2Vfc3lzZnNfaW5pdChzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSkNCj4gwqB7DQo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSB4ZS0+ZHJtLmRldjsNCj4gQEAgLTMxMCwxMiArMzIyLDE2IEBAIGludCB4ZV9kZXZpY2Vf
c3lzZnNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDC
oGlmICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9CQVRUTEVNQUdFKSB7DQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0ID0gc3lzZnNfY3JlYXRlX2ZpbGVzKCZkZXYtPmtvYmos
DQo+IGF1dG9fbGlua19kb3duZ3JhZGVfYXR0cnMpOw0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKHJldCkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChy
ZXQpIHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4
ZV9kZXZpY2Vfc3lzZnNfZmluaSh4ZSk7DQoNCklNTyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2
ZSBhIGdvdG8gaGVyZSB0byB0aGUgZXJyb3IgcmV0dXJuIGF0IHRoZQ0KYm90dG9tIG9mIHRoZSBm
dW5jdGlvbi4gVGhhdCBzYXZlcyBhIGxpbmUgYnkgY29tYmluaW5nIHRoZSBjYWxscyB0bw0KeGVf
ZGV2aWNlX3N5c2ZzX2ZpbmkgYW5kIG1vdmVzIHRoZSByZXR1cm4gdG8gdGhlIGVuZCBvZiB0aGUg
ZnVuY3Rpb24uDQoNClNvOg0KCXJldCA9IHN5c2ZzX2NyZWF0ZV9maWxlcygpDQoJaWYgKHJldCkN
CgkJZ290byBjbGVhbnVwOw0KDQoJcmV0ID0gbGF0ZV9iaW5kX2NyZWF0ZV9maWxlcygpDQoJaWYg
KHJldCkNCgkJZ290byBjbGVhbnVwOw0KDQoJcmV0dXJuIDA7DQoNCmNsZWFudXA6DQoJeGVfZGV2
aWNlX3N5c2ZzX2ZpbmkoKQ0KCXJldHVybiByZXQ7DQoNCkkgYWxzbyBzZWUgdGhlIHN5c2ZzIGNy
ZWF0ZS9yZW1vdmUgZnVuY3Rpb25zIHdpdGhpbiB0aGUgbGF0ZV9iaW5kDQpyb3V0aW5lIGFyZSBp
biBmaXJzdCBpbi9maXJzdCBvdXQgb3JkZXIuIFNob3VsZCB3ZSBnbyBhaGVhZCBhbmQgZml4DQp0
aGF0IGhlcmUgdG9vPw0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHJldCA9IGxhdGVfYmluZF9jcmVhdGVfZmlsZXMoZGV2KTsNCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZiAocmV0KSB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgeGVfZGV2aWNlX3N5c2ZzX2ZpbmkoeGUpOw0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Ow0KPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgfQ0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0KPiDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIHhlX2RldmljZV9zeXNm
c19maW5pLA0KPiB4ZSk7DQoNCg==
