Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84372D116E2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 14:46:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F8910E76A;
	Thu, 27 Nov 2025 14:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmYb03xa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1C110E76A
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764254760; x=1795790760;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rfKR39lgZQ24AuUnURrULoa/iH/Bu/tNREFGmM889pg=;
 b=EmYb03xapkLlTMrP9d6sQl9r4yCmp5cheF087wQDHtybudrUThOhA6qK
 tKWUekutprj66QSJzCF2Q4gqCLNaAXuQttNxswXaMXlYStLJ1Mq23H6ia
 NuDigL3+jE5XqSwdATI+QXjvTS0ezQsI3nazpGlbqTX9J2c9UPNe48Nsq
 dXafpvpkfnnAhLLcoVH2RIrWA82C0I526Y5GeWqw38ZACKOBCUHe8eivx
 MlRJHy8xtkO9ItR3sIg8+4I0TjL4vI11Q8SXTFeyIbcUI1m28tXDjVvUd
 iR7SN7YZvyMl++yZIkoJtZzbdadQLtcl9DUQZnzTiZyL3Uqzq4qOqnqQu g==;
X-CSE-ConnectionGUID: sROwAe4/S56JDpCWtsDWcQ==
X-CSE-MsgGUID: sMrRQ1hzRx6unvRgPiIgKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66194076"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="66194076"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 06:46:00 -0800
X-CSE-ConnectionGUID: hyaSxtywTKWmwjziXRxnoQ==
X-CSE-MsgGUID: ER2QissCSGqasWuSTCkW7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="197727170"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 06:46:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 06:45:59 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 06:45:59 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 06:45:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+xN+ZdRVK8a/HuQevvte11SgyTr5yb7BOYd3VHdFFIfBMxNkGs4zJf1UHKAQn300QsgDyX+u6+xZjSWh3vgPdT6aDqtnetAD7gCh6QJDWPENBYi395kBNsfM/MHnQPYeEOeog5PCa1c8vLJk1zhb5ZInizpKE8P1SQZpoNRhfOKcRo76aG1Uwf463As1n9CJ5FmcpsbuALP1JcGuKMurlGbgYAEHIvFZRAm6v/+TntcJsmNAJr3z4rCGNULsG4W+Bdn3eOqRnUAXzZcW7QAnWwgKVgTUUcsVZFPZf/SAq1owUuvP2Vrp6SrqJUENAwA6nUqeiQ4u0z8Bfgw69yZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3NgDuWJ/JwpARjnlOLpPxSOGc+QhuaoFIvU2gD4exY=;
 b=tIdvTdltW6EGMssbxePFjntsxCT+PbJ2qrHL6poDnbMq8MMJBRAEqOqwMitly/reuZtcDBiEQWtxc5qtVZ0m4txw5Wm/SAZBAkpNQUL8vI7BY4/Vp63JxPkvPRZtwEOVOWmuTIBIeqEgB/KWJLgKq5XGxs6D0AH8Wv+7WhgqZQeL3a21SNhjuSB9PkmJAUEsmPcwiJRNbcys98UQa1JuykMQC5p8OtUxLDRNh+TSr8/qmuieuzc8uTXKzTtKPQwPf1IKba6c9+v3gn/wPW+VnBUd0CZX354xzkiDCJeEU6iHYfHm4vVJZsTXy8eb24HyNbwu5ImktqtnNgvEmgsdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6731.namprd11.prod.outlook.com (2603:10b6:510:1c7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 14:45:57 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 14:45:56 +0000
Message-ID: <cdc62518-6d54-496d-9d7e-94313ae1e8a6@intel.com>
Date: Thu, 27 Nov 2025 15:45:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] drm/xe/vf: Enable VF migration only on supported
 GuC versions
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251124160719.29812-5-satyanarayana.k.v.p@intel.com>
 <20251124160719.29812-6-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251124160719.29812-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0190.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::47) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6eb4d2-6479-47fb-4cf3-08de2dc3ac36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEZDTzB2dFlGVkdWMnd0QzZtcmdSanBkWElkdE94c3Y4azRhRllIM0FqY0Er?=
 =?utf-8?B?aGdQM3M0bmRhZ2pwTTlKdUJnSjNzMlNRbFZsTU90NkJTTmp2Vnc2TERBK3ZX?=
 =?utf-8?B?Zm1yOTJueGVjcm9JQXNjTlBpZUR3RVFqZFcvbFJnTGNhT2JoZ3BnSHVEdmd3?=
 =?utf-8?B?Y3EydjdpQ21SdWNSYUlHa2cwRkNmai95em96cGhOYVdDNGF2SnF6ajRHZms0?=
 =?utf-8?B?L0RYbk5uUWg2UHZUenlEMHlOVGQ1TFBDVnNEbmEzQ1VDVjVwOTk2NEU2ZlhN?=
 =?utf-8?B?K0hjYisxWTU5OTZoUVZFRDNGbXlEQko1RERMSGZrSGptTUM1aFNBK0NqdGpO?=
 =?utf-8?B?OUcrdE5OaG5FakNRa0pFZG0yQjlWQ3N1WlRXanZUN2xSOElIRm5BdUdJUWxm?=
 =?utf-8?B?ZUd0VGF2RExiYTNsY1I1b1I3d1F5M0x6aFVhQ0YzS2p3UFNKVXZzSk83UEtI?=
 =?utf-8?B?ODdHeVNOUlpXUmJOS0hpN21FU25yNHlBcXI0T1JyM0c4TlVQdEdibjU3NUZV?=
 =?utf-8?B?K1VLQWh0U3h4UUVRUk9HQjNXUGFvOHJ1dnVVYUpMd0Y1ZGhiK0xEdDNQMGNU?=
 =?utf-8?B?ZWVtY2pGUUpRdGFHS2o5ZHZEQmxtMmJpVkVuU24vcERWNi9kVTBzVnFsTTZj?=
 =?utf-8?B?cEplbElDWkF5TDhwbHQ3TTE0dnVuTjZ6bmMzUmF4dkFmOFNnaEdPMjFUUmRQ?=
 =?utf-8?B?Q2NKUHVhTkU3M0FnWlNJNEo0ZWlhOFVHei9DNzlTV3dXeEtSWDlTSStOR0dl?=
 =?utf-8?B?NEZSUEVtZ2g0a2N3VjRyZXNFRENveEdZczNBRW5PckJlbmhjSDhGQnVQT1dm?=
 =?utf-8?B?UDR1MTYrWGtnYlRxa0FXVjNNUUhSQ0s3NmhISkh1RmhpY0g1cjNxVkthbGgv?=
 =?utf-8?B?OHRFYSt2YkFscDlrL3plaGVrWW8rU3RQRUJWM0tVbTBNSGRhQjJWRmxNSk8y?=
 =?utf-8?B?NXBkWlB2VVVOZG1xQzV0TjJiQzlWejNHZVZCN2o2WEwwV0FyOWl6OTQ5R09t?=
 =?utf-8?B?R3FNcG5XdTJjMUViYVIvSU1nTWMrYnpVcVBuemdHSmlGd0MrZE84NEZBMXZG?=
 =?utf-8?B?VlpoTWlySnlGTHdpbEtwRkEvcEFZTWYwQjFmOXp4OG9ONCt3MTB5TERSTTFT?=
 =?utf-8?B?MVhsNGpPdTViVnM4emlQMFZQYzBXbC9zQVphV1V5OWo4Y0duSHFMQnZzWFdt?=
 =?utf-8?B?UEFoQ2tOeS93enlKbUhvNVRiUmFMaWFweTZrVWdkcDNucUVpa3JYOTNnb1Bz?=
 =?utf-8?B?QkVLMjV3QTJPRTErRWZXS3lBUzBacjdzQUc4dzBCcndaK1JLeEliQzlSRm5C?=
 =?utf-8?B?QVI0cTZMajFmRUlEWXdNNW5LQXNtWFp6aWhrdC9Cc2xWMWZvSGRaanBma2Ru?=
 =?utf-8?B?blI5WGczSmhqNHl2aDl3MGZRakFadERrUjZwTVJhZXhxcVAxM1JzUEhGTTF5?=
 =?utf-8?B?T28yUy9PWis4Z1MwMnRjYWhlTmxBL2ppVkt4TDJld0E0dlo4akc2NlpzYmJu?=
 =?utf-8?B?MFBRTnNudjdNNlJvdzNEa0FkTE1nMk85dUs2OXNGUzNTV0EyREtoSFpBSVI2?=
 =?utf-8?B?NnpQcE5hSEhXVzkveGViN1Z5d3dMblVCampCTE1qbnpHT2FyY2Y1dER4dEFI?=
 =?utf-8?B?K1c0ckQvZ01CczQyTU9tWk5vMVVhOVZXeGtpQ05uMVNxSmZFWWZyeGhqMFhv?=
 =?utf-8?B?WmMveGxNZ2dwTmYxcUJaYmk0ZXB5aHV5cGF6OVJpRGFmazB3UGN4WlBWNlJ1?=
 =?utf-8?B?QVpUZlI5Wm1QdUdQRmdYaVlNTW9HWDZEQWpkVGJLN29HK0dSZEhVN3BaZmdQ?=
 =?utf-8?B?VTFmUHpxQmNUZWxvOFhSSjN6MUwvQlFYZVloTXFZNXhZdnpFT0EvdkxaM1VR?=
 =?utf-8?B?eWswZFRVbXlJL0lqZHJtNG1nWEVOVDJ2M0RwQzh1dWI3SlhLbDVBWGJnS1VO?=
 =?utf-8?B?UGxqOHNpY0ZPTnk0aVEwNmw0YjZDZjJiaVhrQjByVnp2M0Uyb1o5ZGZvVThm?=
 =?utf-8?B?ZWVsNGcxMXZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tnc1RW4rVUNVbDg0OXRnaU54TVpKN0R4TkZyQXlVUGNqeWh2cmNBV3RTY09H?=
 =?utf-8?B?cXJtS3p2YjRsRXFtUDBZSW40S3Uya0gvWUJaZ2g2bERrNXRCK2UwT1M5UUdX?=
 =?utf-8?B?cFhoVC9BSS9BYWNWV3g2TmNjZDNaSVN0bGxsRXpKQlc5NXVFY0JkbkVuREZh?=
 =?utf-8?B?TzNvdlU4NitDYzdpTzVvc3d0VUd2ZlJtYzhMOGZCMzZ0TEg4OE95a1hCaC9l?=
 =?utf-8?B?OFVnT05JMFI5WVd6aVEyd1VUc0RGY2ZSdzdKays1WjRveW56c2RnL1FSSVE1?=
 =?utf-8?B?NXBNdHA3SkcrVkFhS3ova0hOT011dWFjVG1NeXk0ejRmaEVvbmNnT1daUlRa?=
 =?utf-8?B?dVNrM1plTm5vRkw5SGdFUi92UlZkQU0xRUxxYmF4ZjVVQ21PL2lYUTUvcDdB?=
 =?utf-8?B?Z25xWjcvcVFmWHFVd2lZQXNvc2x0K1ZGNXpTN3l5ZjZSKzJKdTJDOVo4Y2M3?=
 =?utf-8?B?cmRVY29xb1FkejlnUmVRbG5FVmxPSXozWklhU0JLVDVNL2RFWDhxbm1lYzVK?=
 =?utf-8?B?VUExblFzeVZCUkJXWGdrVVJSNThDYjVmVGE0d0FuR1U1TW8veElvNkZMdGgw?=
 =?utf-8?B?TzNoSlhmVkJlb1hOcndWU3F0alFuN1g0R1JuQWVxQVNxb2J2cGRydGZtTmFI?=
 =?utf-8?B?UjYzZmNCSWQyaUVjRFF0VzM0Qk1YTXdxODVMK2IwYzZKMVFqM1IxV0R5K3VM?=
 =?utf-8?B?T2ZmbStaUitXNEFlWVFJdG1FTGVCaGIzVCtJUmdWc3B3eTh3NzUxVDQ2YXhE?=
 =?utf-8?B?cjNGNDlJL1JpckdyRVZSQVlKd1Vrdm1aZndhaC9xWXF0Q3V5UjI5VFR6Q3Nt?=
 =?utf-8?B?cFpCVkxsckNZNDI2d21JT2tURmJaWkFEWHI5VnhOcDUxQ0pVckExaXdrYWM1?=
 =?utf-8?B?ZFFSOFBSUzlPRklGUDBGNTR3dTkrdVBlaW5Dc3BvSVdSMXJyUVYyZmxoZHpI?=
 =?utf-8?B?NWNuR2ZUNCtvR3BRWGVDYXRISFZwY0c0TkI2M2xEMHlxZEwvcTRsSjRDOHFT?=
 =?utf-8?B?NG5YdldTR2pTS0ZxenZpVUtpV0lRcWxHMGR0RjF6VDhSaklIZUZhT3c3SEIw?=
 =?utf-8?B?SXU5Y2Rta21hbzByVEFNSDA1bjlQdWhWVk94eGZpay82di83bGMrUFBWRUZm?=
 =?utf-8?B?SFdETm5IRTZ0OS9EUGI3Y3ZtdzRITGljUGFqaTVSc1luSURWMVFWYnFMMVE1?=
 =?utf-8?B?RjIzNDYwR1RoU3BkQVVDVU5PNGk2UlQ4ZTVIWHZNcGNHbHpQTDZvazVFbGhT?=
 =?utf-8?B?YU9VZjZoRktNTkovd1orKzE3K0wyNlJRZHJPWk9WeHNNK2RkQ1MyemFrUXJ0?=
 =?utf-8?B?NFhKT0ZlTytGSHQzbGc0OERIZjYwV1FicGRDQlZ1ckRlaEFQRnkzQW92SFA4?=
 =?utf-8?B?QXBycEdEOFFXSlR6RGRzTCtuTjMxNGxSSmgyRDBBWE1rUmdMZnhHWnlJQ3dY?=
 =?utf-8?B?eU9UM1FwR3lUcDc2NnBrVGFyKzV0TTlwOVhWeDFMcXJSV0hhcWp2MkNOaFFs?=
 =?utf-8?B?TXBidG1IeXYxVmQ0RlQxNmVIWjA4eEdubXlUNnJiWDVBcC9QQXd3dXVLQnpP?=
 =?utf-8?B?K1BrZ2N6Nk96S3hMRCsrZEdlK2F6WXpXaXYvNmVrQm9MVkNXNUxPMEVXRXNy?=
 =?utf-8?B?cFJwcEoydG5VNkFYc2RtU3J1THhBV3h5c0Zpem1qS2c2dmMwNndUR2EwOEVC?=
 =?utf-8?B?V05Fd1BFdWtOQldudHlxR3QyZ3RMdUJZNUdmL1pMNnI1VDdTQ3N5Sm5CSWNH?=
 =?utf-8?B?NkgxL01VQ2R5b21qaDVVMDhQeWhoN1lINlpVR1JObGcvQS9FUjZaTE5zVGht?=
 =?utf-8?B?VitUYU9UTkV1Ym9FbGpuemtzZWZCM3JFNElyZFpoaXVrOUVLbnk0MExONFRF?=
 =?utf-8?B?MVMxNXBHQ3VYT25LSEsrY2VDemVReVY2ditXSXovd21JVCtxdmJIYXl3TWVD?=
 =?utf-8?B?NXdiVWVSN2ltZ1BZcnJGTmJUbGNwNzUyMUVIOUxhSTZJcU1qN3ExcDlLNlYr?=
 =?utf-8?B?Y1E5aEpHb0NjUzBkdUJzSm42dVNNcE5nQkZyY2diUFJHVUZvdmNBV3lSdEty?=
 =?utf-8?B?S0ZOcnRhTE1ZRHQ3VTRzWlRoQjRESzVpTFp0RGtzVkpicGp3d2VKWDdoMkwr?=
 =?utf-8?B?N092RWoyakYybVJZVS9GeDEvVkxWQ1VvSklPQjZFbFhycFpVZG5wZ3NSOXAr?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6eb4d2-6479-47fb-4cf3-08de2dc3ac36
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 14:45:56.5539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hOSFf0dphqRc9cbs/ygew0j4weomIXAiUBNdZmqe8FrPhuql7dUwnda4mrwTICtoPNB7AFHzn8jbN1hioNzkUwkayWXAIj2gV6oFRr5oIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6731
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



