Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B02FC5B552
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 04:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05E910E258;
	Tue, 10 Jun 2025 04:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Is2Xqxet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71E10E258
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 04:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749531178; x=1781067178;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oxpEGIlzaQAnPw0FIrmqKKf7hKgWKf44Tcu0jECWgY4=;
 b=Is2XqxetJbq1/I7c5d7AwXlvjs4tff0zWFBX7Niuux1t+VDsGSojRClf
 Iczk+M9sRqbA3FqAgr6ab8igdANbfUeeQlKgWn3fWXMIVG5KHpcYxPNa+
 Zf7zUlXjlEXEkz1WGQA+4sw3NSG39PQEUC6PUDT4h0bAUoTY/YxKmX7ow
 ytW5m0D+zDJybuvQh0oPaPXNYocawW26Swn2epLef2WMqWcAoY7UTwbHc
 p3FPibvAF5eewLG3Fr3EJJEfe77bIASGJcRtyYaekhwHbQKwt6+47wp1M
 7TrKGA8enWFFfMb1Gb7g4K7b3mtiQ988SGt71ZoVCm5KZkpMSISrWrz/M g==;
X-CSE-ConnectionGUID: WSzQXJULSDqq2cy7Qz8kRA==
X-CSE-MsgGUID: UxJInF7QSJiMuWc+K23eig==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77023908"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="77023908"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:52:56 -0700
X-CSE-ConnectionGUID: LrW3CrlsQn2YEwUjCBi7tg==
X-CSE-MsgGUID: cyrSezUOSOiZb8SU0LK0/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="151968524"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:52:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 21:52:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 21:52:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 21:52:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcXWFs330SYHL7aj7Q48jrRfTQVESkPE2QRss41XPjpRN28cZKr7eKaZ/WpecCRkR9tnZgS7LK7/BLOPgTbNzBHq8IbYaei2hEw2AVEyMuldeCxhoWhF+hiYKVdeyIKTwXrS+5PLvC0JjfwD9CuN6VqBY4E/UigdiV+XOgNRng3yTpIJ3+k5jxgeI6XpfED7dheA5nDSLUYiic1I19JLsBES8mu+XkPe1zJneij4VNPAfNvI+LofMKrWxZW8ufigr5rgpzQ3BR5rdRf23AH59Kfevk2Wnf3on/fPsbgrPCjjJb5+7QOkoCW+IKUYvEIVR2NT1o8akMxgfDxfaEbE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Sxe4nqHusHJUKMs6/Opg0CjD1+O+2kDj9eu8Z51VLk=;
 b=E6NImjL8CHYH5ZdeHuDdFLJB7HmvAbQj3VNeBAF+zZp64f5+PaTU3zns9r+ozZaJWpjxyteUwA3Lh6p5NseaXDvZuGuGjA509VAFMngzpiAxt7sdnhOlZbZk7L7q2Oo2RWYJFCmN1HWGC1DBidjG96GKmVCZe5hNDyz9qPnhnlqWzMUXCx1v5MRfG/TkvbinZaXzC0oCOlC5op4OFpeM5uqJhmk9nCdqRB8noBRt/AGBs3jdz2rWegrR60VBBROJaJEkkTHtQ47jCDmy/JNsAatbouB+3wm+2r6N/Q5B3n0zutTyby03CZL4Tzt5y66NCWRssfOs9r58+1vlGNHmKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH0PR11MB4822.namprd11.prod.outlook.com
 (2603:10b6:510:39::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Tue, 10 Jun
 2025 04:52:48 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:52:48 +0000
Message-ID: <405470cd-db73-4380-9a68-78c607d10003@intel.com>
Date: Tue, 10 Jun 2025 10:22:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/19] drm/xe: Implement madvise ioctl for xe
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-11-himal.prasad.ghimiray@intel.com>
 <aDokTWyn942CBVXh@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDokTWyn942CBVXh@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::20) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f86035-86af-44ee-6846-08dda7daa575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NG5mYy9RSWc2RkZhRWdueHd2L3VRWitsb1Vrc2ZwVSt4Q2M3L2JZaTU1WFJX?=
 =?utf-8?B?MTZGaDd4Y3VDSFh1dHI3Q2w4dnBjNUg3bmhPT1RtcXhHc3MvcXNDeWhmQTBI?=
 =?utf-8?B?VkRlek16UGV6YUhpS0ZxcGhmVU5yR3NRZk1GT1RRcGZCOUNacmlFSTVJRzJQ?=
 =?utf-8?B?QkEvZzVwVURHay9JVkc5Qm95MzlROVdHSHdaMGk4RUYvSkhqbHpkS05Nek5V?=
 =?utf-8?B?N1RhdFdaT2NFYXZVSG4zZjA4L1JQNWlXcjNMU1BHc2xiQUdCNldCUjV3MWlH?=
 =?utf-8?B?ckg0eXZmajFVUXV1UkZQWVhmOTJPdFM3eGUwT3RwS09JTnRNWG1Bb051SjdH?=
 =?utf-8?B?R205T3N5UXMxakdXTFBwbXAzUHNXd2VTTkVrOURESTJSeGE2T3lDYjI2K0Nl?=
 =?utf-8?B?UjIxR1JzOG1yeDl3VFY1QWhIRjR3elY4b1BMWDU0MzRRbXRlTHMwVmt3MU5o?=
 =?utf-8?B?N2JPQkdzNDFIRlk5Z0RycGduWWE5aFRQS25RalFQWFZsQkZvVUFoS205eUhv?=
 =?utf-8?B?YlJSZEZ1ZGlLN1pOWjFieFVKSTAxNEl5eE9NeVZ2UEZjdnZrQ01MdWhGMlRS?=
 =?utf-8?B?UTFOdG9DVnNKTEoyaEhnWWx4Mk9UZGV4Q3dnNm9MWU5CMlY4ZXVrQk9idHlq?=
 =?utf-8?B?V0RQbVp4MEFJV2tnUWhXenN2QWdwcHpPY1M3T0JQMFdJcklhY0hMajZQMnpl?=
 =?utf-8?B?b0RGVEFlR2s3aGdrU1MwRCtjSkpaczFsc3NIeGxiVHhVLzI5M3V1TW9HWlpV?=
 =?utf-8?B?N1RDSW5GN1ZoL0hiVm04ZE5kUk5WOFp1UWY0Q1FDMnp5NE1ZVVo0aWhVbStz?=
 =?utf-8?B?Z0NxVnVrUFF4aStEVmZXc0dNTG5OZEhiRy96aWl1TFpjSUZacmNwUTBubjJZ?=
 =?utf-8?B?ZWpKZVFCRlJ6aThma29rTlJSaFF5MEJQU3MzV1lSMHVsMmJtbVRtVjBidVdh?=
 =?utf-8?B?VmxzcDVUYmtpR0YzazEraUVub0R1Zm9rVE1ZQjdRQ25hQkRFMUtwaGZuajlq?=
 =?utf-8?B?SzRSK251b2M5MG1melRacGdmSm1yTUZqRDcyQWFmTm1zaGR0cUtaTkRCWjc5?=
 =?utf-8?B?NWpzR2pIN3U1VXFiVm9GTkt4ZUhUaThDc0dnZHVueExaR1FMd1MrWGRPdmxH?=
 =?utf-8?B?eEphaFljUG13RG5YdUlhN1F4R3E2L3Jjb1c1V0JoOUMxZ0Q0K3BnTzZORHRn?=
 =?utf-8?B?WjVwL1FHNTNKZVNBUGF6aEYyaXhheWYrRUcwR1lRTzVUV09JK2o3SzcwSjdt?=
 =?utf-8?B?VStXTHRWWU93bnJNL1AzbHN6ZnVzdWdLM3h4SXpiNnpYRnlQY2tlcFprKzFO?=
 =?utf-8?B?WTJ3eG5mMzdnR3czZFBnY2ZKTFJ6ZGpzWXdielJtZXNGdG8vaFRZVk9YNDVh?=
 =?utf-8?B?eFRBMDZwdzhPVnVIazNDOHZFMmdYNld4Qng1N0FxLzYvNUtYQWJ2NEZ6Ymcr?=
 =?utf-8?B?NXVhRFRLcnRPOWxvNEk2N3UyUmFubWNBcXFiK1FSR2lBNFpMY1B0c0IrTzBw?=
 =?utf-8?B?N3daZDUzREpyUm9ZUTkvUUx5eFYxK0RjcW8yUWs1RENDTXZIclBHcWUrVi9Q?=
 =?utf-8?B?dUhPcUxyaHpzQzlmdC8rTDlDUFpyZG9wYmJJMi93ZWhwSXhscElxa1RIOHJT?=
 =?utf-8?B?Qkg0STVNSCt2OGJqcFRldmZqOGhLZGg3MlVHZ3ltQXI5OUZpTk1heVhkcmk3?=
 =?utf-8?B?NEFIaUVRekZrVWR4N3l4TWxjV1VYV2dnYUtKcUVmWGVyc2h1OXlRdmJXQ2xL?=
 =?utf-8?B?S29ITzI4L3dub3BBWmp4SGNYcFZOdWlFZzhkR2ViQ0NFSm9iQUlZbGZjOSt1?=
 =?utf-8?B?RGJ2b3dweDVqWmpLQVpvNVV5RDA4R0M3SFBZK1d3YTZWcXpybjdncGVkbStP?=
 =?utf-8?B?VVRhckVXM0ZaV0VXSytNUWRWcEs0citjK2xWYnFlbnM2bmZnaUhPSzFleUFQ?=
 =?utf-8?Q?T0a40eXG2/I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmNLU1UwNDMvUER3VWMyMkttaUo0M2xqNXYzUDRFWXB6YTVzdlA5d2hCb2Q1?=
 =?utf-8?B?OTQzTmk3YUcxU2l3ZThrTzhXVVdPYnAxNGJYWklNa1NmMEZQL0hYUzFQK0R2?=
 =?utf-8?B?Q2FEdm54UjdYRTNUb3Y3MEF3OEw3bXl4b1ppbDZFaXZ1R1hRUVlrMDhhR1h4?=
 =?utf-8?B?V2hsTnhPeGRDb2s4VVpLZkhhVTlSeExtbVd3bjlwRm5pTTFUWnRkVlpxenV6?=
 =?utf-8?B?TlFTRThPN1NuSWVqNXZVRDdXZXd2Wk9RaHJDSjVEWXNxTmhYaU5BMEJnWjdG?=
 =?utf-8?B?M2tEZ2p1bzZOSFNCZ24zRlp2WTc4VTRKQnRSZTdaVWlTcktGRkk0S2hDbmJK?=
 =?utf-8?B?VUI5SC91cWorMFVYazZSTTN4eFZaclh4M3hlb1hBVE9VLzdocGpPcXpoLzVv?=
 =?utf-8?B?ckIzV3FYd1VXUVVSNVk5TU1SdWpTeDhPeC9OT28rVWFkcE5pUzRBRmphOW5x?=
 =?utf-8?B?VWI5dDUvaUZ4OVRuQ3U1RjdVWGRCK09mZm15dUR0eEQ1V1kyS1ZPcUlWcWw2?=
 =?utf-8?B?TllqTEpnZDV4eE9UM1JYK0lCS0tqaDkrWG1aNWN6dUVRWjRiK3RGT21TcmR0?=
 =?utf-8?B?M1lpY0llc2JvaWRkeFBoM3UzT2dwWkl4TVlxSlhOcldhRVlFZ1E0NkVCbFUz?=
 =?utf-8?B?UnZhR0JFQjhuZ2tTN0lpYnFSbVNZc1VOL3BYWXlWVmtIaG5zb3c1Vkx0dWRV?=
 =?utf-8?B?Uk1xd3RKcElvS2pnSHJleElkTnlQM20vVm1ON1ZMblU4MHFWZVhEM0o5Zi9o?=
 =?utf-8?B?L1kvS0xNVk1LTUtLT1JDdEI5Nm1QQTZKSXhtNGxKUUtCeldKSFBiRHhiRm42?=
 =?utf-8?B?UlFBNDY0MEpiNm5UVnU2cnNaODkvaGVkeUdIaERFZkdnTHgzVlZpZ3ZjZ3lt?=
 =?utf-8?B?WVRZSXUwQ1RyOHhTU0JBMmY5eVRpQTNMZTltdGI5NXdYOU9pMDVxd1FxYUlL?=
 =?utf-8?B?RDZQWmVBMWdNd3ZtWmFUc3JVWW51bDAyV3lSYVdYVFMySUU4SlV3OGhBdWts?=
 =?utf-8?B?RndGcTdwUlIzTXYvZHFUKy8rbFBOV3VMcUpxOGJ6ZEZnOG1pUkNoR2dpVVRY?=
 =?utf-8?B?K0tsUUJCSDcybXFYVGlDYXhobTdlT0ttUFVpenFjaU5QMlk1ZDdoNkJZUU5P?=
 =?utf-8?B?UVJSdjdjaEFhVmtia0hmOHRNaHNtQmhGd0JEbUpNTFZJYVZzVjEraEVxbzFG?=
 =?utf-8?B?T1o3aGRrOG1jOWpQbnFWblhVREY3NXZqcWZ4VnRUOVhOTXc1NTQvT0IvbElX?=
 =?utf-8?B?cTN6YWF1N0hqcU1hN3lzRDRMalFlZ09WeHlYNmpUU0JNQ0FKcUl3Zk9haFlh?=
 =?utf-8?B?VVZRelB0MG9mQkEvUk9kSENqVnNuNnhuM3p6M1lFcjBTYkZoTU1sVTQwNVRG?=
 =?utf-8?B?emhiRklPOXNGdGw4RDl6Q01PZ3RKUFJXbmFvSDloczV6UXRBYlZ6TkdUK1Br?=
 =?utf-8?B?OTFrUWU4ZHJyVWRQa1B0Vk9ReHYzV2pQSkxsbExMNmtBT3l0aVpkcE4vdHBm?=
 =?utf-8?B?czRtZUZkRDNtcm1HLzhTNnM1OXBSS0Y1TnNxRDVmcU9DeUZaa3JWR1ZsYWRq?=
 =?utf-8?B?WmlkS0x5NkFDaFRZM3ZpNWdPYVVENzRtbFVta0Fua2g2UkMxRUZRK0Z5MDJ3?=
 =?utf-8?B?U1VBeENtWU85a3ZzR3VMaENvakw2dFVTK0todjFacUJJZVo0cnZYQ3ZNUXBu?=
 =?utf-8?B?cmd3b2xzWGRkbjg4S08xVVFzZXYrZjBYaG45RHdYLzRKQ01tUFZyZU11L1Vy?=
 =?utf-8?B?bWJGL0N2V1NuUVc5RkZQcUVjK1lzMGdiQUVuQXpWMmp5QkJzTkl1SkoweGp1?=
 =?utf-8?B?NjdPQ0xHeG81NGxhcWZSOGVHb1JyR2lYSHVJbVAzWjdnM0F1TE5ja1RFVDlt?=
 =?utf-8?B?V3F1aXFqV0ZwTFBTUXdnQjRZQmhHWWhaNjVoRFRuditnaWhxUmZjKzVQWW5Z?=
 =?utf-8?B?dzZPMTZ2cWoxRFpSaDl5VE8ydFNkTGhLeG0rQS9GVDJTT0MvcnZSUExRYkp2?=
 =?utf-8?B?eXZXc1JwRDVSZy83NCtqRThkV2ZFL0tWMHp3UnZWdTFYSmd4WWRKNHZaeklK?=
 =?utf-8?B?QjdTUW1jdzZQc0NOejFLZFBWVGR5bG1wUkhCbjd5ZEp6L3ROeGZOZmduWGZl?=
 =?utf-8?B?TGxyS015R01xVlpnaEhiMlVtVWVkOTFEbGVZT016OWJBcEtja09kMURSYzdL?=
 =?utf-8?Q?OVLQxoeB7TD1GqPJGe1HtN4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f86035-86af-44ee-6846-08dda7daa575
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:52:48.0484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9IbaFM+WCx1chMc2l3qqrKGfS9Vh0EpAiYW3eHip5om2y48NGM3OXUAzpVDtmSqYKcutTXjOVAOzf3e2lw+WPIMnT7BU86IuBiGpZoL7pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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



