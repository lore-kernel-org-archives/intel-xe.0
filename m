Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9788D2FEF4
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 23:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C0710E168;
	Tue, 27 Jan 2026 23:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhzXYdpR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F0310E168
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 23:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769556756; x=1801092756;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Fef+ZLKUVRfY6rhP8pjJJIQs6aCC8qng4upcMLObD8=;
 b=FhzXYdpRAamfA4rFO7Vn0SNAhGrRLNywXpDmV3eLZeAmpwqazjcr/4xJ
 orpd9U1Q/w+NjliBeMiIwvj+BcxPIK4jDF7bqhvvedeXVLPFkNpiWDVvK
 InqFF9y6uoSDqDeZP2dtch9efl6OTXBB+ofP0DWtfByh3IXMReH5vsqAG
 dcc5GhghstZJuMb5r06SpOzdBm3Mn1+kgtJsh1NX1c17ASYlBgL5PZD8a
 qf7kozrhs+iUJZvkz7vn2ZyEnr028Ocrci0/oak2FLo67GBC9N0Wc1yF+
 rQ3wWXczY3Yvn5KR1nly2tE0M1kwI0Gl2fZliNVll5tg7o0j9ThpM9tRS w==;
X-CSE-ConnectionGUID: 7qGDakIDQYKxz5tzENdgiA==
X-CSE-MsgGUID: 7OWnz98GR/+JoMexbNTNcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="82194154"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="82194154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:32:36 -0800
X-CSE-ConnectionGUID: dmxVRIoqTOOh0ggyLZCQ4A==
X-CSE-MsgGUID: tcPhrVFrSEeXxzIAc7I3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="245726166"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 15:32:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:32:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 15:32:35 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.27)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 15:32:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFYzHE+UNu68TZUhHJO9BNfdBmhzpoiKI02GfkPFc6Jm3RalPtQ+Ql4TcbMCZM13eefPPLzDvZAJIEXxU/JdkrabVxyq7p66E5szvS3uabmsStPCK26i43drcPFEguw14I1sPXAv/+gaDnFaELcP51uHH/PPKFZ7yAz/h2vDRBaX/z4iquFB6W+9qmyTU8JsUlAMJpZVjL4+c3gdFNrDczaaIZJMNAQpOY+rS9UqQYeB0MbTn7VWqX3+U+R0jYdNbc4x9+5hWGJ+GMh/yKo+LdRuPXjK/YV6GcbioNXVzTBEbu0tFnYfnrXOn7kIV2lcNZ3SJjnhLsjECH6r397jlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8IB3w9sSKruv1r07NB0UUuS2CE3p5jyRGQA5FDEXG8=;
 b=AudBxaBxke19mNPujJs7EV4FUNTfYM0jEV7+vtbO1/sRFcPge3LRH7OkGdBkcBx+nzRtNV1zgNOrJoy2xqxXG4laA4Zp/JdKhENTPH7/87RWkXIEd8ElJAl50iJAOLOPI0qQa0QV1EJpgpLhGt1GMAB3janls455V4wwatpK+IxHKyp+Is50JJ73MPk5/Riy2GWnahLFhCjx/BIszMkd7MUWMGGtmIfetPbN0yb5GgfXbHY3cH5B2W0DRPD06N5rSNAwefpeZ76cmj3XKF5EH+5JtTOYpPhhDDG5KEdvovMNDj/BfGUCakNGep7iRpdXnMqNL7uAwc3tlRIXBWWZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 23:32:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 23:32:32 +0000