On 11/24/2025 5:07 PM, Satyanarayana K V P wrote:
> Enable VF migration starting with GuC 70.54.0 (compatibility version
> 1.27.0) which supports additional VF2GUC_RESFIX_START message required
> to handle migration recovery in a more robust way.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V5 -> V6:
> - Fixed review comments (Michal W).
> - Updated commit message.
> - return xe_sriov_vf_migration_supported() from vf_migration_init_late().
> 
> V4 -> V5:
> - Created new function vf_migration_init_late() (Michal W).
> 
> V3 -> V4:
> - New commit
> 
> V2 -> V3:
> - None.
> 
> V1 -> V2:
> - None.
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 284ce37ca92d..f53d68f2f1d2 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -170,6 +170,22 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  	vf_migration_init_early(xe);
>  }
>  
> +static bool vf_migration_init_late(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_uc_fw_version guc_version;
> +

hmm, I'm wondering whether we should do anything here if migration was already disabled at some earlier point

this can be already observed on ADLP [1] where we have two messages:

<5> [420.828841] xe 0000:00:02.1: [drm] VF: migration disabled: requires memory-based IRQ support
...
<5> [420.910616] xe 0000:00:02.1: [drm] VF: migration disabled: requires GuC ABI >= 1.27.0, but only 1.24.4 found

maybe this function should look like:

int vf_migration_init_late(...)
{
	if (!xe_sriov_vf_migration_supported(xe))
		return 0;

	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 27, 0)) {
		xe_sriov_vf_migration_disable(xe,
					      "requires GuC ABI >= 1.27.0, but only %u.%u.%u found",
					      guc_version.major, guc_version.minor,
					      guc_version.patch);
		return 0;
	}

  	return xe_sriov_vf_ccs_init(xe);
}

including VF CCS since it is still part of the 'migration' feature, right

[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156339v6/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html


> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 27, 0)) {
> +		xe_sriov_vf_migration_disable(xe,
> +					      "requires GuC ABI >= 1.27.0, but only %u.%u.%u found",
> +					      guc_version.major, guc_version.minor,
> +					      guc_version.patch);
> +	}
> +
> +	return xe_sriov_vf_migration_supported(xe);
> +}
> +
>  /**
>   * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
>   * @xe: the &xe_device to initialize
> @@ -180,6 +196,9 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>   */
>  int xe_sriov_vf_init_late(struct xe_device *xe)
>  {
> +	if (!vf_migration_init_late(xe))
> +		return 0;
> +
>  	return xe_sriov_vf_ccs_init(xe);
>  }
>  