On 31-05-2025 03:04, Matthew Brost wrote:
> On Tue, May 27, 2025 at 10:09:54PM +0530, Himal Prasad Ghimiray wrote:
>> This driver-specific ioctl enables UMDs to control the memory attributes
>> for GPU VMAs within a specified input range. If the start or end
>> addresses fall within an existing VMA, the VMA is split accordingly. The
>> attributes of the VMA are modified as provided by the users. The old
>> mappings of the VMAs are invalidated, and TLB invalidation is performed
>> if necessary.
>>
>> v2(Matthew brost)
>> - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non
>> fault mode too
>> - fix tlb invalidation skip for same ranges in multiple op
>> - use helper for tlb invalidation
>> - use xe_svm_notifier_lock/unlock helper
>> - s/lockdep_assert_held/lockdep_assert_held_write
>> - Add kernel-doc
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>   drivers/gpu/drm/xe/xe_device.c     |   2 +
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 264 +++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm_madvise.h |  15 ++
>>   4 files changed, 282 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index c5d6681645ed..dc64bdcddfdc 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>   	xe_uc.o \
>>   	xe_uc_fw.o \
>>   	xe_vm.o \
>> +	xe_vm_madvise.o \
>>   	xe_vram.o \
>>   	xe_vram_freq.o \
>>   	xe_vsec.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index d4b6e623aa48..b9791c614749 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -61,6 +61,7 @@
>>   #include "xe_ttm_stolen_mgr.h"
>>   #include "xe_ttm_sys_mgr.h"
>>   #include "xe_vm.h"
>> +#include "xe_vm_madvise.h"
>>   #include "xe_vram.h"
>>   #include "xe_vsec.h"
>>   #include "xe_wait_user_fence.h"
>> @@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>>   			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>>   };
>>   
>>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> new file mode 100644
>> index 000000000000..f7edefe5f6cf
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -0,0 +1,264 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include "xe_vm_madvise.h"
>> +
>> +#include <linux/nospec.h>
>> +#include <drm/ttm/ttm_tt.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "xe_bo.h"
>> +#include "xe_gt_tlb_invalidation.h"
>> +#include "xe_pt.h"
>> +#include "xe_svm.h"
>> +
>> +static struct xe_vma **get_vmas(struct xe_vm *vm, int *num_vmas,
>> +				u64 addr, u64 range)
>> +{
>> +	struct xe_vma **vmas, **__vmas;
>> +	struct drm_gpuva *gpuva;
>> +	int max_vmas = 8;
>> +
>> +	lockdep_assert_held(&vm->lock);
>> +
>> +	*num_vmas = 0;
>> +	vmas = kmalloc_array(max_vmas, sizeof(*vmas), GFP_KERNEL);
>> +	if (!vmas)
>> +		return NULL;
>> +
>> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx, end=0x%016llx", addr, addr + range);
>> +
>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +		if (*num_vmas == max_vmas) {
>> +			max_vmas <<= 1;
>> +			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas), GFP_KERNEL);
>> +			if (!__vmas) {
>> +				kfree(vmas);
>> +				return NULL;
>> +			}
>> +			vmas = __vmas;
>> +		}
>> +
>> +		vmas[*num_vmas] = vma;
>> +		(*num_vmas)++;
>> +	}
>> +
>> +	vm_dbg(&vm->xe->drm, "*num_vmas = %d\n", *num_vmas);
>> +
>> +	if (!*num_vmas) {
>> +		kfree(vmas);
>> +		return NULL;
>> +	}
>> +
>> +	return vmas;
>> +}
>> +
>> +static int madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
>> +				     struct xe_vma **vmas, int num_vmas,
>> +				     struct drm_xe_madvise_ops ops)
>> +{
>> +	/* Implementation pending */
>> +	return 0;
>> +}
>> +
>> +static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>> +			  struct xe_vma **vmas, int num_vmas,
>> +			  struct drm_xe_madvise_ops ops)
>> +{
>> +	/* Implementation pending */
>> +	return 0;
>> +}
>> +
>> +static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>> +			     struct xe_vma **vmas, int num_vmas,
>> +			     struct drm_xe_madvise_ops ops)
>> +{
>> +	/* Implementation pending */
>> +	return 0;
>> +}
>> +
>> +static int madvise_purgeable_state(struct xe_device *xe, struct xe_vm *vm,
>> +				   struct xe_vma **vmas, int num_vmas,
>> +				   struct drm_xe_madvise_ops ops)
>> +{
>> +	/* Implementation pending */
>> +	return 0;
>> +}
>> +
>> +typedef int (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>> +			    struct xe_vma **vmas, int num_vmas, struct drm_xe_madvise_ops ops);
>> +
>> +static const madvise_func madvise_funcs[] = {
>> +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] = madvise_preferred_mem_loc,
>> +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
>> +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index,
>> +	[DRM_XE_VMA_ATTR_PURGEABLE_STATE] = madvise_purgeable_state,
>> +};
>> +
>> +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start, u64 end, u8 *tile_mask)
>> +{
>> +	struct drm_gpuva *gpuva;
>> +	struct xe_tile *tile;
>> +	u8 id;
>> +
>> +	lockdep_assert_held_write(&vm->lock);
>> +
>> +	if (dma_resv_wait_timeout(xe_vm_resv(vm), DMA_RESV_USAGE_BOOKKEEP,
>> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
>> +		XE_WARN_ON(1);
>> +
>> +	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
>> +
>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +		if (xe_vma_is_cpu_addr_mirror(vma))
>> +			continue;
>> +
>> +		if (xe_vma_is_userptr(vma)) {
>> +			WARN_ON_ONCE(!mmu_interval_check_retry
>> +				    (&to_userptr_vma(vma)->userptr.notifier,
>> +				     to_userptr_vma(vma)->userptr.notifier_seq));
>> +
>> +			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>> +							     DMA_RESV_USAGE_BOOKKEEP));
>> +		}
>> +
>> +		if (xe_vma_bo(vma))
>> +			xe_bo_lock(xe_vma_bo(vma), false);
>> +
>> +		for_each_tile(tile, vm->xe, id) {
>> +			if (xe_pt_zap_ptes(tile, vma))
>> +				*tile_mask |= BIT(id);
>> +		}
>> +
>> +		if (xe_vma_bo(vma))
>> +			xe_bo_unlock(xe_vma_bo(vma));
>> +	}
>> +}
>> +
>> +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start, u64 end)
>> +{
>> +	u8 tile_mask = 0;
>> +
>> +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
>> +	if (!tile_mask)
>> +		return 0;
>> +
>> +	xe_device_wmb(vm->xe);
>> +
>> +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end, tile_mask);
>> +}
>> +
>> +static int input_ranges_same(struct drm_xe_madvise_ops *old,
>> +			     struct drm_xe_madvise_ops *new)
>> +{
>> +	return (new->start == old->start && new->range == old->range);
>> +}
>> +
>> +/**
>> + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
>> + * @dev: DRM device pointer
>> + * @data: Pointer to ioctl data (drm_xe_madvise*)
>> + * @file: DRM file pointer
>> + *
>> + * Handles the MADVISE ioctl to provide memory advice for vma's within
>> + * input range.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> +{
>> +	struct xe_device *xe = to_xe_device(dev);
>> +	struct xe_file *xef = to_xe_file(file);
>> +	struct drm_xe_madvise_ops *advs_ops;
>> +	struct drm_xe_madvise *args = data;
>> +	struct xe_vm *vm;
>> +	struct xe_vma **vmas = NULL;
>> +	int num_vmas, err = 0;
>> +	int i, j, attr_type;
>> +	bool needs_invalidation;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->num_ops < 1))
>> +		return -EINVAL;
>> +
>> +	vm = xe_vm_lookup(xef, args->vm_id);
>> +	if (XE_IOCTL_DBG(xe, !vm))
>> +		return -EINVAL;
>> +
>> +	down_write(&vm->lock);
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
>> +		err = -ENOENT;
>> +		goto unlock_vm;
>> +	}
>> +
>> +	if (args->num_ops > 1) {
>> +		u64 __user *madvise_user = u64_to_user_ptr(args->vector_of_ops);
>> +
>> +		advs_ops = kvmalloc_array(args->num_ops, sizeof(struct drm_xe_madvise_ops),
>> +					  GFP_KERNEL | __GFP_ACCOUNT |
>> +					  __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>> +		if (!advs_ops) {
>> +			err =  args->num_ops > 1 ? -ENOBUFS : -ENOMEM;
>> +			goto unlock_vm;
>> +		}
>> +
>> +		err = __copy_from_user(advs_ops, madvise_user,
>> +				       sizeof(struct drm_xe_madvise_ops) *
>> +				       args->num_ops);
>> +		if (XE_IOCTL_DBG(xe, err)) {
>> +			err = -EFAULT;
>> +			goto free_advs_ops;
>> +		}
>> +	} else {
>> +		advs_ops = &args->ops;
>> +	}
>> +
>> +	for (i = 0; i < args->num_ops; i++) {
>> +		xe_vm_alloc_madvise_vma(vm, advs_ops[i].start, advs_ops[i].range);
>> +
>> +		vmas = get_vmas(vm, &num_vmas, advs_ops[i].start, advs_ops[i].range);
>> +		if (!vmas) {
>> +			err = -ENOMEM;
>> +			goto free_advs_ops;
>> +		}
>> +
>> +		attr_type = array_index_nospec(advs_ops[i].type, ARRAY_SIZE(madvise_funcs));
>> +		err = madvise_funcs[attr_type](xe, vm, vmas, num_vmas, advs_ops[i]);
>> +
>> +		kfree(vmas);
>> +		vmas = NULL;
>> +
>> +		if (err)
>> +			goto free_advs_ops;
>> +	}
>> +
>> +	for (i = 0; i < args->num_ops; i++) {
>> +		needs_invalidation = true;
>> +		for (j = i + 1; j < args->num_ops; ++j) {
>> +			if (input_ranges_same(&advs_ops[j], &advs_ops[i])) {
>> +				needs_invalidation = false;
>> +				break;
>> +			}
>> +		}
>> +		if (needs_invalidation) {
>> +			err = xe_vm_invalidate_madvise_range(vm, advs_ops[i].start,
>> +							     advs_ops[i].start + advs_ops[i].range);
>> +			if (err)
>> +				goto free_advs_ops;
> 
> In additional to all the other comments around invalidations - you don't
> always need to issue TLB invalidations.
> 
> - For pat_index, only if the VMAs pat_index changed + valid page tables
> - For atomic, only if the VMAs atomic mode changed + valid page tables +
>    current placement would cause issues
> - Purgeable - never
> - Preferred placement - valid page tables + current placement != desired
>    placement
> 
> We likley can set a temp bit in the vfuncs in either the VMA (BO,
> userptr based) or the SVM range(s) which the invalidation func can parse
> / clear indicating an invalidation is required.

In the current implementation, I’m zapping PTEs for SVM ranges and 
BO/Userptr-based VMAs within the madvise range, and issuing a TLB 
invalidation for the entire madvise range. Should we instead issue TLB 
invalidations at the granularity of the SVM range or the individual VMA 
(BO or Userptr)? I don’t see how we can avoid TLB invalidation if some 
VMAs require it and others don’t, given that we’re currently 
invalidating the entire range.

> 
> Matt
> 
>> +		}
>> +	}
>> +
>> +free_advs_ops:
>> +	if (args->num_ops > 1)
>> +		kvfree(advs_ops);
>> +unlock_vm:
>> +	up_write(&vm->lock);
>> +	xe_vm_put(vm);
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> new file mode 100644
>> index 000000000000..c5cdd058c322
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_VM_MADVISE_H_
>> +#define _XE_VM_MADVISE_H_
>> +
>> +struct drm_device;
>> +struct drm_file;
>> +
>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>> +			struct drm_file *file);
>> +
>> +#endif
>> -- 
>> 2.34.1
>>