Message-ID: <48a4d279-5cc0-432b-8398-295116419cda@intel.com>
Date: Wed, 28 Jan 2026 00:32:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe: Add a wrapper for set/unset params
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>
References: <20260123235027.379891-1-vinay.belgaumkar@intel.com>
 <20260123235027.379891-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260123235027.379891-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0129.eurprd07.prod.outlook.com
 (2603:10a6:802:16::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6239:EE_
X-MS-Office365-Filtering-Correlation-Id: ad66044b-7efb-447f-8829-08de5dfc581e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1VyTEFXcUlGeDlNQWxlWW5JSHdkOWorU1RoYlpmU2RCbm0rNit0b1NKNWVm?=
 =?utf-8?B?dFBCNnhpOFhhNDM3Y09kOGpsOXJEUERibFlvM2lvbEdEays2dXdYNUtLNm0y?=
 =?utf-8?B?bDRsblE0NnFSVFhjdm9PbFZCU1FmRXlLOFRBYXlvSWhueW4rcXVyUW5yd29F?=
 =?utf-8?B?VXZRanFnT0hWZDhIRGNMYjRzbC9wcFRDK3VGK00xVUkwNlkrVU4rV3orRFQ1?=
 =?utf-8?B?SEFBVFJPZWFXL245OC84ZFVRZVVXeVlqZ3lpOGM4TzU3MnptQTlhRHFOUmtG?=
 =?utf-8?B?UmFFRHR0eEJ2cG9oUHdWWnBnUkpvbU0vVlFLdnU5akpabXg1RUpEMkZYR05B?=
 =?utf-8?B?RWcxOXNxbHZMVkUxWSsxRThMRVZ3WUptVlhFQmFzNWxwSmxWU2dRbTVsK0pG?=
 =?utf-8?B?MDlXZWtncHk1czIxQ3BOZVZleExTblV6Q3pGMW9oU3A2N2hFU05mQituV1JX?=
 =?utf-8?B?VjdsMCtEbDdFUFhjaGNGb0VrWmE5ZlVXTGlFRmQxcXpXb0lRMWZzZXVTcUhF?=
 =?utf-8?B?Z2hRZ3NST0ZuUm5HaEVPUHdSS0c0VjBkY3pBc3lzRzhCMVhWa081c3NISkVJ?=
 =?utf-8?B?bU95UnB6dmVTMUQ2YXNzMDZIeUd1amd6YW1XZXp6RlkvYU5md1Q5d1dET0tx?=
 =?utf-8?B?VU5XMHR4RTZqT0VpVGJsRkNOV2lHc1pyUmRwK0dzNGZUcHpQSm5MTHZEMVdY?=
 =?utf-8?B?Zi84Nm94Q2l4QVA1R2swajJZSlIyQVp1aVVzbVZhVlUxb3JTRkFldEFFYTBJ?=
 =?utf-8?B?ZTlTTmVidHNJQ0RGeTYyYjhUVXhDTzg4Z0tGbVlVOERLaTlwdjZLUERQTTRj?=
 =?utf-8?B?SERrKzdmT2VkZFk4dEJLRU1ISmU0NzZyRUQ0dUdjN0RuUWIyakJVdEFQOUVO?=
 =?utf-8?B?Wlh1N2ZoZThlSWx1L3VHcVpVdTNrOG5EUm9PVkk4aEs0bVdOSzJRQ0xRclVl?=
 =?utf-8?B?bEp0ZXphVWQvWXhrc1A5ZkJNYmkwcXR6WEEralp4b0pWOUd4ZTc3QWFtZmpr?=
 =?utf-8?B?bkRLempKdUd3VHJxbFA0SmQvK3grTk5QM0MvZHhWdTUzb0ZLdmtRVDVRaU5x?=
 =?utf-8?B?Q3dXeFpUc0hRUFJTR1d5MzZoeWhKcFdKKzVlY0JUMHBDb0dQMXJnOVFUK0dz?=
 =?utf-8?B?SzcyaUgydklHT2o3SmJFa0hFMXZxSTcyVmE0V2cvRW1QR2IrSGo1M3ZpTnZz?=
 =?utf-8?B?M09ucFNxMm5SZ1B6ZU9ibEFOU2lxKy9LNXZmOG1BVFZsdWJYZDhEclBpNC8w?=
 =?utf-8?B?K2d3d2lXcm9wdGM2YUIxNm5UcVVaZkVWUmNDTTYyQXNvUDBsZnhYN2h0eXIv?=
 =?utf-8?B?dE5SMlM2aVY5TURMSVJmdmdUMVJWengyeGI3T0VuK0dpb0JsNlJkeW1QLy9q?=
 =?utf-8?B?b3Bsb0E1OEtiaW90M25xTm5DWjB0ZkVTUENFaVNveWJCckF3YWJTY0w2OURC?=
 =?utf-8?B?RGM2ay9zUjliVjZXRUJlQ1Zvdy9zTzZ1UUd0Zys4eUw3VFBkeDYwQjVNQVFS?=
 =?utf-8?B?bG8xUm1MVTkrZTVyR0xEbElwSGE1NmFCUzJpbnFSRXl6R1UzWXlXQUMydExl?=
 =?utf-8?B?cW1TcitrVGMwNzJ6OW1JOUZsTGptRlhyaFBFUFhiSXBpWkkyaXliNEk5VUYw?=
 =?utf-8?B?TytwekQrSmZhVXE3YW8xcm44VHFmTWdITVdJSy9EaER0aHJYQU16RHlPbi9i?=
 =?utf-8?B?TWc2M2pVMkh6Smd5OUc1czlkWjhMQ3lDdGMzdml2Q2ZDOTJFMjJJZmo0dlZj?=
 =?utf-8?B?Z2s1RU9WWDFEUTRXTStJZm9XcldhVFNFODZCZHA5Ui95Tkt5bDUzODYxV2Uv?=
 =?utf-8?B?dlhRbGJwOUhqQWNxbTBhUnErLzlTU2ROU0NuSGJCSHZvMmRVelRZOUQ0eDdV?=
 =?utf-8?B?UGZtRy9uV1NwTC9pbmlSa29yQnE0VVJMdnE4akJzMWRzSC9lSFQ1YUJCNVpm?=
 =?utf-8?B?YVJWTHJBYU85OFZiY3NqRUpybUlkKzh0UGQ5YTBYaUY1V21VdjlNclNnWWhG?=
 =?utf-8?B?R2RhelBXSHZoUDljVUJFVEZnV2ZMRG5CRVd5TFpvYTQ3R2VXRFJWVTRQOVhp?=
 =?utf-8?B?UVNLU0hLNEZtSWpKNm5LRm52NEFObXhkRjM2MmNxWWhJUCt5bWNXdnhWUkVs?=
 =?utf-8?Q?8SSM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3RoT3pkTHJBOG1iUEVzdHFDSjdUNEFsUEhvMXErUXd5Z2dMQ0ZONHFrTmMr?=
 =?utf-8?B?dnlCSWRZdkZ0NTBVVjVaSFBSdk82Zm5kSGU5dmJ5QlorMUVUUnNoYXRqRU5o?=
 =?utf-8?B?ZkRUZEtjMWwxdjk3UjEzK1BLbVVaazYvOHJRQ042WWJwdHBXNTdsTWpIV3Fn?=
 =?utf-8?B?bXQzREpXWFZWUTBObEZkYktTT3BvMW50azgrNXFLRXVSTWxVMWpFTmwzTEg2?=
 =?utf-8?B?RktIU2lLYmtZK2tKYzVXSXpNYTl5eCtBMGtBTXI0TjM3blJ6dFdsVU5SSUZL?=
 =?utf-8?B?TEVFMTMybC90cndmQ3FsUWVaYXRYOTNxeXFTKy9qUUdTZVhNK3pzc2k5SHVZ?=
 =?utf-8?B?ay9WeisrTFVDNUo3d3pMa3lLVjY3eThmNVF1cXZLODVpMW1hdGxBc2FySktz?=
 =?utf-8?B?cEd0SU1hRkMzaHVrYUhMNHQxSmM2TVVJV0w5RUxZaDFxZkNSaFF3TmNQUlpo?=
 =?utf-8?B?OVIwL25wL0FmQms1RTBmd3pxOExyTjgweG5vMWxtenVkVXlpODVIWllybXlR?=
 =?utf-8?B?VTR4UHQxU291NURGcWJzendIOGRmeWhVV2laaVNtTGhnR2NSYlhGWEdCUGRv?=
 =?utf-8?B?UnNhcTNvMEQxNHByQXc4R3h0a0tRYkJOSDdwdE9pRElGTUQzZXQ4dkVMWGpI?=
 =?utf-8?B?c1IyVTUycDEzTEIwTXd4NmpNblNYcmZvclk1ck1CSTlaMDhhajdoZWpuVllX?=
 =?utf-8?B?MktlYys1TzgxUkphMEJJT3RnSzdUV2ZYTXlnSlQ3R0R4R0ZEQjJGVi8wQnFO?=
 =?utf-8?B?c1pHTGljdWwyRi9ISXFOVE45Z1c1Z01rdURlOFF0ZWFqMWd2Mkgwei9HSXJh?=
 =?utf-8?B?b1MwV0xpeG5hbHZtQ29SL2xIYmNtZDdnVzByQVBuSENSaWQ2UnFKb0pSeUMv?=
 =?utf-8?B?d0ZBOEdRZkR0b1dYdm9GZGxjQ0dsZ3FxMmJhWjEzakdFSk1HTXZwcDhuaGhy?=
 =?utf-8?B?YmIxUkVJbTlFWkMvOTh0YjZkS2N0QXlJS2o2MWRPaHhWNmtIVzZHVnBGSUNZ?=
 =?utf-8?B?RGNrbjNTcEdlVDhVMEx4VWUxNm4wekszQUcxaVlMemdsTTdJTnpIdlhUcTdG?=
 =?utf-8?B?eHBjWGpqeXRFcTVPRjBaT09wVTRFNEZTZjUxbCtGZG1sU1FpeGFaQklaOE80?=
 =?utf-8?B?T3V6VzVvcHNEVUFJNmtkMTRHeWM5dTRHYlFMcHBHSkJCTlVNc2xjaE5sMi9q?=
 =?utf-8?B?R1dKRXpVSGpvZGY5d2hhMW9SV0xyNDVERVNFRHZYUzBuU3dsS2RXZVd2a2hH?=
 =?utf-8?B?dnFtOHZDWFBPUkJ5ZC9oeWpheCtKeCs3Unk4M1d0RisyN3R5RVB0UnN6WnZj?=
 =?utf-8?B?Z0p5VU9pOTJVbjZ3R0RqTyt6Y2RjV1lEMlIrU1Yrb0lRa3VadEtpZEVEUHh5?=
 =?utf-8?B?TWtTMmJrSkVvL0Y3bVZDaWhWSll4Z01GQVY3QUNGQWd4ZXBvUzlZalBIZUE3?=
 =?utf-8?B?VVY4RTAvM1BZcU1OcEtNaHhsYXkvTEQ4SVFQTlV2TGtQeVBIRitjNWZLcS9m?=
 =?utf-8?B?c0Y2di9CYUxPVXBPT3piYlR6S2l4R0RnTVpEeCs5cktsL3M0UnV6S0g5UFY5?=
 =?utf-8?B?VWEyNEVRTXBkTGdzcHdDTGhVUGhaVUo1K3dzMndKWElZVUdRZjZmTnB3RTgx?=
 =?utf-8?B?WXdDK09QYkZtV0pLNEFBQURZWXlkWnd1NW5FRDdldXpVRVppcHRLYWtGcVJT?=
 =?utf-8?B?MFlodEwyeVU0Z3I2czIzN1JUTWM2RFR5MVZQUkJzSGllU2RmMStqNEFON3cw?=
 =?utf-8?B?SDVZV25nblZlU0ZPL1A4dGRNeWlYZXFvNWlDQUJaY1BNWGJhUE5RbGx2Y3A5?=
 =?utf-8?B?NlFCSGZLMnpXVmFva2toNkdqd1g4WEplTzczaTlidHlldmFlTFRyYVFqWTFi?=
 =?utf-8?B?eVgzOENIcGhCeGVnYnVpQ3VFeGNxTEVXNWFIaEYwc2NFQVRMcEdMcnRNWWZI?=
 =?utf-8?B?anhWSkNXVSs2aXorTWU5Qkw1c0J5K1ZNNlVvaHZQU1hHZUd6UzRZV1pSUG9D?=
 =?utf-8?B?WStoSkNsYmZjTzh5UUNxdFhHR0VIdFlOWC9KTXhUcG1MUEg2T0haM3Q4SlpV?=
 =?utf-8?B?NDhZVUkxRnBzZENSUU1Ha1lJcjNpMXdqcWdYcU5YTksvZ21DMjNRd3NhNmln?=
 =?utf-8?B?QzdvTGVBSCt5cU8wS1IxMFVvYTRKRVNQZXBsUzU1Y0RLYTc5WVdWVGFtdEpy?=
 =?utf-8?B?NmJZSVVDTUZsbG9BMXB6cXY4WjNDZDBsSGE5WjJFY2M2b2Y0UkdLNCtuYXdJ?=
 =?utf-8?B?aUtwbHh5dml4MFZSeklMYUREenhFcS9lOVAxeDJSSDNhK3FWZ3JFcnEyb3ZG?=
 =?utf-8?B?OEc1Z1FOclZ1QTJCUW1jbkdVQUVwKzRjKzZtM1RkK09rYWJXa1hSUmRVY3pB?=
 =?utf-8?Q?pUBsBrOQaAQvC7Mc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad66044b-7efb-447f-8829-08de5dfc581e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 23:32:32.5811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoZxbvF9RDbYUjkTz8iRGNcfwMJiWebnyt9DkDu30Iz2+8xr+GKDxs5s3VeYGW6hofzXvWaXbz3TjYpeK0gx1xmNXlBFFRpkUPEMHuuC0BA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6239
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


subject is too generic, maybe mention GuC/PC/RC ?

	"drm/xe/guc: Add wrappers for set/unset SLPC params"


On 1/24/2026 12:50 AM, Vinay Belgaumkar wrote:
> Also, extract out the GuC RC related set/unset param functions
> into xe_guc_rc file. GuC still allows us to override GuC RC mode
> using an SLPC H2G interface. Continue to use that interface, but
> move the related code to the newly created xe_guc_rc file.
> 
> v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
> v3: Assert if runtime pm ref is not held (Michal W)
> v4: Review comments (Riana)
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 56 +++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_guc_pc.h |  5 ++-
>  drivers/gpu/drm/xe/xe_guc_rc.c | 30 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_rc.h |  3 ++
>  drivers/gpu/drm/xe/xe_oa.c     |  9 +++---
>  5 files changed, 70 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index cf02c53ca3c5..31c6cb111916 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -264,6 +264,37 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>  	return ret;
>  }
>  
> +/**
> + * xe_guc_pc_action_set_param() - Set value of SLPC param
> + * @pc: Xe_GuC_PC instance
> + * @id: Param id
> + * @value: Value to set
> + *
> + * This function can be used to set any SLPC param.
> + *
> + * Returns: 0 on Success

    * Return: 0 on success or a negative error code on failure.

> + */
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> +{
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +	return pc_action_set_param(pc, id, value);
> +}
> +
> +/**
> + * xe_guc_pc_action_unset_param() - Revert to default value
> + * @pc: Xe_GuC_PC instance
> + * @id: Param id
> + *
> + * This function can be used revert any SLPC param to its default value.
> + *
> + * Returns: 0 on Success

ditto

> + */
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> +{
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +	return pc_action_unset_param(pc, id);
> +}
> +
>  static u32 decode_freq(u32 raw)
>  {
>  	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1045,31 +1076,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> -/**
> - * xe_guc_pc_override_gucrc_mode - override GUCRC mode
> - * @pc: Xe_GuC_PC instance
> - * @mode: new value of the mode.
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> -}
> -
> -/**
> - * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
> - * @pc: Xe_GuC_PC instance
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
> -}
> -
>  static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>  {
>  	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 1b95873b262e..0678a4e787b3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -9,15 +9,14 @@
>  #include <linux/types.h>
>  
>  struct xe_guc_pc;
> -enum slpc_gucrc_mode;
>  struct drm_printer;
>  
>  int xe_guc_pc_init(struct xe_guc_pc *pc);
>  int xe_guc_pc_start(struct xe_guc_pc *pc);
>  int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>  void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
>  
>  u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>  int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> index fc57e5290635..0a900c309ecf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -14,6 +14,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> +#include "xe_guc_pc.h"
>  #include "xe_guc_rc.h"
>  #include "xe_pm.h"
>  
> @@ -112,3 +113,32 @@ int xe_guc_rc_enable(struct xe_guc *guc)
>  
>  	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>  }
> +
> +/**
> + * xe_guc_rc_set_mode() - set GUCRC mode
> + * @guc: Xe GuC instance
> + * @mode: new value of the mode.
> + *
> + * Function to set GuC RC mode to one of the enum values.
> + *
> + * Returns: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
> +{
> +	guard(xe_pm_runtime)(guc_to_xe(guc));

are we sure we want to do full resume here?
maybe it should be:

	guard(xe_pm_runtime_noresume)

> +	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> +}
> +
> +/**
> + * xe_guc_rc_unset_mode() - revert to default mode
> + * @guc: Xe GuC instance
> + *
> + * Function to revert GuC RC mode to platform defaults.
> + *
> + * Returns: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_unset_mode(struct xe_guc *guc)
> +{
> +	guard(xe_pm_runtime)(guc_to_xe(guc));

ditto

> +	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> index c980b0fce472..d76dfad8e26c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -7,8 +7,11 @@
>  #define _XE_GUC_RC_H_
>  
>  struct xe_guc;
> +enum slpc_gucrc_mode;
>  
>  void xe_guc_rc_disable(struct xe_guc *guc);
>  int xe_guc_rc_enable(struct xe_guc *guc);
> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
> +int xe_guc_rc_unset_mode(struct xe_guc *guc);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index abf87fe0b345..f7752719b74f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -29,7 +29,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
> -#include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_oa.h"
> @@ -875,7 +875,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>  
>  	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>  	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));

as return real error code, not bool, maybe we should also print it?

>  
>  	xe_oa_free_configs(stream);
>  	xe_file_put(stream->xef);
> @@ -1765,8 +1765,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	 * state. Prevent this by overriding GUCRC mode.
>  	 */
>  	if (XE_GT_WA(stream->gt, 1509372804)) {
> -		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
> -						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> +		ret = xe_guc_rc_set_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>  		if (ret)
>  			goto err_free_configs;
>  
> @@ -1824,7 +1823,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(stream->oa->xe);

we should just place guc_rc calls when we still are holding rpm

>  	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>  err_free_configs:
>  	xe_oa_free_configs(stream);
>  exit:

